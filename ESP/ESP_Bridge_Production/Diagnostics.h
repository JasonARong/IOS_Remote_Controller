// Diagnostics.h — rolling counters and histograms for UDP ingress and HID egress.
// printSummaryIfNeeded() emits a periodic Serial summary then resets windows.

#pragma once

#include <Arduino.h>

struct Diagnostics {
  volatile uint32_t udpRxIters = 0;
  volatile uint32_t udpRawPackets = 0;
  volatile uint32_t udpDatagrams = 0;
  volatile uint32_t udpSubframes = 0;
  volatile uint32_t udpMalformed = 0;
  volatile uint32_t udpGateRejected = 0;
  volatile uint32_t udpQueueOverflow = 0;
  volatile uint8_t  udpQueueDepthMax = 0;

  volatile uint32_t hidTicks = 0;
  volatile uint32_t hidReports = 0;
  volatile uint32_t hidKeyboardReports = 0;
  volatile uint32_t hidReportFails = 0;
  volatile uint32_t hidMotionStaleDrops = 0;
  volatile uint32_t releaseAllCount = 0;
  volatile uint32_t tcpFramesRx = 0;
  volatile uint32_t tcpFramesTx = 0;
  volatile uint32_t tcpBytesRx = 0;
  volatile uint32_t tcpWriteFails = 0;
  volatile uint32_t tcpClientTimeouts = 0;
  volatile uint32_t hidLateMaxUs = 0;

  // Time between consecutive successful mouse HID sends (ms buckets).
  volatile uint32_t hidIntervalBuckets[5] = {0, 0, 0, 0, 0};
  uint32_t lastHidSendUs = 0;

  // Magnitude of dx/dy per successful mouse report (0, 1, 2–4, … 64–127).
  volatile uint32_t emitDeltaBuckets[8] = {0, 0, 0, 0, 0, 0, 0, 0};

  uint32_t lastSummaryMs = 0;

  void recordHidSend(bool ok, int16_t dx, int16_t dy, uint32_t nowUs);
  void resetWindow();
};

extern Diagnostics diag;

void printSummaryIfNeeded();
