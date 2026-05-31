// ESP_Bridge.ino
//
// Legacy full-feature reference. Keep for BLE/control behavior comparison,
// but do not use this as the production smooth-motion base.
// See ESP/README.md for current firmware file roles.

#include <Arduino.h>
#include <USB.h>
#include <USBHID.h>
#include <USBHIDKeyboard.h>
#include <NimBLEDevice.h>
#include <WiFi.h>
#include <WiFiUdp.h>
#include <esp_wifi.h>

USBHID HID;
USBHIDKeyboard Keyboard;

#define SERVICE_UUID        "00001234-0000-1000-8000-00805f9b34fb"
#define CHARACTERISTIC_UUID "0000abcd-0000-1000-8000-00805f9b34fb"

#define MOVEMENT_DIAGNOSTICS 1
#define MOVEMENT_VERBOSE_PACKET_LOGS 0
#define DEBUG_MOUSE_PACKET_MARKER 0xA1
#define UDP_MOTION_POC 1
#define WIFI_SSID "LOSUS WIFI_0122"
#define WIFI_PASSWORD "66668888"
#define UDP_MOTION_PORT 4210
#define UDP_MOTION_PACKET_MARKER_LEGACY 0xB1
#define UDP_MOTION_PACKET_MARKER_V2 0xB2
#define UDP_SUBFRAMES_PER_PACKET_MAX 2
#define UDP_FRAME_QUEUE_SIZE 32
#define UDP_FRAME_STALE_US 48000UL
#define HID_REPORT_INTERVAL_US 8000UL
#define STALE_MOVEMENT_MS 50UL
// Raised from 64 to 127 so fast flicks aren't artificially capped after
// the iOS subframe cap moved to 127 (in scaled units; see POINTER_SCALE).
#define MAX_HID_DELTA_PER_REPORT 127
#define MAX_WHEEL_DELTA_PER_REPORT 1
// iOS pre-multiplies UDP motion by POINTER_SCALE so slow drags don't lose
// resolution to integer rounding on iOS. ESP divides by the same constant
// (with a fractional remainder) at HID emit time so host-perceived
// sensitivity stays unchanged. Must match UDPMotionSender pointerScale.
#define POINTER_SCALE 4
#define ENABLE_BLE_CONTROL_PATH 1
#define HID_LOCAL_GENERATOR_TEST 0
#define UDP_MOTION_VERBOSE_RX_LOGS 0

NimBLEServer* pServer = nullptr;
NimBLEService* pService = nullptr;
NimBLECharacteristic* pChar = nullptr;

#if UDP_MOTION_POC
WiFiUDP udpMotion;
#endif

bool deviceConnected = false;
bool oldDeviceConnected = false;
static TaskHandle_t hidPacerTaskHandle = nullptr;
#if UDP_MOTION_POC
static TaskHandle_t udpRxTaskHandle = nullptr;
// BLE conn-param breaker uses this to detect "active UDP motion" windows.
static volatile uint32_t lastUdpMotionMs = 0;
#define MOTION_ACTIVE_WINDOW_MS 120UL
#endif

#if ENABLE_BLE_CONTROL_PATH
// While the user is doing a pure-motion stroke (UDP active, no buttons)
// we widen the BLE connection interval to free 2.4 GHz airtime for Wi-Fi
// UDP. Any button or keyboard event immediately reverts to snappy params
// so click latency during a drag stays imperceptible.
enum BleConnParamMode { BLE_PARAM_SNAPPY, BLE_PARAM_BACKOFF };
static volatile uint16_t connectedBleHandle = 0xFFFF;
static volatile bool connectedBleHandleValid = false;
static volatile BleConnParamMode currentBleParamMode = BLE_PARAM_SNAPPY;
static uint32_t bleParamSwitchCount = 0;
static uint32_t lastBleParamRequestMs = 0;
#define BLE_PARAM_DEBOUNCE_MS 100UL
#endif


/************** CUSTOM HID MOUSE DESCRIPTOR **************/
// Standard Mouse with 2 buttons + X/Y movement + Wheel
// Expandable for future enhancements (horizontal scroll, more buttons, etc.)
static const uint8_t MOUSE_REPORT_DESCRIPTOR[] = {
  0x05, 0x01,        // Usage Page (Generic Desktop)
  0x09, 0x02,        // Usage (Mouse)
  0xA1, 0x01,        // Collection (Application)
    0x85, HID_REPORT_ID_MOUSE, //   Report ID (mouse)
  
    0x09, 0x01,        //   Usage (Pointer)
    0xA1, 0x00,        //   Collection (Physical)
    
      // Buttons (2 buttons: left, right)
      0x05, 0x09,        //     Usage Page (Button)
      0x19, 0x01,        //     Usage Minimum (Button 1)
      0x29, 0x02,        //     Usage Maximum (Button 2)
      0x15, 0x00,        //     Logical Minimum (0)
      0x25, 0x01,        //     Logical Maximum (1)
      0x95, 0x02,        //     Report Count (2)
      0x75, 0x01,        //     Report Size (1)
      0x81, 0x02,        //     Input (Data, Variable, Absolute)
      
      // Padding (6 bits to complete the byte)
      0x95, 0x01,        //     Report Count (1)
      0x75, 0x06,        //     Report Size (6)
      0x81, 0x03,        //     Input (Constant)
      
      // X and Y relative movement (16-bit for precision)
      0x05, 0x01,        //     Usage Page (Generic Desktop)
      0x09, 0x30,        //     Usage (X)
      0x09, 0x31,        //     Usage (Y)
      0x16, 0x00, 0x80,  //     Logical Minimum (-32768)
      0x26, 0xFF, 0x7F,  //     Logical Maximum (32767)
      0x75, 0x10,        //     Report Size (16)
      0x95, 0x02,        //     Report Count (2)
      0x81, 0x06,        //     Input (Data, Variable, Relative)
      
      // Vertical Wheel
      0x09, 0x38,        //     Usage (Wheel)
      0x15, 0x81,        //     Logical Minimum (-127)
      0x25, 0x7F,        //     Logical Maximum (127)
      0x75, 0x08,        //     Report Size (8)
      0x95, 0x01,        //     Report Count (1)
      0x81, 0x06,        //     Input (Data, Variable, Relative)
    
    0xC0,              //   End Collection (Physical)
  0xC0               // End Collection (Application)
};

// Mouse report structure matching the descriptor above
typedef struct {
  uint8_t buttons;   // Bit 0: Left, Bit 1: Right
  int16_t x;         // X movement (-32768 to 32767)
  int16_t y;         // Y movement (-32768 to 32767)
  int8_t wheel;      // Wheel movement (-127 to 127)
} __attribute__((packed)) MouseReport; // Crucial: no added spaces for alignment in memory, squish all bytes together

MouseReport mouseReport = {0, 0, 0, 0};

/************** CUSTOM HID DEVICE CLASS **************/
class CustomMouseDevice : public USBHIDDevice {
public:
  CustomMouseDevice() {
    static bool initialized = false;
    if (!initialized) {
      initialized = true;
    }
  }

  uint16_t _onGetDescriptor(uint8_t* buffer) {
    memcpy(buffer, MOUSE_REPORT_DESCRIPTOR, sizeof(MOUSE_REPORT_DESCRIPTOR));
    return sizeof(MOUSE_REPORT_DESCRIPTOR);
  }

  // Send mouse report
  bool sendReport() {
    // Send using the mouse report ID so the host can route it correctly
    return HID.SendReport(HID_REPORT_ID_MOUSE, &mouseReport, sizeof(mouseReport));
  }

  // Individual control methods (for future use)
  void setButtons(uint8_t buttons) {
    mouseReport.buttons = buttons;
  }

  void setMovement(int16_t x, int16_t y) {
    mouseReport.x = x;
    mouseReport.y = y;
  }

  void setWheel(int8_t wheel) {
    mouseReport.wheel = wheel;
  }

  void reset() {
    mouseReport = {0, 0, 0, 0};
  }
};

// Custom Mouse Device
CustomMouseDevice Mouse;

/************** PACED MOUSE STATE **************/
struct PacerMouseState {
  int32_t pendingDx = 0;
  int32_t pendingDy = 0;
  int16_t pendingWheel = 0;
  uint8_t currentButtons = 0;
  bool buttonDirty = false;
  uint32_t lastMovementMs = 0;
  uint32_t lastHidUs = 0;
};

static portMUX_TYPE mouseStateMux = portMUX_INITIALIZER_UNLOCKED;
static PacerMouseState mouseState;

struct MotionFrame {
  int16_t dx = 0;
  int16_t dy = 0;
  uint32_t enqueuedUs = 0;
};

static portMUX_TYPE motionFrameQueueMux = portMUX_INITIALIZER_UNLOCKED;
static MotionFrame motionFrameQueue[UDP_FRAME_QUEUE_SIZE];
static uint8_t motionFrameHead = 0;
static uint8_t motionFrameTail = 0;
static uint8_t motionFrameCount = 0;

static int16_t clampInt32ToInt16(int32_t value, int16_t limit) {
  if (value > limit) return limit;
  if (value < -limit) return -limit;
  return (int16_t)value;
}

static int8_t clampInt16ToInt8(int16_t value, int8_t limit) {
  if (value > limit) return limit;
  if (value < -limit) return -limit;
  return (int8_t)value;
}

static void resetMousePacerState() {
  portENTER_CRITICAL(&mouseStateMux);
  mouseState.pendingDx = 0;
  mouseState.pendingDy = 0;
  mouseState.pendingWheel = 0;
  mouseState.currentButtons = 0;
  mouseState.buttonDirty = false;
  mouseState.lastMovementMs = 0;
  mouseState.lastHidUs = micros();
  portEXIT_CRITICAL(&mouseStateMux);
}

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

  // Mark UDP motion as active for the BLE conn-param breaker.
  lastUdpMotionMs = millis();

  if (overflowOut != nullptr) {
    *overflowOut = overflow;
  }
  return depth;
}

static bool popFreshMotionFrame(MotionFrame* frameOut, uint32_t nowUs, uint32_t* staleDropsOut, uint8_t* depthOut) {
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

  if (staleDropsOut != nullptr) {
    *staleDropsOut = staleDrops;
  }
  if (depthOut != nullptr) {
    *depthOut = depth;
  }
  return hasFrame;
}

static void enqueueMouseState(
  int16_t dx,
  int16_t dy,
  int8_t wheel,
  uint8_t buttons,
  bool updateButtons,
  bool* buttonChangedOut,
  int32_t* pendingDxOut,
  int32_t* pendingDyOut
) {
  bool buttonChanged = false;
  uint32_t nowMs = millis();

  portENTER_CRITICAL(&mouseStateMux);
  mouseState.pendingDx += dx;
  mouseState.pendingDy += dy;
  mouseState.pendingWheel += wheel;
  if (dx != 0 || dy != 0 || wheel != 0) {
    mouseState.lastMovementMs = nowMs;
  }
  if (updateButtons && buttons != mouseState.currentButtons) {
    mouseState.currentButtons = buttons;
    mouseState.buttonDirty = true;
    buttonChanged = true;
  }
  int32_t pendingDx = mouseState.pendingDx;
  int32_t pendingDy = mouseState.pendingDy;
  portEXIT_CRITICAL(&mouseStateMux);

  if (buttonChangedOut != nullptr) {
    *buttonChangedOut = buttonChanged;
  }
  if (pendingDxOut != nullptr) {
    *pendingDxOut = pendingDx;
  }
  if (pendingDyOut != nullptr) {
    *pendingDyOut = pendingDy;
  }
}

#if MOVEMENT_DIAGNOSTICS
/************** MOVEMENT DIAGNOSTICS **************/
class MovementDiagnostics {
private:
  unsigned long lastSummaryMs = 0;
  unsigned long lastBlePacketUs = 0;
  unsigned long lastUdpPacketUs = 0;
  unsigned long lastHidReportUs = 0;
  unsigned long lastUdpPacketMs = 0;

  uint32_t blePackets = 0;
  uint32_t bleSeqGaps = 0;
  uint32_t udpDatagrams = 0;
  uint32_t udpSubframes = 0;
  uint32_t udpSeqGaps = 0;
  uint32_t malformedUdpPackets = 0;
  uint32_t malformedMousePackets = 0;
  uint32_t motionFrameOverflowDrops = 0;
  uint32_t motionFrameStaleDrops = 0;
  uint32_t hidTicks = 0;
  uint32_t hidReports = 0;
  uint32_t hidMovingReports = 0;
  uint32_t hidSendReturnFalse = 0;
  uint32_t staleDrops = 0;
  uint32_t cappedReports = 0;
  // Heartbeat counters for the dedicated UDP RX task. udpRxIterations
  // proves the task is alive; udpRxRawPackets proves lwIP is actually
  // delivering datagrams to us. If iterations>0 but rawPackets==0 the
  // problem is below us (Wi-Fi/iOS); if both are 0 the task itself is
  // not running.
  uint32_t udpRxIterations = 0;
  uint32_t udpRxRawPackets = 0;
  float maxPendingAbs = 0.0f;
  uint8_t maxMotionFrameQueueDepth = 0;
  uint32_t maxHidLateUs = 0;

  bool hasLastBleSeq = false;
  uint8_t lastBleSeq = 0;
  bool hasLastUdpSeq = false;
  uint8_t lastUdpSeq = 0;

  uint32_t bleIntervalBuckets[7] = {0};
  uint32_t udpIntervalBuckets[7] = {0};
  uint32_t hidIntervalBuckets[7] = {0};

#if ENABLE_BLE_CONTROL_PATH
  // Tracks the cumulative bleParamSwitchCount as of the previous summary
  // so we can print per-window transition counts without resetting the
  // global (the override path mutates that global from BLE callbacks).
  uint32_t bleParamSwitchCountLastSummary = 0;
#endif

  void recordInterval(unsigned long deltaUs, uint32_t buckets[7]) {
    const float ms = (float)deltaUs / 1000.0f;
    if (ms < 8.0f) {
      buckets[0]++;
    } else if (ms < 12.0f) {
      buckets[1]++;
    } else if (ms < 17.0f) {
      buckets[2]++;
    } else if (ms < 25.0f) {
      buckets[3]++;
    } else if (ms < 34.0f) {
      buckets[4]++;
    } else if (ms < 50.0f) {
      buckets[5]++;
    } else {
      buckets[6]++;
    }
  }

  void printBuckets(const char* label, uint32_t buckets[7]) {
    Serial.printf("%s <8=%lu 8-12=%lu 12-17=%lu 17-25=%lu 25-34=%lu 34-50=%lu >=50=%lu",
                  label,
                  (unsigned long)buckets[0],
                  (unsigned long)buckets[1],
                  (unsigned long)buckets[2],
                  (unsigned long)buckets[3],
                  (unsigned long)buckets[4],
                  (unsigned long)buckets[5],
                  (unsigned long)buckets[6]);
  }

  void resetWindow() {
    blePackets = 0;
    bleSeqGaps = 0;
    udpDatagrams = 0;
    udpSubframes = 0;
    udpSeqGaps = 0;
    malformedUdpPackets = 0;
    malformedMousePackets = 0;
    motionFrameOverflowDrops = 0;
    motionFrameStaleDrops = 0;
    hidTicks = 0;
    hidReports = 0;
    hidMovingReports = 0;
    hidSendReturnFalse = 0;
    staleDrops = 0;
    cappedReports = 0;
    udpRxIterations = 0;
    udpRxRawPackets = 0;
    maxPendingAbs = 0.0f;
    maxMotionFrameQueueDepth = 0;
    maxHidLateUs = 0;
    memset(bleIntervalBuckets, 0, sizeof(bleIntervalBuckets));
    memset(udpIntervalBuckets, 0, sizeof(udpIntervalBuckets));
    memset(hidIntervalBuckets, 0, sizeof(hidIntervalBuckets));
  }

public:
  void recordBlePacket(bool hasSeq, uint8_t seq) {
    unsigned long now = micros();
    if (lastBlePacketUs != 0) {
      recordInterval(now - lastBlePacketUs, bleIntervalBuckets);
    }
    lastBlePacketUs = now;
    blePackets++;

    if (hasSeq) {
      if (hasLastBleSeq) {
        uint8_t expected = lastBleSeq + 1;
        if (seq != expected) {
          bleSeqGaps += (uint8_t)(seq - expected);
        }
      }
      lastBleSeq = seq;
      hasLastBleSeq = true;
    }
  }

  void recordUdpDatagram(uint8_t seq) {
    unsigned long now = micros();
    if (lastUdpPacketUs != 0) {
      recordInterval(now - lastUdpPacketUs, udpIntervalBuckets);
    }
    lastUdpPacketUs = now;
    lastUdpPacketMs = millis();
    udpDatagrams++;

    if (hasLastUdpSeq) {
      uint8_t expected = lastUdpSeq + 1;
      if (seq != expected) {
        udpSeqGaps += (uint8_t)(seq - expected);
      }
    }
    lastUdpSeq = seq;
    hasLastUdpSeq = true;
  }

  void recordUdpSubframes(uint8_t count) {
    udpSubframes += count;
    lastUdpPacketMs = millis();
  }

  void recordMotionFrameQueueDepth(uint8_t depth) {
    if (depth > maxMotionFrameQueueDepth) {
      maxMotionFrameQueueDepth = depth;
    }
  }

  void recordMotionFrameOverflowDrop() {
    motionFrameOverflowDrops++;
  }

  void recordMotionFrameStaleDrops(uint32_t count) {
    motionFrameStaleDrops += count;
  }

  void recordMalformedMousePacket() {
    malformedMousePackets++;
  }

  void recordMalformedUdpPacket() {
    malformedUdpPackets++;
    lastUdpPacketMs = millis();
  }

  bool hasRecentUdpActivity() {
    return lastUdpPacketMs != 0 && (millis() - lastUdpPacketMs) < 2000;
  }

  void recordUdpRxIteration() {
    udpRxIterations++;
  }

  void recordUdpRxRawPacket() {
    udpRxRawPackets++;
  }

  void recordPending(float pendingDx, float pendingDy) {
    float absDx = pendingDx >= 0.0f ? pendingDx : -pendingDx;
    float absDy = pendingDy >= 0.0f ? pendingDy : -pendingDy;
    float absPending = absDx > absDy ? absDx : absDy;
    if (absPending > maxPendingAbs) {
      maxPendingAbs = absPending;
    }
  }

  void recordStaleDrop(int32_t dx, int32_t dy) {
    if (dx != 0 || dy != 0) {
      staleDrops++;
    }
  }

  // Only count delivered reports. Espressif USBHID::SendReport returns
  // false on semaphore-wait timeouts where the report likely did NOT
  // make it to the host. Counting those as "delivered" hid the real
  // host-perceived rate in earlier captures.
  void recordHidReport(bool sendReturnValue, int16_t dx, int16_t dy, bool capped) {
    unsigned long now = micros();
    if (sendReturnValue) {
      if (lastHidReportUs != 0) {
        recordInterval(now - lastHidReportUs, hidIntervalBuckets);
      }
      lastHidReportUs = now;
      hidReports++;
      if (dx != 0 || dy != 0) {
        hidMovingReports++;
      }
      if (capped) {
        cappedReports++;
      }
    } else {
      hidSendReturnFalse++;
    }
  }

  void recordHidTick(uint32_t lateUs) {
    hidTicks++;
    if (lateUs > maxHidLateUs) {
      maxHidLateUs = lateUs;
    }
  }

  void printSummaryIfNeeded() {
    unsigned long now = millis();
    if (lastSummaryMs == 0) {
      lastSummaryMs = now;
      return;
    }
    if (now - lastSummaryMs < 1000) {
      return;
    }

    Serial.printf("📈 ESP movement diagnostics | BLE rx=%lu/s seqGaps=%lu malformed=%lu | UDP datagrams=%lu/s subframes=%lu/s seqGaps=%lu malformed=%lu queueMax=%u overflow=%lu staleFrames=%lu | maxPending=%.1f staleDrops=%lu capped=%lu | HID ticks=%lu/s reports=%lu/s moving=%lu lateMax=%.1fms sendReturnFalse=%lu\n",
                  (unsigned long)blePackets,
                  (unsigned long)bleSeqGaps,
                  (unsigned long)malformedMousePackets,
                  (unsigned long)udpDatagrams,
                  (unsigned long)udpSubframes,
                  (unsigned long)udpSeqGaps,
                  (unsigned long)malformedUdpPackets,
                  maxMotionFrameQueueDepth,
                  (unsigned long)motionFrameOverflowDrops,
                  (unsigned long)motionFrameStaleDrops,
                  maxPendingAbs,
                  (unsigned long)staleDrops,
                  (unsigned long)cappedReports,
                  (unsigned long)hidTicks,
                  (unsigned long)hidReports,
                  (unsigned long)hidMovingReports,
                  (float)maxHidLateUs / 1000.0f,
                  (unsigned long)hidSendReturnFalse);
#if UDP_MOTION_POC
    // Net + UDP RX task heartbeat. Reads:
    //   wifi=connected ip=... rssi=... → setupUdpMotionPoc succeeded and
    //     Wi-Fi is currently associated. wifi=down means iOS UDP can't
    //     reach us regardless of anything else.
    //   udpRx iters=N rawPkts=M → the dedicated udp-rx FreeRTOS task is
    //     scheduling (iters>0) and lwIP is delivering datagrams (rawPkts>0).
    //     iters>0 + rawPkts==0 → no UDP arriving (iOS not sending or
    //     wrong destination). iters==0 → task itself never runs.
    bool wifiUp = (WiFi.status() == WL_CONNECTED);
    Serial.printf("  net: wifi=%s ip=%s rssi=%d | udpRx iters=%lu rawPkts=%lu\n",
                  wifiUp ? "connected" : "down",
                  wifiUp ? WiFi.localIP().toString().c_str() : "0.0.0.0",
                  wifiUp ? (int)WiFi.RSSI() : 0,
                  (unsigned long)udpRxIterations,
                  (unsigned long)udpRxRawPackets);
#endif
#if ENABLE_BLE_CONTROL_PATH
    // BLE coexistence breaker state. mode is the current requested
    // connection-parameter set; switches counts how many transitions
    // happened in this 1-second window.
    uint32_t switchesThisWindow = bleParamSwitchCount - bleParamSwitchCountLastSummary;
    bleParamSwitchCountLastSummary = bleParamSwitchCount;
    Serial.printf("  BLE param: mode=%s switches=%lu\n",
                  currentBleParamMode == BLE_PARAM_BACKOFF ? "backoff" : "snappy",
                  (unsigned long)switchesThisWindow);
#endif
    printBuckets("  BLE interval ms", bleIntervalBuckets);
    Serial.println();
    printBuckets("  UDP interval ms", udpIntervalBuckets);
    Serial.println();
    printBuckets("  HID interval ms", hidIntervalBuckets);
    Serial.println();

    resetWindow();
    lastSummaryMs = now;
  }

  void reset() {
    lastSummaryMs = millis();
    lastBlePacketUs = 0;
    lastUdpPacketUs = 0;
    lastHidReportUs = 0;
    lastUdpPacketMs = 0;
    hasLastBleSeq = false;
    lastBleSeq = 0;
    hasLastUdpSeq = false;
    lastUdpSeq = 0;
    resetWindow();
  }
};

MovementDiagnostics movementDiagnostics;
#endif

/************** BLE CALLBACKS **************/
class MouseMoveCallback : public NimBLECharacteristicCallbacks {
  void onWrite(NimBLECharacteristic* pCharacteristic, NimBLEConnInfo& connInfo) {
    std::string value = pCharacteristic->getValue();
    const uint8_t* data = (const uint8_t*)value.data();
    size_t len = value.length();

    if (len == 0) return;

    // ----- Keyboard path -----
    // Keyboard combo packets: [0xF1, N, keyId1, keyId2, keyId3]
    if (data[0] == 0xF1 && len >= 2) {
      Serial.println("Keyboard path");
#if ENABLE_BLE_CONTROL_PATH
      // Override BLE conn-param breaker: keyboard input is latency-sensitive.
      requestBleConnParam(BLE_PARAM_SNAPPY, /*force=*/true);
#endif
      uint8_t count = data[1];
      size_t available = (len >= 2) ? (len - 2) : 0;
      size_t n = std::min<size_t>(available, count);
      handleKeyboardCombo(data + 2, n);
      return;
    }

    // ----- Mouse path -----
    // Release mouse packets: [buttons, Scroll, dxLE(1), dxLE(2), dyLE(1), dyLE(2)]
    // Debug mouse packets:  [0xA1, seq, buttons, Scroll, dxLE(1), dxLE(2), dyLE(1), dyLE(2)]
    bool hasSequence = false;
    uint8_t sequence = 0;
    const uint8_t* mouseData = data;
    size_t mouseLen = len;

    if (len == 8 && data[0] == DEBUG_MOUSE_PACKET_MARKER) {
      hasSequence = true;
      sequence = data[1];
      mouseData = data + 2;
      mouseLen = 6;
    }

    if (mouseLen != 6) {
#if MOVEMENT_DIAGNOSTICS
      movementDiagnostics.recordMalformedMousePacket();
#endif
      Serial.printf("⚠️ Got %d bytes (expected 6, or debug 8)\n", value.length());
      return;
    }

    // Parse button state
    uint8_t buttonState = mouseData[0];
    
    // Parse scroll wheel (signed byte)
    int8_t wheelDelta = (int8_t)mouseData[1];
    
    // Parse mouse movement (signed 16-bit integers)
    int16_t dx = (int16_t)(mouseData[2] | (mouseData[3] << 8));
    int16_t dy = (int16_t)(mouseData[4] | (mouseData[5] << 8));
    uint8_t maskedButtons = buttonState & 0x03; // keeps left and right button bits only
#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.recordBlePacket(hasSequence, sequence);
#endif

    bool buttonChanged = false;
    int32_t pendingDxSnapshot = 0;
    int32_t pendingDySnapshot = 0;
    enqueueMouseState(dx, dy, wheelDelta, maskedButtons, true, &buttonChanged, &pendingDxSnapshot, &pendingDySnapshot);

#if ENABLE_BLE_CONTROL_PATH
    // Override BLE conn-param breaker on any button change so click/release
    // during a drag isn't queued behind a backoff connection interval.
    if (buttonChanged) {
      requestBleConnParam(BLE_PARAM_SNAPPY, /*force=*/true);
    }
#endif

#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.recordPending((float)pendingDxSnapshot, (float)pendingDySnapshot);
#endif

#if MOVEMENT_VERBOSE_PACKET_LOGS
    // Debug output
    if (dx != 0 || dy != 0 || wheelDelta != 0 || buttonChanged) {
      Serial.printf("📊 seq=%u dx=%d dy=%d buttons=%d wheel=%d\n",
                    sequence, dx, dy, maskedButtons, wheelDelta);
    }
#endif
  }

  // Lazy USB keyboard init. Booting Keyboard.begin() alongside the custom
  // mouse HID is the case most associated with the espressif USBHID
  // "report wait failed" semaphore-mismatch pattern; defer it until we
  // actually need to type so users who never press a key don't pay that
  // cost in their motion path.
  static void ensureKeyboardInitialized() {
    static bool keyboardInitialized = false;
    if (keyboardInitialized) return;
    Keyboard.begin();
    keyboardInitialized = true;
    Serial.println("🎹 USB keyboard initialized (lazy)");
  }

  // Handle keyboard combo packet
  void handleKeyboardCombo(const uint8_t* keyIds, size_t count) {
    if (count == 0) {
      Serial.println("ℹ️ Keyboard combo with 0 keys");
      return;
    }

    ensureKeyboardInitialized();

    Serial.print("🎹 Keyboard combo: ");
    for (size_t i = 0; i < count; ++i) {
      Serial.printf("%u ", keyIds[i]);
    }
    Serial.println();

    // Press all keys
    for (size_t i = 0; i < count; ++i) {
      pressLogicalKey(keyIds[i], /*pressed=*/true);
    }

    // Short hold, then release
    delay(5);
    Keyboard.releaseAll();
  }

  // Map your LogicalKey IDs → HID keycodes (macOS mapping for now)
  void pressLogicalKey(uint8_t id, bool pressed) {
    uint8_t code = 0;

    switch (id) {
        // Modifiers (use KEY_* macros)
        case 1:  code = KEY_LEFT_CTRL;  break;  // .control
        case 2:  code = KEY_LEFT_SHIFT; break;  // .shift
        case 3:  code = KEY_LEFT_ALT;   break;  // .altOption
        case 4:  code = KEY_LEFT_GUI;   break;  // .commandGUI
        case 5:  code = 0; break;  // .fn (reserved, no HID equivalent)

        // Arrows
        case 20: code = KEY_LEFT_ARROW;  break; // .arrowLeft
        case 21: code = KEY_RIGHT_ARROW; break; // .arrowRight
        case 22: code = KEY_UP_ARROW;    break; // .arrowUp
        case 23: code = KEY_DOWN_ARROW;  break; // .arrowDown

        // Space / backspace / enter / tab
        case 24: code = KEY_ESC;         break; // .escape
        case 25: code = KEY_TAB;         break; // .tab
        case 26: code = KEY_RETURN;      break; // .enterReturn
        case 27: code = KEY_BACKSPACE;   break; // .backspace
        case 28: code = KEY_DELETE;       break; // .deleteForward
        case 29: code = KEY_SPACE;        break; // .space

        // Letters: use ASCII (40-65)
        case 40: code = 'a'; break;  // .keyA
        case 41: code = 'b'; break;  // .keyB
        case 42: code = 'c'; break;  // .keyC
        case 43: code = 'd'; break;  // .keyD
        case 44: code = 'e'; break;  // .keyE
        case 45: code = 'f'; break;  // .keyF
        case 46: code = 'g'; break;  // .keyG
        case 47: code = 'h'; break;  // .keyH
        case 48: code = 'i'; break;  // .keyI
        case 49: code = 'j'; break;  // .keyJ
        case 50: code = 'k'; break;  // .keyK
        case 51: code = 'l'; break;  // .keyL
        case 52: code = 'm'; break;  // .keyM
        case 53: code = 'n'; break;  // .keyN
        case 54: code = 'o'; break;  // .keyO
        case 55: code = 'p'; break;  // .keyP
        case 56: code = 'q'; break;  // .keyQ
        case 57: code = 'r'; break;  // .keyR
        case 58: code = 's'; break;  // .keyS
        case 59: code = 't'; break;  // .keyT
        case 60: code = 'u'; break;  // .keyU
        case 61: code = 'v'; break;  // .keyV
        case 62: code = 'w'; break;  // .keyW
        case 63: code = 'x'; break;  // .keyX
        case 64: code = 'y'; break;  // .keyY
        case 65: code = 'z'; break;  // .keyZ

        // Digits: use ASCII (80-89)
        case 80: code = '0'; break;  // .digit0
        case 81: code = '1'; break;  // .digit1
        case 82: code = '2'; break;  // .digit2
        case 83: code = '3'; break;  // .digit3
        case 84: code = '4'; break;  // .digit4
        case 85: code = '5'; break;  // .digit5
        case 86: code = '6'; break;  // .digit6
        case 87: code = '7'; break;  // .digit7
        case 88: code = '8'; break;  // .digit8
        case 89: code = '9'; break;  // .digit9

        // Punctuation: use ASCII (90-100, sequential after digit9)
        case 90: code = '-'; break;      // .minus
        case 91: code = '='; break;      // .equal
        case 92: code = '['; break;      // .leftBracket
        case 93: code = ']'; break;      // .rightBracket
        case 94: code = ';'; break;      // .semicolon
        case 95: code = '\''; break;     // .apostrophe
        case 96: code = ','; break;      // .comma
        case 97: code = '.'; break;      // .period
        case 98: code = '/'; break;      // .slash
        case 99: code = '\\'; break;     // .backslash
        case 100: code = '`'; break;     // .backtick

        // Currency / extended symbols (no direct ASCII/HID equivalent)
        case 170: code = 0; break;  // .euro
        case 171: code = 0; break;  // .pound
        case 172: code = 0; break;  // .yen
        case 173: code = 0; break;  // .middleDot

        default:
            Serial.printf("⚠️ Unknown logical key id: %u\n", id);
            return;
    }

    if (code == 0) {
        // Reserved or unmapped keys (fn, currency symbols)
        Serial.printf("ℹ️ Logical key id %u is reserved/unmapped\n", id);
        return;
    }

    if (pressed) {
        Keyboard.press(code);   // code is ASCII or KEY_* macro
    } else {
        Keyboard.release(code);
    }
  }
};

/************** BLE CONN-PARAM BREAKER HELPERS **************/
#if ENABLE_BLE_CONTROL_PATH
// `force` bypasses both the no-op-on-same-mode short-circuit and the
// debounce. Used by the override path on a button or keyboard event.
static void requestBleConnParam(BleConnParamMode mode, bool force) {
  if (!connectedBleHandleValid || pServer == nullptr) return;
  if (!force && mode == currentBleParamMode) return;
  uint16_t minInt = 12, maxInt = 24, latency = 0, timeoutVal = 400;
  if (mode == BLE_PARAM_BACKOFF) {
    // ~30 ms .. 60 ms connection interval (units of 1.25 ms).
    minInt = 24; maxInt = 48;
  }
  pServer->updateConnParams(connectedBleHandle, minInt, maxInt, latency, timeoutVal);
  if (mode != currentBleParamMode) {
    bleParamSwitchCount++;
    currentBleParamMode = mode;
  }
  lastBleParamRequestMs = millis();
}

static void evaluateBleConnParamMode() {
  if (!connectedBleHandleValid) return;
  uint32_t now = millis();
  bool motionActive = false;
#if UDP_MOTION_POC
  uint32_t lastMotion = lastUdpMotionMs;
  if (lastMotion != 0 && (now - lastMotion) < MOTION_ACTIVE_WINDOW_MS) {
    motionActive = true;
  }
#endif
  uint8_t btns;
  portENTER_CRITICAL(&mouseStateMux);
  btns = mouseState.currentButtons;
  portEXIT_CRITICAL(&mouseStateMux);
  BleConnParamMode desired = (motionActive && btns == 0) ? BLE_PARAM_BACKOFF : BLE_PARAM_SNAPPY;
  if (desired == currentBleParamMode) return;
  if (now - lastBleParamRequestMs < BLE_PARAM_DEBOUNCE_MS) return;
  requestBleConnParam(desired, /*force=*/false);
}
#endif

/************** SERVER CALLBACKS **************/
class ServerCallbacks : public NimBLEServerCallbacks {
  void onConnect(NimBLEServer* pServer, NimBLEConnInfo& connInfo) {
    deviceConnected = true;
    Serial.println("📶 iPhone connected");
    
    // Update connection parameters for better stability (iOS-optimized)
    uint16_t handle = connInfo.getConnHandle();
    pServer->updateConnParams(
      handle,
      12,   // min interval (15ms)
      24,   // max interval (30ms)
      0,    // latency
      400   // timeout (4000ms)
    );
    connectedBleHandle = handle;
    connectedBleHandleValid = true;
    currentBleParamMode = BLE_PARAM_SNAPPY;
    lastBleParamRequestMs = millis();
    
    NimBLEDevice::getAdvertising()->stop();
    Serial.println("✅ Connection parameters updated");
  }
  
  void onDisconnect(NimBLEServer* pServer, NimBLEConnInfo& connInfo, int reason) {
    deviceConnected = false;
    connectedBleHandleValid = false;
    currentBleParamMode = BLE_PARAM_SNAPPY;
    Serial.printf("🔌 iPhone disconnected, reason: %d\n", reason);
    delay(100);
  }
  
  void onMTUChange(uint16_t MTU, NimBLEConnInfo& connInfo) {
    Serial.printf("📏 MTU updated to: %d\n", MTU);
  }
};

// Static callback instances to avoid memory leaks
static ServerCallbacks serverCallbacks;
static MouseMoveCallback mouseMoveCallback;

#if UDP_MOTION_POC
/************** UDP MOTION POC **************/
// Returns true iff Wi-Fi associated AND the UDP listener bound. Caller
// uses this to decide whether to start the udp-rx task. Calling parsePacket
// on a never-begin()'d WiFiUDP is safe (returns 0) but spawning a task
// that just spins forever wastes CPU and obscures the real failure.
bool setupUdpMotionPoc() {
  Serial.println("🔧 Initializing UDP motion POC...");

  if (strlen(WIFI_SSID) == 0) {
    Serial.println("⚠️ WIFI_SSID is empty; UDP motion POC is disabled until credentials are set.");
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

void pollUdpMotionPackets() {
  uint8_t packet[32];
#if UDP_MOTION_VERBOSE_RX_LOGS
  static uint32_t udpVerboseLogCount = 0;
#endif

  while (true) {
    int packetSize = udpMotion.parsePacket();
    if (packetSize <= 0) {
      return;
    }

#if MOVEMENT_DIAGNOSTICS
    // Pre-parse "raw packet seen" counter. Counted before any size/marker
    // checks so a malformed packet still proves lwIP delivered something.
    movementDiagnostics.recordUdpRxRawPacket();
#endif

#if UDP_MOTION_VERBOSE_RX_LOGS
    if (udpVerboseLogCount < 20) {
      Serial.printf("📡 UDP packet size=%d from %s:%u\n",
                    packetSize,
                    udpMotion.remoteIP().toString().c_str(),
                    udpMotion.remotePort());
      udpVerboseLogCount++;
    }
#endif

    int readLen = udpMotion.read(packet, sizeof(packet));
    if (readLen <= 0) {
#if MOVEMENT_DIAGNOSTICS
      movementDiagnostics.recordMalformedUdpPacket();
#endif
      continue;
    }

    if (packet[0] == UDP_MOTION_PACKET_MARKER_V2) {
      if (packetSize < 7 || readLen < 7) {
#if MOVEMENT_DIAGNOSTICS
        movementDiagnostics.recordMalformedUdpPacket();
#endif
        continue;
      }

      uint8_t sequence = packet[1];
      uint8_t frameCount = packet[2];
      size_t expectedLen = 3 + ((size_t)frameCount * 4);
      if (frameCount == 0 ||
          frameCount > UDP_SUBFRAMES_PER_PACKET_MAX ||
          packetSize != expectedLen ||
          readLen != expectedLen) {
#if MOVEMENT_DIAGNOSTICS
        movementDiagnostics.recordMalformedUdpPacket();
#endif
#if UDP_MOTION_VERBOSE_RX_LOGS
        Serial.printf("⚠️ UDP V2 malformed packetSize=%d readLen=%d frameCount=%u\n",
                      packetSize,
                      readLen,
                      frameCount);
#endif
        continue;
      }

#if MOVEMENT_DIAGNOSTICS
      movementDiagnostics.recordUdpDatagram(sequence);
      movementDiagnostics.recordUdpSubframes(frameCount);
#endif

      for (uint8_t i = 0; i < frameCount; i++) {
        size_t offset = 3 + ((size_t)i * 4);
        int16_t dx = (int16_t)(packet[offset] | (packet[offset + 1] << 8));
        int16_t dy = (int16_t)(packet[offset + 2] | (packet[offset + 3] << 8));
        bool overflow = false;
        uint8_t depth = enqueueMotionFrame(dx, dy, &overflow);
#if MOVEMENT_DIAGNOSTICS
        movementDiagnostics.recordMotionFrameQueueDepth(depth);
        if (overflow) {
          movementDiagnostics.recordMotionFrameOverflowDrop();
        }
#endif
      }
      continue;
    }

    if (packet[0] == UDP_MOTION_PACKET_MARKER_LEGACY && packetSize == 6 && readLen == 6) {
      uint8_t sequence = packet[1];
      int16_t dx = (int16_t)(packet[2] | (packet[3] << 8));
      int16_t dy = (int16_t)(packet[4] | (packet[5] << 8));

#if MOVEMENT_DIAGNOSTICS
      movementDiagnostics.recordUdpDatagram(sequence);
      movementDiagnostics.recordUdpSubframes(1);
#endif
      bool overflow = false;
      uint8_t depth = enqueueMotionFrame(dx, dy, &overflow);
#if MOVEMENT_DIAGNOSTICS
      movementDiagnostics.recordMotionFrameQueueDepth(depth);
      if (overflow) {
        movementDiagnostics.recordMotionFrameOverflowDrop();
      }
#endif
      continue;
    }

#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.recordMalformedUdpPacket();
#endif

#if MOVEMENT_VERBOSE_PACKET_LOGS
    Serial.printf("⚠️ UDP malformed packetSize=%d readLen=%d marker=0x%02X\n",
                  packetSize,
                  readLen,
                  packet[0]);
#endif
  }
}

// Dedicated UDP RX task pinned to core 0 (Wi-Fi/PRO_CPU) so the Arduino
// main loop and HID pacer (core 1) aren't gated by Wi-Fi packet drains.
// Tail jitter on the motion-frame queue went up when both ran on core 1.
static void udpRxTask(void* parameter) {
  // One-shot proof-of-life log so we can confirm xTaskCreatePinnedToCore
  // actually scheduled us. Printed from inside the task (not from setup)
  // so it's only emitted if the task body really runs.
  Serial.println("🚦 udp-rx task running on core 0");
  while (true) {
#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.recordUdpRxIteration();
#endif
    pollUdpMotionPackets();
    vTaskDelay(pdMS_TO_TICKS(1));
  }
}

static void startUdpRxTask() {
  if (udpRxTaskHandle != nullptr) {
    return;
  }
  BaseType_t created = xTaskCreatePinnedToCore(
    udpRxTask,
    "udp-rx",
    4096,
    nullptr,
    4,
    &udpRxTaskHandle,
    0
  );
  if (created != pdPASS) {
    udpRxTaskHandle = nullptr;
    Serial.println("⚠️ Failed to create udp-rx task; UDP motion will be inactive.");
  }
}
#endif

/************** HID REPORT OUTPUT **************/
// Espressif USBHID::SendReport already serializes internally; an outer
// mutex was found to amplify a known semaphore-timeout pattern that made
// every motion report return false. Keep this single-writer (HID pacer task).
static bool sendMouseHidReport(int16_t dx, int16_t dy, int8_t wheel, uint8_t buttons) {
  mouseReport.buttons = buttons;
  mouseReport.x = dx;
  mouseReport.y = dy;
  mouseReport.wheel = wheel;

  bool sendReturnValue = Mouse.sendReport();

  mouseReport.x = 0;
  mouseReport.y = 0;
  mouseReport.wheel = 0;
  mouseReport.buttons = buttons;

  return sendReturnValue;
}

static void takeBleAggregateForHid(int16_t* dxOut, int8_t* wheelOut, uint8_t* buttonsOut, bool* buttonDirtyOut, bool* cappedOut) {
  int16_t emitDx = 0;
  int16_t emitDy = 0;
  int16_t emitWheel = 0;
  bool capped = false;
  bool buttonDirty = false;
  bool staleAggregateDropped = false;
  uint8_t buttons = 0;
  uint32_t nowMs = millis();

  portENTER_CRITICAL(&mouseStateMux);

  bool hasPendingAggregate = (mouseState.pendingDx != 0 || mouseState.pendingDy != 0 || mouseState.pendingWheel != 0);
  if (hasPendingAggregate &&
      mouseState.lastMovementMs != 0 &&
      (uint32_t)(nowMs - mouseState.lastMovementMs) > STALE_MOVEMENT_MS) {
    mouseState.pendingDx = 0;
    mouseState.pendingDy = 0;
    mouseState.pendingWheel = 0;
    staleAggregateDropped = true;
  }

  // BLE deltas arrive in scaled units (iOS PointerMotionEngine multiplies
  // by pointerScale on every motion path). Quantize-and-divide here with a
  // fractional remainder so this matches the UDP HID pacer's behavior and
  // keeps host-perceived sensitivity stable across UDP/BLE.
  int32_t scaledEmitDx = mouseState.pendingDx / POINTER_SCALE;
  int32_t scaledEmitDy = mouseState.pendingDy / POINTER_SCALE;
  int32_t scaledEmitDxClamped = scaledEmitDx;
  int32_t scaledEmitDyClamped = scaledEmitDy;
  if (scaledEmitDxClamped > MAX_HID_DELTA_PER_REPORT) scaledEmitDxClamped = MAX_HID_DELTA_PER_REPORT;
  else if (scaledEmitDxClamped < -MAX_HID_DELTA_PER_REPORT) scaledEmitDxClamped = -MAX_HID_DELTA_PER_REPORT;
  if (scaledEmitDyClamped > MAX_HID_DELTA_PER_REPORT) scaledEmitDyClamped = MAX_HID_DELTA_PER_REPORT;
  else if (scaledEmitDyClamped < -MAX_HID_DELTA_PER_REPORT) scaledEmitDyClamped = -MAX_HID_DELTA_PER_REPORT;
  emitDx = (int16_t)scaledEmitDxClamped;
  emitDy = (int16_t)scaledEmitDyClamped;
  emitWheel = clampInt16ToInt8(mouseState.pendingWheel, MAX_WHEEL_DELTA_PER_REPORT);
  capped = (scaledEmitDx != scaledEmitDxClamped ||
            scaledEmitDy != scaledEmitDyClamped ||
            mouseState.pendingWheel != emitWheel);

  mouseState.pendingDx -= (int32_t)emitDx * POINTER_SCALE;
  mouseState.pendingDy -= (int32_t)emitDy * POINTER_SCALE;
  mouseState.pendingWheel -= emitWheel;
  buttonDirty = mouseState.buttonDirty;
  mouseState.buttonDirty = false;
  buttons = mouseState.currentButtons;

  portEXIT_CRITICAL(&mouseStateMux);

#if MOVEMENT_DIAGNOSTICS
  if (staleAggregateDropped) {
    movementDiagnostics.recordStaleDrop(1, 0);
  }
#endif

  dxOut[0] = emitDx;
  dxOut[1] = emitDy;
  *wheelOut = (int8_t)emitWheel;
  *buttonsOut = buttons;
  *buttonDirtyOut = buttonDirty;
  *cappedOut = capped;
}

static MotionFrame nextLocalGeneratorFrame() {
  static int8_t direction = 1;
  static uint16_t ticksInDirection = 0;
  ticksInDirection++;
  if (ticksInDirection >= 125) {
    ticksInDirection = 0;
    direction = -direction;
  }
  return {direction, 0, micros()};
}

void hidPacerTask(void* parameter) {
  TickType_t lastWake = xTaskGetTickCount();
  uint32_t lastTickUs = micros();

  while (true) {
    vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(8));

    uint32_t nowUs = micros();
    uint32_t elapsedUs = nowUs - lastTickUs;
    uint32_t lateUs = elapsedUs > HID_REPORT_INTERVAL_US ? elapsedUs - HID_REPORT_INTERVAL_US : 0;
    lastTickUs = nowUs;

#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.recordHidTick(lateUs);
#endif

    MotionFrame frame;
    bool hasFrame = false;
    uint32_t staleFrameDrops = 0;
    uint8_t queueDepth = 0;

#if HID_LOCAL_GENERATOR_TEST
    frame = nextLocalGeneratorFrame();
    hasFrame = true;
#else
    hasFrame = popFreshMotionFrame(&frame, nowUs, &staleFrameDrops, &queueDepth);
#endif

#if MOVEMENT_DIAGNOSTICS
    if (staleFrameDrops > 0) {
      movementDiagnostics.recordMotionFrameStaleDrops(staleFrameDrops);
    }
    movementDiagnostics.recordMotionFrameQueueDepth(queueDepth);
#endif

    int16_t aggregateDxDy[2] = {0, 0};
    int8_t wheel = 0;
    uint8_t buttons = 0;
    bool buttonDirty = false;
    bool aggregateCapped = false;
    takeBleAggregateForHid(aggregateDxDy, &wheel, &buttons, &buttonDirty, &aggregateCapped);

    // UDP frames arrive in scaled units (iOS multiplied by POINTER_SCALE).
    // Accumulate across ticks and divide-with-remainder so we don't drop
    // sub-quantum motion. In local-generator test mode the generator
    // already produces HID-scale values, so bypass the divide.
    int16_t udpDx = 0;
    int16_t udpDy = 0;
#if HID_LOCAL_GENERATOR_TEST
    if (hasFrame) {
      udpDx = frame.dx;
      udpDy = frame.dy;
    }
#else
    static int32_t hidScaledDxAccum = 0;
    static int32_t hidScaledDyAccum = 0;
    if (hasFrame) {
      hidScaledDxAccum += frame.dx;
      hidScaledDyAccum += frame.dy;
    }
    if (hidScaledDxAccum != 0 || hidScaledDyAccum != 0) {
      udpDx = (int16_t)(hidScaledDxAccum / POINTER_SCALE);
      udpDy = (int16_t)(hidScaledDyAccum / POINTER_SCALE);
      hidScaledDxAccum -= (int32_t)udpDx * POINTER_SCALE;
      hidScaledDyAccum -= (int32_t)udpDy * POINTER_SCALE;
    }
#endif

    int32_t combinedDx = (int32_t)aggregateDxDy[0] + (int32_t)udpDx;
    int32_t combinedDy = (int32_t)aggregateDxDy[1] + (int32_t)udpDy;
    bool combinedCapped = false;
    if (combinedDx > MAX_HID_DELTA_PER_REPORT) { combinedDx = MAX_HID_DELTA_PER_REPORT; combinedCapped = true; }
    else if (combinedDx < -MAX_HID_DELTA_PER_REPORT) { combinedDx = -MAX_HID_DELTA_PER_REPORT; combinedCapped = true; }
    if (combinedDy > MAX_HID_DELTA_PER_REPORT) { combinedDy = MAX_HID_DELTA_PER_REPORT; combinedCapped = true; }
    else if (combinedDy < -MAX_HID_DELTA_PER_REPORT) { combinedDy = -MAX_HID_DELTA_PER_REPORT; combinedCapped = true; }
    int16_t reportDx = (int16_t)combinedDx;
    int16_t reportDy = (int16_t)combinedDy;

    bool shouldSend = (reportDx != 0 ||
                       reportDy != 0 ||
                       wheel != 0 ||
                       buttonDirty);

    if (!shouldSend) {
      continue;
    }

    bool sendReturnValue = sendMouseHidReport(reportDx, reportDy, wheel, buttons);
#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.recordHidReport(sendReturnValue, reportDx, reportDy, aggregateCapped || combinedCapped);
#endif
  }
}

static void startHidPacerTask() {
  if (hidPacerTaskHandle != nullptr) {
    return;
  }
  xTaskCreatePinnedToCore(
    hidPacerTask,
    "hid-pacer",
    4096,
    nullptr,
    3,
    &hidPacerTaskHandle,
    1
  );
}

/************** SETUP **************/
void setup() {
  Serial.begin(115200);
  delay(500);
  
  /*** Initialize USB HID with custom descriptor ***/
  Serial.println("🔧 Initializing Custom HID Mouse...");
  
  // Add custom mouse device (Mouse is already initialized as global object)
  HID.addDevice(&Mouse, sizeof(MOUSE_REPORT_DESCRIPTOR));
  
  // Start USB: initialize HID, keyboard, then the USB stack
  HID.begin();
  USB.begin();
  resetMousePacerState();
  resetMotionFrameQueue();
  startHidPacerTask();
  
  Serial.println("✅ Custom USB HID Mouse initialized");  

#if UDP_MOTION_POC
  if (setupUdpMotionPoc()) {
    startUdpRxTask();
  }
#endif
  
#if ENABLE_BLE_CONTROL_PATH
  /*** Initialize BLE ***/
  Serial.println("🔧 Initializing NimBLE...");
  
  NimBLEDevice::init("ESP_MouseBridge");
  NimBLEDevice::setMTU(247);
  NimBLEDevice::setPower(ESP_PWR_LVL_P6);
  NimBLEDevice::setSecurityAuth(false, false, true);
  NimBLEDevice::setSecurityIOCap(BLE_HS_IO_NO_INPUT_OUTPUT);
  
  // Create server
  pServer = NimBLEDevice::createServer();
  pServer->setCallbacks(&serverCallbacks);
  
  // Create service
  pService = pServer->createService(SERVICE_UUID);
  
  // Create characteristic
  pChar = pService->createCharacteristic(
    CHARACTERISTIC_UUID, 
    NIMBLE_PROPERTY::WRITE_NR
  );
  pChar->setCallbacks(&mouseMoveCallback);
  
  pService->start();
  
  // Configure advertising
  NimBLEAdvertising* pAdvertising = NimBLEDevice::getAdvertising();
  pAdvertising->addServiceUUID(SERVICE_UUID);
  pAdvertising->setMinInterval(32);
  pAdvertising->setMaxInterval(244);
  pAdvertising->start();
  
  Serial.println("✅ BLE advertising started");
  Serial.println("📱 Ready for iPhone connection");
  Serial.println("🎧 Listening for writes...");
  Serial.println();
#else
  Serial.println("ℹ️ BLE control path disabled for UDP-only test mode");
#endif
}

/************** MAIN LOOP **************/
void loop() {
  // UDP RX is handled by the dedicated udpRxTask pinned to core 0; this
  // main loop runs on core 1 and only orchestrates connection state and
  // diagnostics printing.

#if ENABLE_BLE_CONTROL_PATH
  // BLE conn-param breaker tick. Cheap; runs every loop iteration but
  // its own debounce gates the actual updateConnParams call.
  evaluateBleConnParamMode();
#endif

  // Handle connection state changes
  if (deviceConnected && !oldDeviceConnected) {
    oldDeviceConnected = deviceConnected;
    resetMousePacerState();
    resetMotionFrameQueue();
#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.reset();
#endif
  }
  
  // Restart advertising if disconnected
  if (!deviceConnected && oldDeviceConnected) {
    resetMousePacerState();
    resetMotionFrameQueue();
    Mouse.reset();
    sendMouseHidReport(0, 0, 0, 0);
    delay(500);
#if ENABLE_BLE_CONTROL_PATH
    NimBLEDevice::getAdvertising()->start();
#endif
    Serial.println("🔄 Restarting advertising...");
    oldDeviceConnected = deviceConnected;
#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.reset();
#endif
  }

#if MOVEMENT_DIAGNOSTICS
  if (deviceConnected
#if UDP_MOTION_POC
      || movementDiagnostics.hasRecentUdpActivity()
#endif
  ) {
    movementDiagnostics.printSummaryIfNeeded();
  }
#endif
  
  delay(1);
}
