// Diagnostics.cpp — aggregate bridge health metrics and print periodic Serial summaries.

#include "Diagnostics.h"

#include <WiFi.h>

#include "Config.h"
#include "OwnerSession.h"
#include "UsbHid.h"

Diagnostics diag;

// Update per-send histograms on success; count failures separately.
void Diagnostics::recordHidSend(bool ok, int16_t dx, int16_t dy, uint32_t nowUs) {
  if (ok) {
    hidReports++;
    if (lastHidSendUs != 0) {
      uint32_t deltaMs = (nowUs - lastHidSendUs) / 1000;
      uint8_t bucket;
      if (deltaMs < 2)        bucket = 0;
      else if (deltaMs < 4)   bucket = 1;
      else if (deltaMs < 8)   bucket = 2;
      else if (deltaMs < 16)  bucket = 3;
      else                    bucket = 4;
      hidIntervalBuckets[bucket]++;
    }
    lastHidSendUs = nowUs;

    uint16_t mag = (uint16_t)max(abs((int)dx), abs((int)dy));
    uint8_t b;
    if (mag == 0)        b = 0;
    else if (mag == 1)   b = 1;
    else if (mag < 4)    b = 2;
    else if (mag < 8)    b = 3;
    else if (mag < 16)   b = 4;
    else if (mag < 32)   b = 5;
    else if (mag < 64)   b = 6;
    else                 b = 7;
    emitDeltaBuckets[b]++;
  } else {
    hidReportFails++;
  }
}

void Diagnostics::resetWindow() {
  udpRxIters = 0;
  udpRawPackets = 0;
  udpDatagrams = 0;
  udpSubframes = 0;
  udpMalformed = 0;
  udpQueueOverflow = 0;
  udpQueueDepthMax = 0;
  hidTicks = 0;
  hidReports = 0;
  hidKeyboardReports = 0;
  hidReportFails = 0;
  hidMotionStaleDrops = 0;
  releaseAllCount = 0;
  hidLateMaxUs = 0;
  for (int i = 0; i < 5; i++) hidIntervalBuckets[i] = 0;
  for (int i = 0; i < 8; i++) emitDeltaBuckets[i] = 0;
}

// Emit one multi-line summary per DIAGNOSTICS_INTERVAL_MS, then zero window counters.
void printSummaryIfNeeded() {
  uint32_t now = millis();
  if (diag.lastSummaryMs == 0) {
    diag.lastSummaryMs = now;
    return;
  }
  if (now - diag.lastSummaryMs < DIAGNOSTICS_INTERVAL_MS) return;

  bool wifiUp = (WiFi.status() == WL_CONNECTED);

  uint32_t hi[5];
  uint32_t ed[8];
  for (int i = 0; i < 5; i++) hi[i] = diag.hidIntervalBuckets[i];
  for (int i = 0; i < 8; i++) ed[i] = diag.emitDeltaBuckets[i];

  Serial.printf(
    "📈 ESP production | UDP rawPkts=%lu/s datagrams=%lu/s subframes=%lu/s malformed=%lu queueMax=%u overflow=%lu | "
    "HID ticks=%lu/s mouseReports=%lu/s keyboardReports=%lu/s reportFails=%lu staleDrops=%lu releaseAll=%lu lateMax=%.1fms\n",
    (unsigned long)diag.udpRawPackets,
    (unsigned long)diag.udpDatagrams,
    (unsigned long)diag.udpSubframes,
    (unsigned long)diag.udpMalformed,
    (unsigned)diag.udpQueueDepthMax,
    (unsigned long)diag.udpQueueOverflow,
    (unsigned long)diag.hidTicks,
    (unsigned long)diag.hidReports,
    (unsigned long)diag.hidKeyboardReports,
    (unsigned long)diag.hidReportFails,
    (unsigned long)diag.hidMotionStaleDrops,
    (unsigned long)diag.releaseAllCount,
    (float)diag.hidLateMaxUs / 1000.0f);

  Serial.printf(
    "  net: wifi=%s ip=%s rssi=%d mounted=%s | udpRx iters=%lu/s\n",
    wifiUp ? "connected" : "down",
    wifiUp ? WiFi.localIP().toString().c_str() : "0.0.0.0",
    wifiUp ? (int)WiFi.RSSI() : 0,
    isUsbHidMounted() ? "yes" : "no",
    (unsigned long)diag.udpRxIters);

  Serial.printf(
    "  HID interval ms <2=%lu 2-4=%lu 4-8=%lu 8-16=%lu >=16=%lu\n",
    (unsigned long)hi[0], (unsigned long)hi[1], (unsigned long)hi[2],
    (unsigned long)hi[3], (unsigned long)hi[4]);

  Serial.printf(
    "  emit delta:    0=%lu 1=%lu 2-4=%lu 4-8=%lu 8-16=%lu 16-32=%lu 32-64=%lu 64-127=%lu\n",
    (unsigned long)ed[0], (unsigned long)ed[1], (unsigned long)ed[2], (unsigned long)ed[3],
    (unsigned long)ed[4], (unsigned long)ed[5], (unsigned long)ed[6], (unsigned long)ed[7]);

  OwnerSnapshot owner = getOwnerSnapshot(now);
  const char* ownerLabel = "none";
  if (owner.state.ownerKind == OWNER_WIFI) ownerLabel = "wifi";
  else if (owner.state.ownerKind == OWNER_BLE) ownerLabel = "ble";

  if (owner.state.ownerKind == OWNER_NONE) {
    Serial.printf("  owner: kind=none session=0 epoch=0 hb=expired\n");
  } else if (owner.heartbeatExpired) {
    Serial.printf(
      "  owner: kind=%s session=%lu epoch=%lu hb=expired (%ldms ago)\n",
      ownerLabel,
      (unsigned long)owner.state.sessionId,
      (unsigned long)owner.state.inputEpoch,
      (long)owner.heartbeatRemainingMs);
  } else {
    Serial.printf(
      "  owner: kind=%s session=%lu epoch=%lu hb=%ldms left\n",
      ownerLabel,
      (unsigned long)owner.state.sessionId,
      (unsigned long)owner.state.inputEpoch,
      (long)owner.heartbeatRemainingMs);
  }

  diag.resetWindow();
  diag.lastSummaryMs = now;
}
