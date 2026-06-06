// OwnerSession.h — runtime owner/session authority for Wi-Fi and BLE transports.
// Transports consult this module before driving HID; HidState.activeMode is a mirror.

#pragma once

#include <Arduino.h>

#include "HidState.h"

enum OwnerKind : uint8_t {
  OWNER_NONE = 0,
  OWNER_BLE = 1,
  OWNER_WIFI = 2,
};

enum OwnerClaimRejectReason : uint8_t {
  OWNER_REJECT_NONE = 0,
  OWNER_REJECT_ALREADY_OWNED = 1,
};

struct OwnerTcpEndpoint {
  uint32_t ipv4 = 0;
  uint16_t port = 0;
};

struct OwnerSessionState {
  OwnerKind ownerKind = OWNER_NONE;
  uint32_t sessionId = 0;
  uint32_t udpToken = 0;
  uint32_t inputEpoch = 0;
  uint32_t phoneId = 0;
  uint32_t heartbeatDeadlineMs = 0;
  OwnerTcpEndpoint tcpEndpoint;
};

struct OwnerClaimResult {
  bool granted = false;
  OwnerClaimRejectReason reason = OWNER_REJECT_NONE;
  uint32_t sessionId = 0;
  uint32_t udpToken = 0;
  uint32_t inputEpoch = 0;
};

struct OwnerSnapshot {
  OwnerSessionState state;
  bool heartbeatExpired = true;
  int32_t heartbeatRemainingMs = 0;
};

void resetOwnerSession();
OwnerClaimResult claimWifiOwner(uint32_t phoneId, const OwnerTcpEndpoint& tcpEndpoint,
                                uint32_t nowMs);
OwnerClaimResult claimBleOwner(uint32_t phoneId, uint32_t nowMs);
void releaseOwner(uint32_t sessionId, OwnerKind ownerKind, ReleaseReason reason);
bool refreshOwnerHeartbeat(uint32_t sessionId, OwnerKind ownerKind, uint32_t nowMs);
void checkOwnerHeartbeatTimeout(uint32_t nowMs);
OwnerSnapshot getOwnerSnapshot(uint32_t nowMs);
bool isWifiOwnerSession();
bool isBleOwnerSession();
bool acceptWifiTcpHidForOwner(uint32_t sessionId);
bool acceptWifiControlAndRefresh(uint32_t sessionId, uint32_t nowMs);
bool updateOwnerInputEpoch(uint32_t sessionId, uint32_t newEpoch);
