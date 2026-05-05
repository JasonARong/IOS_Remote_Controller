// ESP_Bridge_TinyUSB.ino
//
// Clean-room, motion-only USB HID mouse bridge for ESP32-S3 using
// Adafruit_TinyUSB. The single goal of this sketch is cursor smoothness:
// it intentionally drops BLE control, keyboard, scroll, and button paths
// so that any remaining un-smoothness can only come from
//   (1) the iOS UDP motion sender,
//   (2) the Wi-Fi link, or
//   (3) the USB HID stack on the ESP side.
//
// Wire format consumed (must match RemoteController/UDPMotionSender.swift):
//   marker(0xB2) | seq(u8) | count(u8: 1..2) | (dxLE16, dyLE16) * count
// iOS pre-multiplies dx/dy by POINTER_SCALE; this sketch divides back with
// a fractional remainder so host-perceived sensitivity is preserved.
//
// Required Arduino IDE settings (cannot be set from code):
//   Tools > USB Mode:           USB-OTG (TinyUSB)
//   Tools > USB CDC On Boot:    Enabled       (so Serial keeps working)
//   Tools > USB Firmware MSC:   Disabled
//   Tools > USB DFU On Boot:    Disabled
//   Library Manager:            "Adafruit TinyUSB Library" (latest)

#include <Arduino.h>
#include <Adafruit_TinyUSB.h>
#include <WiFi.h>
#include <WiFiUdp.h>
#include <esp_wifi.h>

/************** CONFIG **************/
#define WIFI_SSID                 "LOSUS WIFI_0122"
#define WIFI_PASSWORD             "66668888"

#define UDP_MOTION_PORT           4210
#define UDP_MOTION_PACKET_MARKER  0xB2
// Max subframes per UDP datagram. Must be >= UDPMotionSender.maxSubframesPerDatagram.
// iOS now ships per-coalesced-touch subframes (240 Hz) instead of summing
// them into a scalar, so a packet may carry up to ~8 samples in a burst.
#define UDP_SUBFRAMES_PER_PACKET  8

#define UDP_FRAME_QUEUE_SIZE      32
#define UDP_FRAME_STALE_US        48000UL

// HID pacer cadence. With bInterval=1 (1000 Hz host polling) we can pump
// at 2 ms (500 Hz) and the host will pick up every report on the next IN
// poll. Going below 2 ms gains nothing because we'd be writing into a
// queue the host already drains every ms.
#define HID_PACER_INTERVAL_MS     2
#define HID_PACER_INTERVAL_US     (HID_PACER_INTERVAL_MS * 1000UL)

// Per-report HID delta clamp. Matches iOS UDPMotionSender.maxDeltaPerFrame
// (currently 127) so host pointer acceleration sees the same dynamic range.
#define MAX_HID_DELTA_PER_REPORT  127

// Inverse of iOS-side pointerScale so we recover host-perceived velocity.
// MUST equal RemoteController/MotionEngines/PointerMotionEngine.swift
// `pointerScale`. Don't change unilaterally.
#define POINTER_SCALE             8

// Wait this many ms for USB enumeration before continuing setup. We do NOT
// block forever -- if the cable is power-only or the host is slow, we still
// want Wi-Fi/UDP to come up so the diagnostic line tells us what failed.
#define USB_MOUNT_TIMEOUT_MS      3000

#define DIAGNOSTICS_INTERVAL_MS   1000


/************** USB HID DESCRIPTOR **************/
// Single-report mouse with 16-bit relative X/Y so a fast flick (>127 px)
// still fits in one report. No Report ID -- this is the only HID device
// on the descriptor, so the report-ID prefix byte would just be dead
// weight on every USB transfer.
//
// Report layout (6 bytes):
//   [0]    buttons (bit0=L, bit1=R, bits2..7 padding)
//   [1..2] dx int16 LE
//   [3..4] dy int16 LE
//   [5]    wheel int8 (always 0 in this sketch but kept so the descriptor
//                      matches a standard mouse and the host's HID parser
//                      is happy)
static uint8_t const desc_hid_report[] = {
  0x05, 0x01,        // Usage Page (Generic Desktop)
  0x09, 0x02,        // Usage (Mouse)
  0xA1, 0x01,        // Collection (Application)
    0x09, 0x01,      //   Usage (Pointer)
    0xA1, 0x00,      //   Collection (Physical)

      // 2 buttons + 6 bits padding = 1 byte
      0x05, 0x09,    //     Usage Page (Button)
      0x19, 0x01,    //     Usage Minimum (Button 1)
      0x29, 0x02,    //     Usage Maximum (Button 2)
      0x15, 0x00,    //     Logical Min (0)
      0x25, 0x01,    //     Logical Max (1)
      0x95, 0x02,    //     Report Count (2)
      0x75, 0x01,    //     Report Size (1)
      0x81, 0x02,    //     Input (Data, Var, Abs)
      0x95, 0x01,    //     Report Count (1)
      0x75, 0x06,    //     Report Size (6)
      0x81, 0x03,    //     Input (Const, Var, Abs) -- padding

      // 16-bit relative X / Y
      0x05, 0x01,        //     Usage Page (Generic Desktop)
      0x09, 0x30,        //     Usage (X)
      0x09, 0x31,        //     Usage (Y)
      0x16, 0x01, 0x80,  //     Logical Min (-32767)
      0x26, 0xFF, 0x7F,  //     Logical Max (32767)
      0x75, 0x10,        //     Report Size (16)
      0x95, 0x02,        //     Report Count (2)
      0x81, 0x06,        //     Input (Data, Var, Rel)

      // 8-bit wheel
      0x09, 0x38,    //     Usage (Wheel)
      0x15, 0x81,    //     Logical Min (-127)
      0x25, 0x7F,    //     Logical Max (127)
      0x75, 0x08,    //     Report Size (8)
      0x95, 0x01,    //     Report Count (1)
      0x81, 0x06,    //     Input (Data, Var, Rel)

    0xC0,            //   End Collection (Physical)
  0xC0               // End Collection (Application)
};

struct __attribute__((packed)) MouseReport {
  uint8_t buttons;
  int16_t x;
  int16_t y;
  int8_t  wheel;
};
static_assert(sizeof(MouseReport) == 6, "HID report must be 6 bytes");

static Adafruit_USBD_HID usb_hid;


/************** UDP / MOTION GLOBALS **************/
static WiFiUDP udpMotion;

struct MotionFrame {
  int16_t dx;
  int16_t dy;
  uint32_t enqueuedUs;
};

static MotionFrame motionFrameQueue[UDP_FRAME_QUEUE_SIZE];
static volatile uint8_t motionFrameHead = 0;
static volatile uint8_t motionFrameTail = 0;
static volatile uint8_t motionFrameCount = 0;
static portMUX_TYPE motionFrameQueueMux = portMUX_INITIALIZER_UNLOCKED;

static TaskHandle_t udpRxTaskHandle = nullptr;
static TaskHandle_t hidPacerTaskHandle = nullptr;


/************** DIAGNOSTICS **************/
// Lightweight per-second counters. All increments happen from a single
// task per counter (RX task increments udp* fields; pacer task increments
// hid* fields), so plain volatile is enough -- no critical sections.
//
// printSummary() runs from loop() on the Arduino loopTask and reads the
// counters non-atomically. We accept up to a one-tick race here because
// the metrics are advisory.
struct Diagnostics {
  // UDP RX task heartbeat
  volatile uint32_t udpRxIters = 0;
  volatile uint32_t udpRawPackets = 0;
  volatile uint32_t udpDatagrams = 0;
  volatile uint32_t udpSubframes = 0;
  volatile uint32_t udpMalformed = 0;
  volatile uint32_t udpQueueOverflow = 0;
  volatile uint8_t  udpQueueDepthMax = 0;

  // HID pacer
  volatile uint32_t hidTicks = 0;
  volatile uint32_t hidReports = 0;
  volatile uint32_t hidReportFails = 0;
  volatile uint32_t hidMotionStaleDrops = 0;
  volatile uint32_t hidLateMaxUs = 0;

  // HID interval histogram (between successful sends): <2, 2-4, 4-8,
  // 8-16, >=16 ms. The first bucket is the success metric -- with
  // bInterval=1 and a 2ms pacer we expect most reports to land here.
  volatile uint32_t hidIntervalBuckets[5] = {0, 0, 0, 0, 0};
  uint32_t lastHidSendUs = 0;

  // Emitted-delta histogram: 0, 1, 2-4, 4-8, 8-16, 16-32, 32-64, 64-127.
  // Lets us see whether iOS is feeding many tiny deltas (good for slow
  // drags) or a few large ones (good for fast flicks).
  volatile uint32_t emitDeltaBuckets[8] = {0, 0, 0, 0, 0, 0, 0, 0};

  uint32_t lastSummaryMs = 0;

  void recordHidSend(bool ok, int16_t dx, int16_t dy, uint32_t nowUs) {
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

  void resetWindow() {
    udpRxIters = 0;
    udpRawPackets = 0;
    udpDatagrams = 0;
    udpSubframes = 0;
    udpMalformed = 0;
    udpQueueOverflow = 0;
    udpQueueDepthMax = 0;
    hidTicks = 0;
    hidReports = 0;
    hidReportFails = 0;
    hidMotionStaleDrops = 0;
    hidLateMaxUs = 0;
    for (int i = 0; i < 5; i++) hidIntervalBuckets[i] = 0;
    for (int i = 0; i < 8; i++) emitDeltaBuckets[i] = 0;
  }
};

static Diagnostics diag;


/************** MOTION QUEUE **************/
static void resetMotionFrameQueue() {
  portENTER_CRITICAL(&motionFrameQueueMux);
  motionFrameHead = 0;
  motionFrameTail = 0;
  motionFrameCount = 0;
  portEXIT_CRITICAL(&motionFrameQueueMux);
}

static uint8_t enqueueMotionFrame(int16_t dx, int16_t dy, bool* overflowOut) {
  bool overflow = false;
  uint32_t nowUs = micros();

  portENTER_CRITICAL(&motionFrameQueueMux);
  if (motionFrameCount >= UDP_FRAME_QUEUE_SIZE) {
    motionFrameHead = (motionFrameHead + 1) % UDP_FRAME_QUEUE_SIZE;
    motionFrameCount--;
    overflow = true;
  }

  motionFrameQueue[motionFrameTail] = {dx, dy, nowUs};
  motionFrameTail = (motionFrameTail + 1) % UDP_FRAME_QUEUE_SIZE;
  motionFrameCount++;
  uint8_t depth = motionFrameCount;
  portEXIT_CRITICAL(&motionFrameQueueMux);

  if (overflowOut != nullptr) *overflowOut = overflow;
  return depth;
}

static bool popFreshMotionFrame(MotionFrame* frameOut, uint32_t nowUs,
                                uint32_t* staleDropsOut, uint8_t* depthOut) {
  bool hasFrame = false;
  uint32_t staleDrops = 0;
  uint8_t depth = 0;

  portENTER_CRITICAL(&motionFrameQueueMux);
  while (motionFrameCount > 0) {
    MotionFrame candidate = motionFrameQueue[motionFrameHead];
    if ((uint32_t)(nowUs - candidate.enqueuedUs) > UDP_FRAME_STALE_US) {
      motionFrameHead = (motionFrameHead + 1) % UDP_FRAME_QUEUE_SIZE;
      motionFrameCount--;
      staleDrops++;
      continue;
    }
    *frameOut = candidate;
    motionFrameHead = (motionFrameHead + 1) % UDP_FRAME_QUEUE_SIZE;
    motionFrameCount--;
    hasFrame = true;
    break;
  }
  depth = motionFrameCount;
  portEXIT_CRITICAL(&motionFrameQueueMux);

  if (staleDropsOut != nullptr) *staleDropsOut = staleDrops;
  if (depthOut != nullptr) *depthOut = depth;
  return hasFrame;
}


/************** UDP SETUP & POLL **************/
// Returns true iff Wi-Fi associated AND the UDP listener bound. We do not
// retry forever -- if Wi-Fi is unavailable at boot we still enter loop()
// so the diagnostic line surfaces wifi=down and the user can see why
// nothing is moving.
static bool setupUdpMotionPoc() {
  Serial.println("🔧 Initializing UDP motion POC...");
  if (strlen(WIFI_SSID) == 0) {
    Serial.println("⚠️ WIFI_SSID empty; UDP motion POC disabled.");
    return false;
  }

  WiFi.mode(WIFI_STA);
  WiFi.setSleep(false);
  esp_wifi_set_ps(WIFI_PS_NONE);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  Serial.printf("📡 Connecting to Wi-Fi SSID: %s", WIFI_SSID);
  uint32_t startMs = millis();
  while (WiFi.status() != WL_CONNECTED && (millis() - startMs) < 10000) {
    delay(250);
    Serial.print(".");
  }
  Serial.println();

  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("⚠️ Wi-Fi connection failed; UDP motion POC inactive.");
    return false;
  }

  if (udpMotion.begin(UDP_MOTION_PORT) == 1) {
    Serial.printf("✅ UDP motion listening on %s:%u\n",
                  WiFi.localIP().toString().c_str(),
                  (unsigned int)UDP_MOTION_PORT);
    return true;
  }
  Serial.println("⚠️ UDP motion listener failed to start.");
  return false;
}

// Drains every buffered datagram synchronously in one call. Designed to be
// called from a tight task loop; returns when parsePacket() reports no
// more data.
static void pollUdpMotionPackets() {
  uint8_t packet[3 + UDP_SUBFRAMES_PER_PACKET * 4];

  while (true) {
    int packetSize = udpMotion.parsePacket();
    if (packetSize <= 0) return;

    diag.udpRawPackets++;

    int readLen = udpMotion.read(packet, sizeof(packet));
    if (readLen <= 0) {
      diag.udpMalformed++;
      continue;
    }

    if (packet[0] != UDP_MOTION_PACKET_MARKER) {
      diag.udpMalformed++;
      continue;
    }

    if (packetSize < 7 || readLen < 7) {
      diag.udpMalformed++;
      continue;
    }

    // packet[1] is the sequence byte; ignored in this clean-room sketch
    // (no gap accounting -- the iOS-side and Phase 1 ESP both report 0
    // gaps consistently, so it's not the smoothness bottleneck).
    uint8_t frameCount = packet[2];
    size_t expectedLen = 3 + ((size_t)frameCount * 4);
    if (frameCount == 0 ||
        frameCount > UDP_SUBFRAMES_PER_PACKET ||
        (size_t)packetSize != expectedLen ||
        (size_t)readLen != expectedLen) {
      diag.udpMalformed++;
      continue;
    }

    diag.udpDatagrams++;
    diag.udpSubframes += frameCount;

    for (uint8_t i = 0; i < frameCount; i++) {
      size_t offset = 3 + ((size_t)i * 4);
      int16_t dx = (int16_t)(packet[offset]     | (packet[offset + 1] << 8));
      int16_t dy = (int16_t)(packet[offset + 2] | (packet[offset + 3] << 8));
      bool overflow = false;
      uint8_t depth = enqueueMotionFrame(dx, dy, &overflow);
      if (overflow) diag.udpQueueOverflow++;
      if (depth > diag.udpQueueDepthMax) diag.udpQueueDepthMax = depth;
    }
  }
}

static void udpRxTask(void* /*parameter*/) {
  Serial.println("🚦 udp-rx task running on core 0");
  while (true) {
    diag.udpRxIters++;
    pollUdpMotionPackets();
    vTaskDelay(pdMS_TO_TICKS(1));
  }
}

static void startUdpRxTask() {
  if (udpRxTaskHandle != nullptr) return;
  BaseType_t created = xTaskCreatePinnedToCore(
    udpRxTask,
    "udp-rx",
    4096,
    nullptr,
    4,
    &udpRxTaskHandle,
    0  /* core 0 - same as Wi-Fi/lwIP */
  );
  if (created != pdPASS) {
    udpRxTaskHandle = nullptr;
    Serial.println("⚠️ Failed to create udp-rx task; UDP motion will be inactive.");
  }
}


/************** HID SEND **************/
// Returns true iff the report was queued successfully. ready() returns
// false only when the previous report hasn't been picked up by the host
// yet -- with bInterval=1 ms and a 2 ms pacer, expected to be true on
// effectively every call.
static bool sendMouseHidReport(int16_t dx, int16_t dy) {
  if (!TinyUSBDevice.mounted()) return false;
  if (!usb_hid.ready()) return false;

  MouseReport r{};
  r.buttons = 0;
  r.x = dx;
  r.y = dy;
  r.wheel = 0;
  return usb_hid.sendReport(0, &r, sizeof(r));
}


/************** HID PACER **************/
// Wakes every HID_PACER_INTERVAL_MS, drains any UDP-derived motion
// frames into a fractional accumulator, divides by POINTER_SCALE
// (preserving sub-quantum motion via the remainder), clamps, and emits.
static void hidPacerTask(void* /*parameter*/) {
  TickType_t lastWake = xTaskGetTickCount();
  uint32_t lastTickUs = micros();

  // Carry sub-POINTER_SCALE remainders across ticks so a slow drag of e.g.
  // 0.25 px/ms doesn't get rounded to zero forever.
  int32_t scaledAccumX = 0;
  int32_t scaledAccumY = 0;

  while (true) {
    vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(HID_PACER_INTERVAL_MS));

    uint32_t nowUs = micros();
    uint32_t elapsedUs = nowUs - lastTickUs;
    uint32_t lateUs = elapsedUs > HID_PACER_INTERVAL_US
                        ? elapsedUs - HID_PACER_INTERVAL_US
                        : 0;
    lastTickUs = nowUs;
    diag.hidTicks++;
    if (lateUs > diag.hidLateMaxUs) diag.hidLateMaxUs = lateUs;

    // Pop AT MOST ONE fresh frame per pacer tick. The previous "drain ALL"
    // policy looked safer but actually re-coalesced the iOS-side per-sample
    // FIFO: a 5-subframe burst arriving in one UDP packet would be summed
    // into a single chunky HID report at the next tick (cursor stutter at
    // ~30 Hz, exactly the iOS touchesMoved callback rate). One-per-tick
    // turns a 5-burst into 5 reports paced 2 ms apart, which is what a
    // mouse-like input stream looks like to the host.
    uint32_t staleDrops = 0;
    uint8_t depth = 0;
    {
      MotionFrame frame;
      if (popFreshMotionFrame(&frame, nowUs, &staleDrops, &depth)) {
        scaledAccumX += frame.dx;
        scaledAccumY += frame.dy;
      }
    }
    if (staleDrops > 0) diag.hidMotionStaleDrops += staleDrops;

    int16_t reportDx = 0;
    int16_t reportDy = 0;
    if (scaledAccumX != 0 || scaledAccumY != 0) {
      int32_t outX = scaledAccumX / POINTER_SCALE;
      int32_t outY = scaledAccumY / POINTER_SCALE;
      if (outX > MAX_HID_DELTA_PER_REPORT)       outX = MAX_HID_DELTA_PER_REPORT;
      else if (outX < -MAX_HID_DELTA_PER_REPORT) outX = -MAX_HID_DELTA_PER_REPORT;
      if (outY > MAX_HID_DELTA_PER_REPORT)       outY = MAX_HID_DELTA_PER_REPORT;
      else if (outY < -MAX_HID_DELTA_PER_REPORT) outY = -MAX_HID_DELTA_PER_REPORT;
      reportDx = (int16_t)outX;
      reportDy = (int16_t)outY;
      // Subtract the *clamped* emit amount so over-cap motion stays in the
      // accumulator and rolls into the next tick.
      scaledAccumX -= (int32_t)reportDx * POINTER_SCALE;
      scaledAccumY -= (int32_t)reportDy * POINTER_SCALE;
    }

    if (reportDx == 0 && reportDy == 0) continue;

    bool ok = sendMouseHidReport(reportDx, reportDy);
    diag.recordHidSend(ok, reportDx, reportDy, nowUs);
  }
}

static void startHidPacerTask() {
  if (hidPacerTaskHandle != nullptr) return;
  xTaskCreatePinnedToCore(
    hidPacerTask,
    "hid-pacer",
    4096,
    nullptr,
    3,
    &hidPacerTaskHandle,
    1  /* core 1 - same as Arduino loopTask */
  );
}


/************** DIAGNOSTIC PRINT **************/
static void printSummaryIfNeeded() {
  uint32_t now = millis();
  if (diag.lastSummaryMs == 0) {
    diag.lastSummaryMs = now;
    return;
  }
  if (now - diag.lastSummaryMs < DIAGNOSTICS_INTERVAL_MS) return;

  bool wifiUp = (WiFi.status() == WL_CONNECTED);

  // Snapshot histogram values up front -- the volatile reads below would
  // otherwise tear if a packet/report lands mid-printf.
  uint32_t hi[5];
  uint32_t ed[8];
  for (int i = 0; i < 5; i++) hi[i] = diag.hidIntervalBuckets[i];
  for (int i = 0; i < 8; i++) ed[i] = diag.emitDeltaBuckets[i];

  Serial.printf(
    "📈 ESP smooth | UDP rawPkts=%lu/s datagrams=%lu/s subframes=%lu/s malformed=%lu queueMax=%u overflow=%lu | "
    "HID ticks=%lu/s reports=%lu/s reportFails=%lu staleDrops=%lu lateMax=%.1fms\n",
    (unsigned long)diag.udpRawPackets,
    (unsigned long)diag.udpDatagrams,
    (unsigned long)diag.udpSubframes,
    (unsigned long)diag.udpMalformed,
    (unsigned)diag.udpQueueDepthMax,
    (unsigned long)diag.udpQueueOverflow,
    (unsigned long)diag.hidTicks,
    (unsigned long)diag.hidReports,
    (unsigned long)diag.hidReportFails,
    (unsigned long)diag.hidMotionStaleDrops,
    (float)diag.hidLateMaxUs / 1000.0f);

  Serial.printf(
    "  net: wifi=%s ip=%s rssi=%d mounted=%s | udpRx iters=%lu/s\n",
    wifiUp ? "connected" : "down",
    wifiUp ? WiFi.localIP().toString().c_str() : "0.0.0.0",
    wifiUp ? (int)WiFi.RSSI() : 0,
    TinyUSBDevice.mounted() ? "yes" : "no",
    (unsigned long)diag.udpRxIters);

  Serial.printf(
    "  HID interval ms <2=%lu 2-4=%lu 4-8=%lu 8-16=%lu >=16=%lu\n",
    (unsigned long)hi[0], (unsigned long)hi[1], (unsigned long)hi[2],
    (unsigned long)hi[3], (unsigned long)hi[4]);

  Serial.printf(
    "  emit delta:    0=%lu 1=%lu 2-4=%lu 4-8=%lu 8-16=%lu 16-32=%lu 32-64=%lu 64-127=%lu\n",
    (unsigned long)ed[0], (unsigned long)ed[1], (unsigned long)ed[2], (unsigned long)ed[3],
    (unsigned long)ed[4], (unsigned long)ed[5], (unsigned long)ed[6], (unsigned long)ed[7]);

  diag.resetWindow();
  diag.lastSummaryMs = now;
}


/************** SETUP / LOOP **************/
void setup() {
  // CDC-on-Boot maps Serial to a TinyUSB CDC interface; on ESP32-S3 the
  // arduino-esp32 core auto-initializes TinyUSB before setup() when "USB
  // Mode: USB-OTG (TinyUSB)" is selected, so we just attach our HID
  // interface to it and wait for enumeration.
  if (!TinyUSBDevice.isInitialized()) {
    TinyUSBDevice.begin(0);
  }

  Serial.begin(115200);
  // Don't block forever waiting for a host CDC connection -- if the user
  // is power-only we still want Wi-Fi/UDP/HID to come up.
  uint32_t serialWaitStart = millis();
  while (!Serial && (millis() - serialWaitStart) < 1000) {
    delay(10);
  }

  Serial.println();
  Serial.println("🔧 Initializing TinyUSB HID Mouse...");

  usb_hid.setPollInterval(1);
  usb_hid.setReportDescriptor(desc_hid_report, sizeof(desc_hid_report));
  if (!usb_hid.begin()) {
    Serial.println("⚠️ usb_hid.begin() failed");
  }

  // If TinyUSB was already initialized before we registered HID (which is
  // the typical arduino-esp32 path), force a re-enumeration so the host
  // sees the new descriptor with our HID interface attached.
  if (TinyUSBDevice.mounted()) {
    TinyUSBDevice.detach();
    delay(10);
    TinyUSBDevice.attach();
  }

  uint32_t mountStart = millis();
  while (!TinyUSBDevice.mounted() && (millis() - mountStart) < USB_MOUNT_TIMEOUT_MS) {
    delay(10);
  }
  Serial.printf("✅ TinyUSB HID mounted=%s after %lums\n",
                TinyUSBDevice.mounted() ? "yes" : "no",
                (unsigned long)(millis() - mountStart));

  resetMotionFrameQueue();
  startHidPacerTask();

  if (setupUdpMotionPoc()) {
    startUdpRxTask();
  }

  Serial.println("🎯 ESP_Bridge_TinyUSB ready");
}

void loop() {
  printSummaryIfNeeded();
  delay(10);
}
