// WifiTcpControl.cpp - framed TCP control lane for Wi-Fi ownership and HID input.

#include "WifiTcpControl.h"

#include <WiFi.h>

#include "Config.h"
#include "Diagnostics.h"
#include "HidState.h"
#include "OwnerSession.h"
#include "PersistentStore.h"
#include "UsbHid.h"

static constexpr size_t TCP_FRAME_HEADER_LENGTH = 12;
static constexpr size_t TCP_RX_BUFFER_LENGTH =
    TCP_FRAME_HEADER_LENGTH + TCP_CONTROL_MAX_PAYLOAD_LENGTH;

static WiFiServer tcpControlServer(TCP_CONTROL_PORT);
static WiFiClient tcpClient;
static bool tcpServerStarted = false;
static bool tcpClientHelloDone = false;
static bool tcpClientAuthenticated = false;
static bool tcpClientOwnsWifi = false;
static uint32_t tcpClientPhoneId = 0;
static uint32_t tcpClientSessionId = 0;
static uint32_t tcpClientConnectedAtMs = 0;
static uint32_t tcpClientLastActivityMs = 0;
static uint32_t tcpTxSeq = 1;
static uint8_t tcpRxBuffer[TCP_RX_BUFFER_LENGTH];
static size_t tcpRxLength = 0;

struct TcpFrame {
  uint8_t type = 0;
  uint32_t seq = 0;
  const uint8_t* payload = nullptr;
  uint16_t payloadLength = 0;
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

  bool readI8(int8_t* out) {
    uint8_t value = 0;
    if (!readU8(&value)) return false;
    *out = (int8_t)value;
    return true;
  }

  bool readU16(uint16_t* out) {
    if (pos + 2 > len) return false;
    *out = (uint16_t)data[pos] | ((uint16_t)data[pos + 1] << 8);
    pos += 2;
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

  bool skipBytes(uint8_t count) {
    if (pos + count > len) return false;
    pos += count;
    return true;
  }

  bool readString(char* out, size_t capacity) {
    uint8_t count = 0;
    if (!readU8(&count) || out == nullptr || capacity == 0 ||
        pos + count > len) {
      return false;
    }
    size_t copyLen = count;
    if (copyLen >= capacity) copyLen = capacity - 1;
    memcpy(out, &data[pos], copyLen);
    out[copyLen] = '\0';
    pos += count;
    return true;
  }

  bool fullyRead() const {
    return pos == len;
  }
};

struct PayloadWriter {
  uint8_t data[TCP_CONTROL_MAX_PAYLOAD_LENGTH];
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

static void writeLe16(uint8_t* bytes, uint16_t value) {
  bytes[0] = (uint8_t)(value & 0xff);
  bytes[1] = (uint8_t)((value >> 8) & 0xff);
}

static void writeLe32(uint8_t* bytes, uint32_t value) {
  bytes[0] = (uint8_t)(value & 0xff);
  bytes[1] = (uint8_t)((value >> 8) & 0xff);
  bytes[2] = (uint8_t)((value >> 16) & 0xff);
  bytes[3] = (uint8_t)((value >> 24) & 0xff);
}

static const char* tcpMessageName(uint8_t type) {
  switch ((TcpMessageType)type) {
    case TCP_MSG_HELLO: return "Hello";
    case TCP_MSG_HELLO_ACK: return "HelloAck";
    case TCP_MSG_AUTH: return "Auth";
    case TCP_MSG_AUTH_RESULT: return "AuthResult";
    case TCP_MSG_CLAIM_OWNER: return "ClaimOwner";
    case TCP_MSG_OWNER_RESULT: return "OwnerResult";
    case TCP_MSG_HEARTBEAT: return "Heartbeat";
    case TCP_MSG_STATUS_REQUEST: return "StatusRequest";
    case TCP_MSG_STATUS_RESPONSE: return "StatusResponse";
    case TCP_MSG_BUTTON_STATE: return "ButtonState";
    case TCP_MSG_WHEEL_TICK: return "WheelTick";
    case TCP_MSG_KEY_COMBO: return "KeyCombo";
    case TCP_MSG_RELEASE_ALL: return "ReleaseAll";
    case TCP_MSG_SETUP_COMMAND: return "SetupCommand";
    case TCP_MSG_SETUP_RESULT: return "SetupResult";
    case TCP_MSG_ERROR: return "Error";
  }
  return "Unknown";
}

static uint32_t foldPhoneId(const uint8_t* data, uint8_t len) {
  uint32_t value = 2166136261UL;
  for (uint8_t i = 0; i < len; i++) {
    value ^= data[i];
    value *= 16777619UL;
  }
  return value == 0 ? 1 : value;
}

static void resetTcpClientState() {
  tcpClientHelloDone = false;
  tcpClientAuthenticated = false;
  tcpClientOwnsWifi = false;
  tcpClientPhoneId = 0;
  tcpClientSessionId = 0;
  tcpClientConnectedAtMs = 0;
  tcpClientLastActivityMs = 0;
  tcpRxLength = 0;
}

static bool sendFrame(uint8_t type, const uint8_t* payload, uint16_t payloadLength) {
  if (!tcpClient || !tcpClient.connected()) return false;

  uint8_t frame[TCP_RX_BUFFER_LENGTH];
  writeLe16(&frame[0], TCP_CONTROL_MAGIC);
  frame[2] = TCP_CONTROL_FRAME_VERSION;
  frame[3] = type;
  writeLe32(&frame[4], tcpTxSeq++);
  writeLe16(&frame[8], payloadLength);
  writeLe16(&frame[10], 0);
  for (uint16_t i = 0; i < payloadLength; i++) {
    frame[TCP_FRAME_HEADER_LENGTH + i] = payload[i];
  }

  size_t totalLength = TCP_FRAME_HEADER_LENGTH + payloadLength;
  size_t totalWritten = tcpClient.write(frame, totalLength);
  tcpClient.flush();
  bool ok = totalWritten == totalLength;

  if (ok) {
    diag.tcpFramesTx++;
  } else {
    diag.tcpWriteFails++;
  }
  Serial.printf(
    "TCP tx %s seq=%lu len=%u ok=%s written=%u expected=%u\n",
    tcpMessageName(type),
    (unsigned long)(tcpTxSeq - 1),
    (unsigned)payloadLength,
    ok ? "yes" : "no",
    (unsigned)totalWritten,
    (unsigned)totalLength);
  return ok;
}

static void sendError(TcpErrorCode code, uint32_t relatedSeq, const char* message) {
  PayloadWriter writer;
  writer.writeU16((uint16_t)code);
  writer.writeU32(relatedSeq);
  writer.writeString(message);
  if (writer.ok) sendFrame(TCP_MSG_ERROR, writer.data, (uint16_t)writer.len);
}

static bool requireHello(const TcpFrame& frame) {
  if (tcpClientHelloDone) return true;
  sendError(TCP_ERROR_INVALID_STATE, frame.seq, "hello required");
  return false;
}

static bool requireAuthenticated(const TcpFrame& frame) {
  if (tcpClientAuthenticated) return true;
  sendError(TCP_ERROR_NOT_AUTHENTICATED, frame.seq, "auth required");
  return false;
}

static bool requireWifiOwner(const TcpFrame& frame, uint32_t sessionId) {
  if (tcpClientOwnsWifi &&
      tcpClientSessionId == sessionId &&
      acceptWifiTcpHidForOwner(sessionId)) {
    return true;
  }
  sendError(TCP_ERROR_NOT_OWNER, frame.seq, "not wifi owner");
  return false;
}

static void handleHello(const TcpFrame& frame) {
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint16_t minProtocol = 0;
  uint16_t maxProtocol = 0;
  uint32_t clientCapabilities = 0;
  if (!reader.readU16(&minProtocol) ||
      !reader.readU16(&maxProtocol) ||
      !reader.readU32(&clientCapabilities) ||
      !reader.fullyRead()) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad hello");
    return;
  }

  (void)clientCapabilities;
  if (TCP_CONTROL_PROTOCOL_VERSION < minProtocol ||
      TCP_CONTROL_PROTOCOL_VERSION > maxProtocol) {
    sendError(TCP_ERROR_UNSUPPORTED_VERSION, frame.seq, "unsupported protocol");
    return;
  }

  char deviceId[PERSISTENT_MAX_DEVICE_ID_LENGTH + 1] = "ESP3";
  getPersistentDeviceId(deviceId, sizeof(deviceId));
  PayloadWriter writer;
  writer.writeU16(TCP_CONTROL_PROTOCOL_VERSION);
  writer.writeU32(TCP_CONTROL_CAPABILITIES);
  writer.writeBytes((const uint8_t*)deviceId, (uint8_t)strlen(deviceId));
  writer.writeString(TCP_CONTROL_FIRMWARE_VERSION);
  if (!writer.ok) {
    sendError(TCP_ERROR_PAYLOAD_TOO_LARGE, frame.seq, "hello ack too large");
    return;
  }

  tcpClientHelloDone = true;
  sendFrame(TCP_MSG_HELLO_ACK, writer.data, (uint16_t)writer.len);
}

static void handleAuth(const TcpFrame& frame) {
  if (!requireHello(frame)) return;

  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint8_t phoneIdLength = 0;
  if (!reader.readU8(&phoneIdLength) || phoneIdLength == 0 ||
      reader.pos + phoneIdLength > reader.len) {
    sendError(TCP_ERROR_AUTH_FAILED, frame.seq, "missing phone id");
    return;
  }

  tcpClientPhoneId = foldPhoneId(&reader.data[reader.pos], phoneIdLength);
  if (!reader.skipBytes(phoneIdLength)) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad phone id");
    return;
  }

  uint8_t proofLength = 0;
  if (!reader.readU8(&proofLength) ||
      reader.pos + proofLength != reader.len) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad auth proof");
    return;
  }

  tcpClientAuthenticated = validateStoredPairingProof(
      tcpClientPhoneId, &reader.data[reader.pos], proofLength);
  PayloadWriter writer;
  writer.writeBool(tcpClientAuthenticated);
  writer.writeU8(tcpClientAuthenticated ? 0 : TCP_ERROR_AUTH_FAILED);
  sendFrame(TCP_MSG_AUTH_RESULT, writer.data, (uint16_t)writer.len);
  if (!tcpClientAuthenticated) {
    sendError(TCP_ERROR_AUTH_FAILED, frame.seq, "auth proof rejected");
  }
}

static void handleClaimOwner(const TcpFrame& frame) {
  if (!requireHello(frame) || !requireAuthenticated(frame)) return;

  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint8_t requestedMode = 0;
  if (!reader.readU8(&requestedMode) || !reader.fullyRead() || requestedMode != 1) {
    sendError(TCP_ERROR_INVALID_STATE, frame.seq, "wifi mode required");
    return;
  }

  OwnerTcpEndpoint endpoint;
  endpoint.ipv4 = (uint32_t)tcpClient.remoteIP();
  endpoint.port = tcpClient.remotePort();
  OwnerClaimResult claim = claimWifiOwner(tcpClientPhoneId, endpoint, millis());

  tcpClientOwnsWifi = claim.granted;
  tcpClientSessionId = claim.sessionId;

  PayloadWriter writer;
  writer.writeBool(claim.granted);
  writer.writeU8((uint8_t)claim.reason);
  writer.writeU32(claim.sessionId);
  writer.writeU32(claim.udpToken);
  writer.writeU32(claim.inputEpoch);
  sendFrame(TCP_MSG_OWNER_RESULT, writer.data, (uint16_t)writer.len);

  if (!claim.granted) {
    sendError(TCP_ERROR_ALREADY_OWNED, frame.seq, "already owned");
  }
}

static void handleHeartbeat(const TcpFrame& frame) {
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t sessionId = 0;
  if (!reader.readU32(&sessionId) || !reader.fullyRead()) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad heartbeat");
    return;
  }

  if (!tcpClientOwnsWifi ||
      tcpClientSessionId != sessionId ||
      !refreshOwnerHeartbeat(sessionId, OWNER_WIFI, millis())) {
    sendError(TCP_ERROR_NOT_OWNER, frame.seq, "heartbeat rejected");
  }
}

static void handleStatusRequest(const TcpFrame& frame) {
  if (!requireHello(frame)) return;

  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t requestId = 0;
  if (!reader.readU32(&requestId) || !reader.fullyRead()) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad status request");
    return;
  }

  OwnerSnapshot owner = getOwnerSnapshot(millis());
  uint8_t activeMode = 0;
  portENTER_CRITICAL(&hidStateMux);
  activeMode = (uint8_t)hidState.activeMode;
  portEXIT_CRITICAL(&hidStateMux);

  bool owned = owner.state.ownerKind != OWNER_NONE;
  bool ownedByThisSession = owned &&
                            owner.state.ownerKind == OWNER_WIFI &&
                            tcpClientOwnsWifi &&
                            owner.state.sessionId == tcpClientSessionId;

  PayloadWriter writer;
  writer.writeU32(requestId);
  writer.writeU8(activeMode);
  writer.writeBool(WiFi.status() == WL_CONNECTED);
  writer.writeBool(false);
  writer.writeBool(isUsbHidMounted());
  writer.writeBool(owned);
  writer.writeBool(ownedByThisSession);
  writer.writeString(TCP_CONTROL_FIRMWARE_VERSION);
  writer.writeU16(TCP_CONTROL_PROTOCOL_VERSION);
  writer.writeU32(TCP_CONTROL_CAPABILITIES);
  if (writer.ok) {
    sendFrame(TCP_MSG_STATUS_RESPONSE, writer.data, (uint16_t)writer.len);
  } else {
    sendError(TCP_ERROR_PAYLOAD_TOO_LARGE, frame.seq, "status too large");
  }
}

static void handleButtonState(const TcpFrame& frame) {
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t sessionId = 0;
  uint32_t inputEpoch = 0;
  uint8_t buttons = 0;
  if (!reader.readU32(&sessionId) ||
      !reader.readU32(&inputEpoch) ||
      !reader.readU8(&buttons) ||
      !reader.fullyRead()) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad button state");
    return;
  }

  if (!requireWifiOwner(frame, sessionId)) return;
  if (!updateOwnerInputEpoch(sessionId, inputEpoch)) {
    sendError(TCP_ERROR_INVALID_STATE, frame.seq, "epoch rejected");
    return;
  }
  refreshOwnerHeartbeat(sessionId, OWNER_WIFI, millis());
  stageMouseButtons(buttons);
}

static void handleWheelTick(const TcpFrame& frame) {
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t sessionId = 0;
  int8_t delta = 0;
  if (!reader.readU32(&sessionId) ||
      !reader.readI8(&delta) ||
      !reader.fullyRead()) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad wheel tick");
    return;
  }

  if (!requireWifiOwner(frame, sessionId)) return;
  refreshOwnerHeartbeat(sessionId, OWNER_WIFI, millis());
  stageWheelTicks(delta);
}

static void handleKeyCombo(const TcpFrame& frame) {
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t sessionId = 0;
  uint8_t count = 0;
  if (!reader.readU32(&sessionId) || !reader.readU8(&count) ||
      count == 0 || count > 3 || reader.pos + count != reader.len) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad key combo");
    return;
  }

  uint8_t keys[3] = {0, 0, 0};
  for (uint8_t i = 0; i < count; i++) {
    if (!reader.readU8(&keys[i])) {
      sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad key payload");
      return;
    }
  }

  if (!requireWifiOwner(frame, sessionId)) return;
  refreshOwnerHeartbeat(sessionId, OWNER_WIFI, millis());
  stageKeyboardCombo(keys, count);
}

static void handleReleaseAll(const TcpFrame& frame) {
  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint32_t sessionId = 0;
  uint32_t inputEpoch = 0;
  uint8_t reason = RELEASE_REASON_USER_EMERGENCY;
  if (!reader.readU32(&sessionId) ||
      !reader.readU32(&inputEpoch) ||
      !reader.readU8(&reason) ||
      !reader.fullyRead()) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad release all");
    return;
  }

  if (!requireWifiOwner(frame, sessionId)) return;
  if (!updateOwnerInputEpoch(sessionId, inputEpoch)) {
    sendError(TCP_ERROR_INVALID_STATE, frame.seq, "epoch rejected");
    return;
  }
  refreshOwnerHeartbeat(sessionId, OWNER_WIFI, millis());
  releaseAllHidState((ReleaseReason)reason);
}

static void handleSetupCommand(const TcpFrame& frame) {
  if (!requireHello(frame) || !requireAuthenticated(frame)) return;
  if (!tcpClientOwnsWifi ||
      tcpClientSessionId == 0 ||
      !acceptWifiTcpHidForOwner(tcpClientSessionId)) {
    sendError(TCP_ERROR_NOT_OWNER, frame.seq, "setup requires owner");
    return;
  }

  PayloadReader reader{frame.payload, frame.payloadLength, 0};
  uint8_t command = 0;
  if (!reader.readU8(&command)) {
    sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad setup command");
    return;
  }

  PayloadWriter writer;
  writer.writeU8(command);
  if (command == TCP_SETUP_LIST_SAVED_WIFI) {
    if (!reader.fullyRead()) {
      sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad list saved wifi");
      return;
    }
    uint8_t count = getStoredWifiProfileCount();
    writer.writeBool(true);
    writer.writeString("saved wifi profiles");
    writer.writeU8(count);
    for (uint8_t i = 0; i < count; i++) {
      StoredWifiProfile profile;
      if (getStoredWifiProfile(i, &profile)) writer.writeString(profile.ssid);
    }
  } else if (command == TCP_SETUP_FORGET_WIFI) {
    char ssid[PERSISTENT_MAX_SSID_LENGTH + 1] = {0};
    if (!reader.readString(ssid, sizeof(ssid)) || !reader.fullyRead()) {
      sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad forget wifi");
      return;
    }
    bool removed = forgetStoredWifiProfile(ssid);
    writer.writeBool(removed);
    writer.writeString(removed ? "wifi profile forgotten" : "wifi profile not found");
  } else if (command == TCP_SETUP_RESET_PAIRING) {
    if (!reader.fullyRead()) {
      sendError(TCP_ERROR_BAD_FRAME, frame.seq, "bad reset pairing");
      return;
    }
    releaseOwner(tcpClientSessionId, OWNER_WIFI, RELEASE_REASON_USER_EMERGENCY);
    clearStoredPairingIdentity();
    tcpClientOwnsWifi = false;
    tcpClientSessionId = 0;
    tcpClientAuthenticated = false;
    writer.writeBool(true);
    writer.writeString("pairing identity cleared");
  } else {
    sendError(TCP_ERROR_UNKNOWN_MESSAGE, frame.seq, "unknown setup command");
    return;
  }
  sendFrame(TCP_MSG_SETUP_RESULT, writer.data, (uint16_t)writer.len);
}

static void handleFrame(const TcpFrame& frame) {
  switch ((TcpMessageType)frame.type) {
    case TCP_MSG_HELLO:
      handleHello(frame);
      break;
    case TCP_MSG_AUTH:
      handleAuth(frame);
      break;
    case TCP_MSG_CLAIM_OWNER:
      handleClaimOwner(frame);
      break;
    case TCP_MSG_HEARTBEAT:
      handleHeartbeat(frame);
      break;
    case TCP_MSG_STATUS_REQUEST:
      handleStatusRequest(frame);
      break;
    case TCP_MSG_BUTTON_STATE:
      handleButtonState(frame);
      break;
    case TCP_MSG_WHEEL_TICK:
      handleWheelTick(frame);
      break;
    case TCP_MSG_KEY_COMBO:
      handleKeyCombo(frame);
      break;
    case TCP_MSG_RELEASE_ALL:
      handleReleaseAll(frame);
      break;
    case TCP_MSG_SETUP_COMMAND:
      handleSetupCommand(frame);
      break;
    default:
      sendError(TCP_ERROR_UNKNOWN_MESSAGE, frame.seq, "unknown message");
      break;
  }
}

static bool parseOneFrame(size_t* consumed) {
  *consumed = 0;
  if (tcpRxLength < TCP_FRAME_HEADER_LENGTH) return false;

  uint16_t magic = readLe16(&tcpRxBuffer[0]);
  uint8_t frameVersion = tcpRxBuffer[2];
  uint8_t type = tcpRxBuffer[3];
  uint32_t seq = readLe32(&tcpRxBuffer[4]);
  uint16_t payloadLength = readLe16(&tcpRxBuffer[8]);
  uint16_t flags = readLe16(&tcpRxBuffer[10]);

  if (magic != TCP_CONTROL_MAGIC) {
    sendError(TCP_ERROR_BAD_FRAME, seq, "bad magic");
    tcpClient.stop();
    resetTcpClientState();
    return false;
  }
  if (frameVersion != TCP_CONTROL_FRAME_VERSION) {
    sendError(TCP_ERROR_UNSUPPORTED_VERSION, seq, "bad frame version");
    *consumed = TCP_FRAME_HEADER_LENGTH + payloadLength;
    return tcpRxLength >= *consumed;
  }
  if (payloadLength > TCP_CONTROL_MAX_PAYLOAD_LENGTH) {
    sendError(TCP_ERROR_PAYLOAD_TOO_LARGE, seq, "payload too large");
    tcpClient.stop();
    resetTcpClientState();
    return false;
  }
  if (flags != 0) {
    sendError(TCP_ERROR_BAD_FRAME, seq, "flags must be zero");
    *consumed = TCP_FRAME_HEADER_LENGTH + payloadLength;
    return tcpRxLength >= *consumed;
  }

  size_t frameLength = TCP_FRAME_HEADER_LENGTH + payloadLength;
  if (tcpRxLength < frameLength) return false;

  TcpFrame frame;
  frame.type = type;
  frame.seq = seq;
  frame.payload = &tcpRxBuffer[TCP_FRAME_HEADER_LENGTH];
  frame.payloadLength = payloadLength;
  diag.tcpFramesRx++;
  Serial.printf(
    "TCP rx %s seq=%lu len=%u\n",
    tcpMessageName(type),
    (unsigned long)seq,
    (unsigned)payloadLength);
  handleFrame(frame);

  *consumed = frameLength;
  return true;
}

static void processRxBuffer() {
  while (tcpRxLength >= TCP_FRAME_HEADER_LENGTH) {
    size_t consumed = 0;
    if (!parseOneFrame(&consumed) || consumed == 0) return;
    if (consumed > tcpRxLength) {
      tcpRxLength = 0;
      return;
    }
    size_t remaining = tcpRxLength - consumed;
    for (size_t i = 0; i < remaining; i++) tcpRxBuffer[i] = tcpRxBuffer[consumed + i];
    tcpRxLength = remaining;
  }
}

static void releaseOwnedClientOnDisconnect() {
  if (tcpClientOwnsWifi && tcpClientSessionId != 0) {
    releaseOwner(tcpClientSessionId, OWNER_WIFI, RELEASE_REASON_DISCONNECT);
  }
  resetTcpClientState();
}

static void stopTcpClientForTimeout(const char* reason) {
  Serial.printf("TCP control client timeout: %s\n", reason);
  diag.tcpClientTimeouts++;
  tcpClient.stop();
  releaseOwnedClientOnDisconnect();
}

static bool expireTcpClientIfTimedOut(uint32_t nowMs) {
  if (!tcpClient || !tcpClient.connected()) return false;

  if (!tcpClientHelloDone &&
      nowMs - tcpClientConnectedAtMs > TCP_CONTROL_HELLO_TIMEOUT_MS) {
    stopTcpClientForTimeout("hello");
    return true;
  }
  if (tcpClientHelloDone &&
      nowMs - tcpClientLastActivityMs > TCP_CONTROL_IDLE_TIMEOUT_MS) {
    stopTcpClientForTimeout("idle");
    return true;
  }
  return false;
}

static void acceptPendingClient() {
  WiFiClient pending = tcpControlServer.available();
  if (!pending) return;

  expireTcpClientIfTimedOut(millis());

  if (tcpClient && tcpClient.connected()) {
    pending.stop();
    return;
  }

  tcpClient = pending;
  tcpClient.setNoDelay(true);
  resetTcpClientState();
  tcpClientConnectedAtMs = millis();
  tcpClientLastActivityMs = tcpClientConnectedAtMs;
  Serial.printf("TCP control client connected from %s:%u\n",
                tcpClient.remoteIP().toString().c_str(),
                (unsigned)tcpClient.remotePort());
}

void setupWifiTcpControl() {
  if (tcpServerStarted) return;
  tcpControlServer.begin();
  tcpControlServer.setNoDelay(true);
  tcpServerStarted = true;
  Serial.printf("TCP control listening on %s:%u\n",
                WiFi.localIP().toString().c_str(),
                (unsigned)TCP_CONTROL_PORT);
}

void pollWifiTcpControl() {
  if (!tcpServerStarted) return;

  expireTcpClientIfTimedOut(millis());
  acceptPendingClient();

  if (!tcpClient) return;
  if (!tcpClient.connected()) {
    releaseOwnedClientOnDisconnect();
    tcpClient.stop();
    return;
  }

  while (tcpClient.available() > 0) {
    if (tcpRxLength >= sizeof(tcpRxBuffer)) {
      sendError(TCP_ERROR_PAYLOAD_TOO_LARGE, 0, "rx buffer full");
      tcpClient.stop();
      releaseOwnedClientOnDisconnect();
      return;
    }
    int readLen = tcpClient.read(&tcpRxBuffer[tcpRxLength],
                                 sizeof(tcpRxBuffer) - tcpRxLength);
    if (readLen <= 0) break;
    tcpClientLastActivityMs = millis();
    diag.tcpBytesRx += (uint32_t)readLen;
    Serial.printf("TCP read bytes=%d buffered=%u\n",
                  readLen,
                  (unsigned)(tcpRxLength + (size_t)readLen));
    tcpRxLength += (size_t)readLen;
    processRxBuffer();
    if (!tcpClient.connected()) return;
  }
}
