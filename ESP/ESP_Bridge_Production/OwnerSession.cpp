// OwnerSession.cpp — single active owner, heartbeat liveness, and HID mode mirroring.

#include "OwnerSession.h"

#include "Config.h"

static OwnerSessionState ownerState;
static portMUX_TYPE ownerSessionMux = portMUX_INITIALIZER_UNLOCKED;

static uint32_t nextNonZeroId() {
  uint32_t value = 0;
  while (value == 0) {
    value = (uint32_t)esp_random();
  }
  return value;
}

static void clearOwnerLocked() {
  ownerState = OwnerSessionState{};
}

static OwnerClaimResult rejectAlreadyOwned() {
  OwnerClaimResult result;
  result.granted = false;
  result.reason = OWNER_REJECT_ALREADY_OWNED;
  return result;
}

void resetOwnerSession() {
  portENTER_CRITICAL(&ownerSessionMux);
  ownerState = OwnerSessionState{};
  portEXIT_CRITICAL(&ownerSessionMux);
  setActiveInputMode(INPUT_MODE_NONE);
}

OwnerClaimResult claimWifiOwner(uint32_t phoneId, const OwnerTcpEndpoint& tcpEndpoint,
                              uint32_t nowMs) {
  portENTER_CRITICAL(&ownerSessionMux);

  if (ownerState.ownerKind != OWNER_NONE) {
    portEXIT_CRITICAL(&ownerSessionMux);
    return rejectAlreadyOwned();
  }

  ownerState.ownerKind = OWNER_WIFI;
  ownerState.sessionId = nextNonZeroId();
  ownerState.udpToken = nextNonZeroId();
  ownerState.inputEpoch = OWNER_SESSION_INITIAL_EPOCH;
  ownerState.phoneId = phoneId;
  ownerState.tcpEndpoint = tcpEndpoint;
  ownerState.heartbeatDeadlineMs = nowMs + OWNER_HEARTBEAT_TIMEOUT_MS;
  setActiveInputMode(INPUT_MODE_WIFI);

  OwnerClaimResult result;
  result.granted = true;
  result.sessionId = ownerState.sessionId;
  result.udpToken = ownerState.udpToken;
  result.inputEpoch = ownerState.inputEpoch;

  portEXIT_CRITICAL(&ownerSessionMux);
  return result;
}

OwnerClaimResult claimBleOwner(uint32_t phoneId, uint32_t nowMs) {
  portENTER_CRITICAL(&ownerSessionMux);

  if (ownerState.ownerKind != OWNER_NONE) {
    portEXIT_CRITICAL(&ownerSessionMux);
    return rejectAlreadyOwned();
  }

  ownerState.ownerKind = OWNER_BLE;
  ownerState.sessionId = nextNonZeroId();
  ownerState.udpToken = 0;
  ownerState.inputEpoch = 0;
  ownerState.phoneId = phoneId;
  ownerState.tcpEndpoint = OwnerTcpEndpoint{};
  ownerState.heartbeatDeadlineMs = nowMs + OWNER_HEARTBEAT_TIMEOUT_MS;
  setActiveInputMode(INPUT_MODE_BLE);

  OwnerClaimResult result;
  result.granted = true;
  result.sessionId = ownerState.sessionId;

  portEXIT_CRITICAL(&ownerSessionMux);
  return result;
}

void releaseOwner(uint32_t sessionId, OwnerKind ownerKind, ReleaseReason reason) {
  OwnerKind capturedOwnerKind = OWNER_NONE;
  uint32_t capturedSessionId = 0;

  portENTER_CRITICAL(&ownerSessionMux);

  if (ownerState.ownerKind == OWNER_NONE ||
      ownerState.sessionId != sessionId ||
      ownerState.ownerKind != ownerKind) {
    portEXIT_CRITICAL(&ownerSessionMux);
    return;
  }

  capturedOwnerKind = ownerState.ownerKind;
  capturedSessionId = ownerState.sessionId;
  portEXIT_CRITICAL(&ownerSessionMux);

  releaseAllHidState(reason);

  bool clearedOwner = false;
  portENTER_CRITICAL(&ownerSessionMux);
  if (ownerState.ownerKind == capturedOwnerKind &&
      ownerState.sessionId == capturedSessionId) {
    clearOwnerLocked();
    clearedOwner = true;
  }
  portEXIT_CRITICAL(&ownerSessionMux);
  if (clearedOwner) {
    setActiveInputMode(INPUT_MODE_NONE);
  }
}

bool refreshOwnerHeartbeat(uint32_t sessionId, OwnerKind ownerKind, uint32_t nowMs) {
  portENTER_CRITICAL(&ownerSessionMux);

  if (ownerState.ownerKind == OWNER_NONE ||
      ownerState.sessionId != sessionId ||
      ownerState.ownerKind != ownerKind) {
    portEXIT_CRITICAL(&ownerSessionMux);
    return false;
  }

  ownerState.heartbeatDeadlineMs = nowMs + OWNER_HEARTBEAT_TIMEOUT_MS;
  portEXIT_CRITICAL(&ownerSessionMux);
  return true;
}

void checkOwnerHeartbeatTimeout(uint32_t nowMs) {
  OwnerKind capturedOwnerKind = OWNER_NONE;
  uint32_t capturedSessionId = 0;
  uint32_t capturedHeartbeatDeadlineMs = 0;

  portENTER_CRITICAL(&ownerSessionMux);
  if (ownerState.ownerKind != OWNER_NONE &&
      ownerState.heartbeatDeadlineMs != 0 &&
      nowMs >= ownerState.heartbeatDeadlineMs) {
    capturedOwnerKind = ownerState.ownerKind;
    capturedSessionId = ownerState.sessionId;
    capturedHeartbeatDeadlineMs = ownerState.heartbeatDeadlineMs;
  }
  portEXIT_CRITICAL(&ownerSessionMux);

  if (capturedOwnerKind == OWNER_NONE) return;

  releaseAllHidState(RELEASE_REASON_TIMEOUT);

  bool clearedOwner = false;
  portENTER_CRITICAL(&ownerSessionMux);
  if (ownerState.ownerKind == capturedOwnerKind &&
      ownerState.sessionId == capturedSessionId &&
      ownerState.heartbeatDeadlineMs == capturedHeartbeatDeadlineMs &&
      nowMs >= ownerState.heartbeatDeadlineMs) {
    clearOwnerLocked();
    clearedOwner = true;
  }
  portEXIT_CRITICAL(&ownerSessionMux);
  if (clearedOwner) {
    setActiveInputMode(INPUT_MODE_NONE);
  }
}

OwnerSnapshot getOwnerSnapshot(uint32_t nowMs) {
  OwnerSnapshot snapshot;

  portENTER_CRITICAL(&ownerSessionMux);
  snapshot.state = ownerState;
  portEXIT_CRITICAL(&ownerSessionMux);

  if (snapshot.state.ownerKind == OWNER_NONE || snapshot.state.heartbeatDeadlineMs == 0) {
    snapshot.heartbeatExpired = true;
    snapshot.heartbeatRemainingMs = 0;
    return snapshot;
  }

  if (nowMs >= snapshot.state.heartbeatDeadlineMs) {
    snapshot.heartbeatExpired = true;
    snapshot.heartbeatRemainingMs =
        (int32_t)nowMs - (int32_t)snapshot.state.heartbeatDeadlineMs;
  } else {
    snapshot.heartbeatExpired = false;
    snapshot.heartbeatRemainingMs =
        (int32_t)snapshot.state.heartbeatDeadlineMs - (int32_t)nowMs;
  }

  return snapshot;
}

bool isWifiOwnerSession() {
  portENTER_CRITICAL(&ownerSessionMux);
  bool active = ownerState.ownerKind == OWNER_WIFI;
  portEXIT_CRITICAL(&ownerSessionMux);
  return active;
}

bool isBleOwnerSession() {
  portENTER_CRITICAL(&ownerSessionMux);
  bool active = ownerState.ownerKind == OWNER_BLE;
  portEXIT_CRITICAL(&ownerSessionMux);
  return active;
}

bool acceptWifiTcpHidForOwner(uint32_t sessionId) {
  portENTER_CRITICAL(&ownerSessionMux);
  bool accepted = ownerState.ownerKind == OWNER_WIFI &&
                  ownerState.sessionId == sessionId;
  portEXIT_CRITICAL(&ownerSessionMux);
  return accepted;
}

bool acceptWifiControlAndRefresh(uint32_t sessionId, uint32_t nowMs) {
  if (!acceptWifiTcpHidForOwner(sessionId)) return false;
  return refreshOwnerHeartbeat(sessionId, OWNER_WIFI, nowMs);
}

bool updateOwnerInputEpoch(uint32_t sessionId, uint32_t newEpoch) {
  if (newEpoch == 0) return false;

  portENTER_CRITICAL(&ownerSessionMux);
  if (ownerState.ownerKind != OWNER_WIFI || ownerState.sessionId != sessionId) {
    portEXIT_CRITICAL(&ownerSessionMux);
    return false;
  }

  ownerState.inputEpoch = newEpoch;
  portEXIT_CRITICAL(&ownerSessionMux);
  return true;
}
