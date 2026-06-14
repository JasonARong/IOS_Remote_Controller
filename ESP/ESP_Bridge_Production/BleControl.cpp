// BleControl.cpp - production BLE fallback, setup/status, and safety path.

#include "BleControl.h"

#include <NimBLEDevice.h>
#include <WiFi.h>
#include <string>

#include "Config.h"
#include "Diagnostics.h"
#include "HidState.h"
#include "OwnerSession.h"
#include "PersistentStore.h"
#include "UdpMotion.h"
#include "UsbHid.h"
#include "WifiTcpControl.h"

static constexpr size_t BLE_CONTROL_HEADER_LENGTH = 10;

static NimBLEServer* bleServer = nullptr;
static NimBLECharacteristic* bleRxCharacteristic = nullptr;
static NimBLECharacteristic* bleTxCharacteristic = nullptr;
static bool bleStarted = false;
static volatile bool bleClientConnected = false;
static bool bleAuthenticated = false;
static bool bleOwnsHid = false;
static uint32_t blePhoneId = 0;
static uint32_t bleSessionId = 0;
static uint8_t bleLastButtons = 0;

enum PendingBleOperation : uint8_t {
  BLE_PENDING_NONE = 0,
  BLE_PENDING_SCAN_WIFI = 1,
  BLE_PENDING_SET_WIFI = 2,
};

static PendingBleOperation pendingOperation = BLE_PENDING_NONE;
static uint32_t pendingRequestId = 0;
static char pendingSsid[PERSISTENT_MAX_SSID_LENGTH + 1] = {0};
static char pendingPassword[PERSISTENT_MAX_WIFI_PASSWORD_LENGTH + 1] = {0};

struct BleFrame {
  uint8_t type = 0;
  uint32_t requestId = 0;
  const uint8_t* payload = nullptr;
  uint8_t payloadLength = 0;
};

struct PayloadReader {
  const uint8_t* data = nullptr;
  size_t len = 0;
  size_t pos = 0;

  bool readU8(uint8_t* out) {
    if (pos + 1 > len) return false;
    *out = data[pos++];
    return true;
  }

  bool readU32(uint32_t* out) {
    if (pos + 4 > len) return false;
    *out = (uint32_t)data[pos] |
           ((uint32_t)data[pos + 1] << 8) |
           ((uint32_t)data[pos + 2] << 16) |
           ((uint32_t)data[pos + 3] << 24);
    pos += 4;
    return true;
  }

  bool readBytes(const uint8_t** out, uint8_t* countOut) {
    uint8_t count = 0;
    if (!readU8(&count) || pos + count > len) return false;
    *out = &data[pos];
    *countOut = count;
    pos += count;
    return true;
  }

  bool readString(char* out, size_t capacity) {
    const uint8_t* bytes = nullptr;
    uint8_t count = 0;
    if (!readBytes(&bytes, &count) || out == nullptr || capacity == 0) return false;
    size_t copyLen = count;
    if (copyLen >= capacity) copyLen = capacity - 1;
    memcpy(out, bytes, copyLen);
    out[copyLen] = '\0';
    return true;
  }

  bool fullyRead() const {
    return pos == len;
  }
};

struct PayloadWriter {
  uint8_t data[BLE_CONTROL_MAX_PAYLOAD_LENGTH];
  size_t len = 0;
  bool ok = true;

  void writeU8(uint8_t value) {
    if (len + 1 > sizeof(data)) {
      ok = false;
      return;
    }
    data[len++] = value;
  }

  void writeBool(bool value) {
    writeU8(value ? 1 : 0);
  }

  void writeU16(uint16_t value) {
    if (len + 2 > sizeof(data)) {
      ok = false;
      return;
    }
    data[len++] = (uint8_t)(value & 0xff);
    data[len++] = (uint8_t)((value >> 8) & 0xff);
  }

  void writeU32(uint32_t value) {
    if (len + 4 > sizeof(data)) {
      ok = false;
      return;
    }
    data[len++] = (uint8_t)(value & 0xff);
    data[len++] = (uint8_t)((value >> 8) & 0xff);
    data[len++] = (uint8_t)((value >> 16) & 0xff);
    data[len++] = (uint8_t)((value >> 24) & 0xff);
  }

  void writeBytes(const uint8_t* bytes, uint8_t count) {
    if (len + 1 + count > sizeof(data)) {
      ok = false;
      return;
    }
    data[len++] = count;
    for (uint8_t i = 0; i < count; i++) data[len++] = bytes[i];
  }

  void writeString(const char* value) {
    size_t stringLen = strlen(value);
    if (stringLen > 255) stringLen = 255;
    if (len + 1 + stringLen > sizeof(data)) {
      ok = false;
      return;
    }
    data[len++] = (uint8_t)stringLen;
    for (size_t i = 0; i < stringLen; i++) data[len++] = (uint8_t)value[i];
  }
};

static uint16_t readLe16(const uint8_t* bytes) {
  return (uint16_t)bytes[0] | ((uint16_t)bytes[1] << 8);
}

static uint32_t readLe32(const uint8_t* bytes) {
  return (uint32_t)bytes[0] |
         ((uint32_t)bytes[1] << 8) |
         ((uint32_t)bytes[2] << 16) |
         ((uint32_t)bytes[3] << 24);
}

static void writeLe32(uint8_t* bytes, uint32_t value) {
  bytes[0] = (uint8_t)(value & 0xff);
  bytes[1] = (uint8_t)((value >> 8) & 0xff);
  bytes[2] = (uint8_t)((value >> 16) & 0xff);
  bytes[3] = (uint8_t)((value >> 24) & 0xff);
}

static uint32_t foldPhoneId(const uint8_t* data, uint8_t len) {
  uint32_t value = 2166136261UL;
  for (uint8_t i = 0; i < len; i++) {
    value ^= data[i];
    value *= 16777619UL;
  }
  return value == 0 ? 1 : value;
}

static bool copyOpaqueText(const uint8_t* bytes, uint8_t len,
                           char* out, size_t capacity) {
  if (bytes == nullptr || len == 0 || out == nullptr || capacity == 0) return false;
  size_t copyLen = len;
  if (copyLen >= capacity) copyLen = capacity - 1;
  for (size_t i = 0; i < copyLen; i++) {
    if (bytes[i] == 0) return false;
    out[i] = (char)bytes[i];
  }
  out[copyLen] = '\0';
  return true;
}

static void clearBleOwnerLocal() {
  bleOwnsHid = false;
  bleSessionId = 0;
  bleLastButtons = 0;
}

static void syncBleOwnerLocalState() {
  if (bleOwnsHid && !acceptBleHidForOwner(bleSessionId)) {
    clearBleOwnerLocal();
  }
}

static bool sendControlFrame(uint8_t type, uint32_t requestId,
                             const uint8_t* payload, uint8_t payloadLength) {
  if (!bleTxCharacteristic || !bleClientConnected) return false;
  if (payloadLength > BLE_CONTROL_MAX_PAYLOAD_LENGTH) return false;

  uint8_t frame[BLE_CONTROL_HEADER_LENGTH + BLE_CONTROL_MAX_PAYLOAD_LENGTH];
  frame[0] = BLE_CONTROL_MARKER;
  frame[1] = BLE_CONTROL_FRAME_VERSION;
  frame[2] = type;
  writeLe32(&frame[3], requestId);
  frame[7] = 0;
  frame[8] = 1;
  frame[9] = payloadLength;
  for (uint8_t i = 0; i < payloadLength; i++) {
    frame[BLE_CONTROL_HEADER_LENGTH + i] = payload[i];
  }

  bleTxCharacteristic->setValue(frame, BLE_CONTROL_HEADER_LENGTH + payloadLength);
  bleTxCharacteristic->notify();
  diag.bleFramesTx++;
  return true;
}

static void sendError(BleErrorCode code, uint32_t requestId, const char* message) {
  PayloadWriter writer;
  writer.writeU16((uint16_t)code);
  writer.writeU32(requestId);
  writer.writeString(message);
  if (writer.ok) {
    sendControlFrame(BLE_CTRL_ERROR, requestId, writer.data, (uint8_t)writer.len);
  }
}

static void sendPairResult(uint32_t requestId, bool accepted, uint8_t reason) {
  PayloadWriter writer;
  writer.writeBool(accepted);
  writer.writeU8(reason);
  if (writer.ok) {
    sendControlFrame(BLE_CTRL_PAIR_RESULT, requestId, writer.data, (uint8_t)writer.len);
  }
}

static void sendOwnerResult(uint32_t requestId, const OwnerClaimResult& claim) {
  PayloadWriter writer;
  writer.writeBool(claim.granted);
  writer.writeU8((uint8_t)claim.reason);
  writer.writeU32(claim.sessionId);
  if (writer.ok) {
    sendControlFrame(BLE_CTRL_OWNER_RESULT, requestId, writer.data, (uint8_t)writer.len);
  }
}

static void sendCommandResult(uint32_t requestId, uint8_t commandType,
                              bool success, uint8_t reason,
                              const char* message) {
  PayloadWriter writer;
  writer.writeU8(commandType);
  writer.writeBool(success);
  writer.writeU8(reason);
  writer.writeString(message);
  if (writer.ok) {
    sendControlFrame(BLE_CTRL_COMMAND_RESULT, requestId, writer.data,
                     (uint8_t)writer.len);
  }
}

static void sendStatusResponse(uint32_t requestId) {
  syncBleOwnerLocalState();
  OwnerSnapshot owner = getOwnerSnapshot(millis());
  uint8_t activeMode = 0;
  portENTER_CRITICAL(&hidStateMux);
  activeMode = (uint8_t)hidState.activeMode;
  portEXIT_CRITICAL(&hidStateMux);

  bool owned = owner.state.ownerKind != OWNER_NONE;
  bool ownedByThisSession = owned &&
                            owner.state.ownerKind == OWNER_BLE &&
                            bleOwnsHid &&
                            owner.state.sessionId == bleSessionId;
  char deviceId[PERSISTENT_MAX_DEVICE_ID_LENGTH + 1] = "ESP3";
  getPersistentDeviceId(deviceId, sizeof(deviceId));

  PayloadWriter writer;
  writer.writeU32(requestId);
  writer.writeU8(activeMode);
  writer.writeBool(WiFi.status() == WL_CONNECTED);
  writer.writeBool(bleClientConnected);
  writer.writeBool(isUsbHidMounted());
  writer.writeBool(owned);
  writer.writeBool(ownedByThisSession);
  writer.writeString(TCP_CONTROL_FIRMWARE_VERSION);
  writer.writeU16(TCP_CONTROL_PROTOCOL_VERSION);
  writer.writeU32(TCP_CONTROL_CAPABILITIES);
  writer.writeBytes((const uint8_t*)deviceId, (uint8_t)strlen(deviceId));
  if (writer.ok) {
    sendControlFrame(BLE_CTRL_STATUS_RESPONSE, requestId, writer.data,
                     (uint8_t)writer.len);
  } else {
    sendError(BLE_ERROR_PAYLOAD_TOO_LARGE, requestId, "status too large");
  }
}

static bool requireAuthenticated(uint32_t requestId) {
  if (bleAuthenticated) return true;
  sendError(BLE_ERROR_NOT_AUTHENTICATED, requestId, "pair required");
  return false;
}

static bool requireBleOwner(uint32_t requestId, uint32_t sessionId) {
  syncBleOwnerLocalState();
  if (bleOwnsHid && bleSessionId == sessionId &&
      acceptBleHidForOwner(sessionId)) {
    return true;
  }
  sendError(BLE_ERROR_NOT_OWNER, requestId, "not ble owner");
  return false;
}

static void handlePair(const BleFrame& frame) {
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  const uint8_t* phoneIdBytes = nullptr;
  const uint8_t* proofBytes = nullptr;
  uint8_t phoneIdLen = 0;
  uint8_t proofLen = 0;
  if (!reader.readBytes(&phoneIdBytes, &phoneIdLen) ||
      !reader.readBytes(&proofBytes, &proofLen) ||
      !reader.fullyRead()) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "bad pair");
    return;
  }

  uint32_t phoneHash = foldPhoneId(phoneIdBytes, phoneIdLen);
  bool accepted = false;
  if (hasStoredPairingIdentity()) {
    accepted = validateStoredPairingProof(phoneHash, proofBytes, proofLen);
  } else {
    char phoneText[PERSISTENT_MAX_PHONE_ID_LENGTH + 1] = {0};
    char proofText[PERSISTENT_MAX_PAIRING_SECRET_LENGTH + 1] = {0};
    accepted = copyOpaqueText(phoneIdBytes, phoneIdLen, phoneText, sizeof(phoneText)) &&
               copyOpaqueText(proofBytes, proofLen, proofText, sizeof(proofText)) &&
               saveStoredPairingIdentity(phoneHash, phoneText, proofText);
  }

  bleAuthenticated = accepted;
  blePhoneId = accepted ? phoneHash : 0;
  sendPairResult(frame.requestId, accepted, accepted ? 0 : BLE_ERROR_AUTH_FAILED);
  if (!accepted) {
    sendError(BLE_ERROR_AUTH_FAILED, frame.requestId, "pair proof rejected");
  }
}

static void handleClaimOwner(const BleFrame& frame) {
  if (!requireAuthenticated(frame.requestId)) return;
  if (frame.payloadLength != 0) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "claim owner has no payload");
    return;
  }

  OwnerClaimResult claim = claimBleOwner(blePhoneId, millis());
  bleOwnsHid = claim.granted;
  bleSessionId = claim.sessionId;
  bleLastButtons = 0;
  sendOwnerResult(frame.requestId, claim);
  if (!claim.granted) {
    sendError(BLE_ERROR_ALREADY_OWNED, frame.requestId, "already owned");
  }
}

static void handleReleaseOwner(const BleFrame& frame) {
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t sessionId = 0;
  uint8_t reason = RELEASE_REASON_MODE_SWITCH;
  if (!reader.readU32(&sessionId) || !reader.readU8(&reason) || !reader.fullyRead()) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "bad release owner");
    return;
  }
  if (!requireBleOwner(frame.requestId, sessionId)) return;
  releaseOwner(sessionId, OWNER_BLE, (ReleaseReason)reason);
  clearBleOwnerLocal();
}

static void handleHeartbeat(const BleFrame& frame) {
  syncBleOwnerLocalState();
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t sessionId = 0;
  if (!reader.readU32(&sessionId) || !reader.fullyRead()) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "bad heartbeat");
    return;
  }
  if (!bleOwnsHid || bleSessionId != sessionId ||
      !refreshOwnerHeartbeat(sessionId, OWNER_BLE, millis())) {
    sendError(BLE_ERROR_NOT_OWNER, frame.requestId, "heartbeat rejected");
  }
}

static void handleReleaseAll(const BleFrame& frame) {
  syncBleOwnerLocalState();
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t sessionId = 0;
  uint8_t reason = RELEASE_REASON_USER_EMERGENCY;
  if (!reader.readU32(&sessionId) || !reader.readU8(&reason) || !reader.fullyRead()) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "bad release all");
    return;
  }

  if (bleOwnsHid) {
    if (!acceptBleControlAndRefresh(sessionId, millis())) {
      sendError(BLE_ERROR_NOT_OWNER, frame.requestId, "release all rejected");
      return;
    }
    releaseAllHidState((ReleaseReason)reason);
    bleLastButtons = 0;
    return;
  }

  if (!bleAuthenticated || sessionId != 0) {
    sendError(BLE_ERROR_NOT_OWNER, frame.requestId, "safety release requires auth");
    return;
  }
  releaseAllHidState((ReleaseReason)reason);
  bleLastButtons = 0;
}

static void handleStatusRequest(const BleFrame& frame) {
  if (frame.payloadLength != 0) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "status has no payload");
    return;
  }
  sendStatusResponse(frame.requestId);
}

static void scheduleWifiScan(const BleFrame& frame) {
  if (!requireAuthenticated(frame.requestId)) return;
  if (frame.payloadLength != 0) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "scan has no payload");
    return;
  }
  pendingOperation = BLE_PENDING_SCAN_WIFI;
  pendingRequestId = frame.requestId;
}

static void scheduleWifiConnect(const BleFrame& frame) {
  if (!requireAuthenticated(frame.requestId)) return;
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  char ssid[PERSISTENT_MAX_SSID_LENGTH + 1] = {0};
  char password[PERSISTENT_MAX_WIFI_PASSWORD_LENGTH + 1] = {0};
  if (!reader.readString(ssid, sizeof(ssid)) ||
      !reader.readString(password, sizeof(password)) ||
      !reader.fullyRead() ||
      ssid[0] == '\0') {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "bad wifi credentials");
    return;
  }

  snprintf(pendingSsid, sizeof(pendingSsid), "%s", ssid);
  snprintf(pendingPassword, sizeof(pendingPassword), "%s", password);
  pendingOperation = BLE_PENDING_SET_WIFI;
  pendingRequestId = frame.requestId;
}

static void handleListSavedWifi(const BleFrame& frame) {
  if (!requireAuthenticated(frame.requestId)) return;
  if (frame.payloadLength != 0) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "list saved has no payload");
    return;
  }

  uint8_t sent = 0;
  uint8_t count = getStoredWifiProfileCount();
  for (uint8_t i = 0; i < count; i++) {
    StoredWifiProfile profile;
    if (!getStoredWifiProfile(i, &profile)) continue;
    PayloadWriter entry;
    entry.writeString(profile.ssid);
    if (entry.ok) {
      sendControlFrame(BLE_CTRL_SAVED_WIFI_ENTRY, frame.requestId, entry.data,
                       (uint8_t)entry.len);
      sent++;
    }
  }

  PayloadWriter done;
  done.writeU8(sent);
  if (done.ok) {
    sendControlFrame(BLE_CTRL_SAVED_WIFI_DONE, frame.requestId, done.data,
                     (uint8_t)done.len);
  }
  diag.bleSetupOps++;
}

static void handleForgetWifi(const BleFrame& frame) {
  if (!requireAuthenticated(frame.requestId)) return;
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  char ssid[PERSISTENT_MAX_SSID_LENGTH + 1] = {0};
  if (!reader.readString(ssid, sizeof(ssid)) || !reader.fullyRead()) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "bad forget wifi");
    return;
  }
  bool removed = forgetStoredWifiProfile(ssid);
  sendCommandResult(frame.requestId, BLE_CTRL_FORGET_WIFI, removed,
                    removed ? 0 : BLE_ERROR_INVALID_STATE,
                    removed ? "wifi profile forgotten" : "wifi profile not found");
  diag.bleSetupOps++;
}

static void handleResetPairing(const BleFrame& frame) {
  if (!requireAuthenticated(frame.requestId)) return;
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint8_t reason = RELEASE_REASON_USER_EMERGENCY;
  if (!reader.readU8(&reason) || !reader.fullyRead()) {
    sendError(BLE_ERROR_BAD_FRAME, frame.requestId, "bad reset pairing");
    return;
  }

  sendCommandResult(frame.requestId, BLE_CTRL_RESET_PAIRING, true, 0,
                    "pairing identity cleared");
  releaseAllHidState((ReleaseReason)reason);
  resetOwnerSession();
  clearStoredPairingIdentity();
  bleAuthenticated = false;
  blePhoneId = 0;
  clearBleOwnerLocal();
  diag.bleSetupOps++;
}

static void handleControlFrame(const BleFrame& frame) {
  switch ((BleControlType)frame.type) {
    case BLE_CTRL_PAIR:
      handlePair(frame);
      break;
    case BLE_CTRL_CLAIM_OWNER:
      handleClaimOwner(frame);
      break;
    case BLE_CTRL_RELEASE_OWNER:
      handleReleaseOwner(frame);
      break;
    case BLE_CTRL_HEARTBEAT:
      handleHeartbeat(frame);
      break;
    case BLE_CTRL_RELEASE_ALL:
      handleReleaseAll(frame);
      break;
    case BLE_CTRL_STATUS_REQUEST:
      handleStatusRequest(frame);
      break;
    case BLE_CTRL_SCAN_WIFI:
      scheduleWifiScan(frame);
      break;
    case BLE_CTRL_SET_WIFI_CREDENTIALS:
      scheduleWifiConnect(frame);
      break;
    case BLE_CTRL_LIST_SAVED_WIFI:
      handleListSavedWifi(frame);
      break;
    case BLE_CTRL_FORGET_WIFI:
      handleForgetWifi(frame);
      break;
    case BLE_CTRL_RESET_PAIRING:
      handleResetPairing(frame);
      break;
    default:
      sendError(BLE_ERROR_UNKNOWN_MESSAGE, frame.requestId, "unknown ble message");
      break;
  }
}

static bool parseControlFrame(const uint8_t* data, size_t len) {
  if (len < BLE_CONTROL_HEADER_LENGTH || data[0] != BLE_CONTROL_MARKER) return false;

  uint8_t version = data[1];
  uint8_t type = data[2];
  uint32_t requestId = readLe32(&data[3]);
  uint8_t chunkIndex = data[7];
  uint8_t chunkCount = data[8];
  uint8_t payloadLength = data[9];

  if (version != BLE_CONTROL_FRAME_VERSION) {
    sendError(BLE_ERROR_UNSUPPORTED_VERSION, requestId, "bad ble version");
    return true;
  }
  if (chunkIndex != 0 || chunkCount != 1 ||
      len != BLE_CONTROL_HEADER_LENGTH + payloadLength ||
      payloadLength > BLE_CONTROL_MAX_PAYLOAD_LENGTH) {
    sendError(BLE_ERROR_BAD_FRAME, requestId, "bad ble frame");
    return true;
  }

  BleFrame frame;
  frame.type = type;
  frame.requestId = requestId;
  frame.payload = &data[BLE_CONTROL_HEADER_LENGTH];
  frame.payloadLength = payloadLength;
  diag.bleFramesRx++;
  handleControlFrame(frame);
  return true;
}

static void dispatchLegacyKeyCombo(const uint8_t* data, size_t len) {
  syncBleOwnerLocalState();
  if (len < 2) {
    diag.bleMalformed++;
    return;
  }
  uint8_t count = data[1];
  if (count == 0 || count > 3 || len != (size_t)(2 + count)) {
    diag.bleMalformed++;
    return;
  }
  if (!bleOwnsHid || !acceptBleHidForOwner(bleSessionId)) {
    diag.bleHidIgnored++;
    return;
  }
  refreshOwnerHeartbeat(bleSessionId, OWNER_BLE, millis());
  stageKeyboardCombo(&data[2], count);
  diag.bleHidAccepted++;
}

static void dispatchLegacyMouse(const uint8_t* data, size_t len) {
  syncBleOwnerLocalState();
  bool debugPacket = len == 8 && data[0] == BLE_DEBUG_MOUSE_MARKER;
  const uint8_t* mouse = debugPacket ? data + 2 : data;
  size_t mouseLen = debugPacket ? 6 : len;
  if (mouseLen != 6) {
    diag.bleMalformed++;
    return;
  }
  if (!bleOwnsHid || !acceptBleHidForOwner(bleSessionId)) {
    diag.bleHidIgnored++;
    return;
  }

  uint8_t buttons = mouse[0] & 0x03;
  int8_t wheel = (int8_t)mouse[1];
  int16_t dx = (int16_t)readLe16(&mouse[2]);
  int16_t dy = (int16_t)readLe16(&mouse[4]);
  bool reliableInput = wheel != 0 || buttons != bleLastButtons;

  if (reliableInput) {
    refreshOwnerHeartbeat(bleSessionId, OWNER_BLE, millis());
  }
  bleLastButtons = buttons;

  stageMouseButtons(buttons);
  stageWheelTicks(wheel);
  bool overflow = false;
  uint8_t depth = stagePointerMotion(dx, dy, &overflow);
  if (overflow) diag.udpQueueOverflow++;
  if (depth > diag.udpQueueDepthMax) diag.udpQueueDepthMax = depth;
  diag.bleHidAccepted++;
}

static void dispatchBleWrite(const uint8_t* data, size_t len) {
  if (data == nullptr || len == 0) return;

  if (data[0] == BLE_CONTROL_MARKER) {
    if (!parseControlFrame(data, len)) diag.bleMalformed++;
    return;
  }
  if (data[0] == BLE_KEY_COMBO_MARKER) {
    dispatchLegacyKeyCombo(data, len);
    return;
  }
  if ((data[0] <= 0x9f && len == 6) ||
      (data[0] == BLE_DEBUG_MOUSE_MARKER && len == 8)) {
    dispatchLegacyMouse(data, len);
    return;
  }

  diag.bleMalformed++;
}

static void sendScanResults(uint32_t requestId) {
  WiFi.mode(WIFI_STA);
  int count = WiFi.scanNetworks(false, true);
  uint8_t sent = 0;
  if (count < 0) count = 0;

  for (int i = 0; i < count && sent < 255; i++) {
    String ssid = WiFi.SSID(i);
    if (ssid.length() == 0) continue;
    PayloadWriter result;
    result.writeString(ssid.c_str());
    int rssi = WiFi.RSSI(i);
    if (rssi < -128) rssi = -128;
    if (rssi > 127) rssi = 127;
    result.writeU8((uint8_t)(int8_t)rssi);
    result.writeU8((uint8_t)WiFi.encryptionType(i));
    if (result.ok) {
      sendControlFrame(BLE_CTRL_SCAN_WIFI_RESULT, requestId, result.data,
                       (uint8_t)result.len);
      sent++;
    }
  }
  WiFi.scanDelete();

  PayloadWriter done;
  done.writeU8(sent);
  if (done.ok) {
    sendControlFrame(BLE_CTRL_SCAN_WIFI_DONE, requestId, done.data,
                     (uint8_t)done.len);
  }
  diag.bleSetupOps++;
}

static void sendWifiConnectResult(uint32_t requestId, bool success, uint8_t reason) {
  PayloadWriter writer;
  writer.writeBool(success);
  writer.writeU8(reason);
  if (writer.ok) {
    sendControlFrame(BLE_CTRL_WIFI_CONNECT_RESULT, requestId, writer.data,
                     (uint8_t)writer.len);
  }
}

static void runPendingOperation() {
  PendingBleOperation operation = pendingOperation;
  if (operation == BLE_PENDING_NONE) return;

  pendingOperation = BLE_PENDING_NONE;
  if (operation == BLE_PENDING_SCAN_WIFI) {
    sendScanResults(pendingRequestId);
    return;
  }

  if (operation == BLE_PENDING_SET_WIFI) {
    bool success = connectWifiForProvisioning(pendingSsid, pendingPassword, true);
    if (success) {
      setupWifiTcpControl();
      startUdpRxTask();
    }
    sendWifiConnectResult(pendingRequestId, success, success ? 0 : 1);
    diag.bleSetupOps++;
  }
}

class BleRxCallbacks : public NimBLECharacteristicCallbacks {
  void onWrite(NimBLECharacteristic* characteristic, NimBLEConnInfo& connInfo) override {
    (void)connInfo;
    std::string value = characteristic->getValue();
    dispatchBleWrite((const uint8_t*)value.data(), value.length());
  }
};

class BleServerCallbacks : public NimBLEServerCallbacks {
  void onConnect(NimBLEServer* server, NimBLEConnInfo& connInfo) override {
    bleClientConnected = true;
    uint16_t handle = connInfo.getConnHandle();
    server->updateConnParams(handle, 12, 24, 0, 400);
    Serial.println("BLE client connected");
  }

  void onDisconnect(NimBLEServer* server, NimBLEConnInfo& connInfo, int reason) override {
    (void)server;
    (void)connInfo;
    Serial.printf("BLE client disconnected reason=%d\n", reason);
    if (bleOwnsHid && bleSessionId != 0) {
      releaseOwner(bleSessionId, OWNER_BLE, RELEASE_REASON_DISCONNECT);
    }
    bleClientConnected = false;
    bleAuthenticated = false;
    blePhoneId = 0;
    clearBleOwnerLocal();
    pendingOperation = BLE_PENDING_NONE;
    NimBLEDevice::startAdvertising();
  }

  void onMTUChange(uint16_t mtu, NimBLEConnInfo& connInfo) override {
    (void)connInfo;
    Serial.printf("BLE MTU updated to %u\n", (unsigned)mtu);
  }
};

static BleRxCallbacks bleRxCallbacks;
static BleServerCallbacks bleServerCallbacks;

void setupBleControl() {
  if (bleStarted) return;

  Serial.println("Initializing BLE control...");
  NimBLEDevice::init(BLE_DEVICE_NAME);
  NimBLEDevice::setMTU(247);
  NimBLEDevice::setPower(ESP_PWR_LVL_P6);
  NimBLEDevice::setSecurityAuth(false, false, true);
  NimBLEDevice::setSecurityIOCap(BLE_HS_IO_NO_INPUT_OUTPUT);

  bleServer = NimBLEDevice::createServer();
  bleServer->setCallbacks(&bleServerCallbacks);

  NimBLEService* service = bleServer->createService(BLE_SERVICE_UUID);
  bleRxCharacteristic = service->createCharacteristic(
      BLE_RX_CHARACTERISTIC_UUID,
      NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::WRITE_NR);
  bleRxCharacteristic->setCallbacks(&bleRxCallbacks);

  bleTxCharacteristic = service->createCharacteristic(
      BLE_TX_CHARACTERISTIC_UUID,
      NIMBLE_PROPERTY::NOTIFY);

  service->start();

  NimBLEAdvertising* advertising = NimBLEDevice::getAdvertising();
  advertising->addServiceUUID(BLE_SERVICE_UUID);
  advertising->setMinInterval(32);
  advertising->setMaxInterval(244);
  advertising->start();

  bleStarted = true;
  Serial.println("BLE control advertising started");
}

void pollBleControl() {
  if (!bleStarted) return;
  syncBleOwnerLocalState();
  runPendingOperation();
}

bool isBleControlClientConnected() {
  return bleClientConnected;
}
