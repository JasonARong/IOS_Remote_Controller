#include <Arduino.h>
#include <USB.h>
#include <USBHID.h>
#include <USBHIDKeyboard.h>
#include <NimBLEDevice.h>

USBHID HID;
USBHIDKeyboard Keyboard;

#define SERVICE_UUID        "00001234-0000-1000-8000-00805f9b34fb"
#define CHARACTERISTIC_UUID "0000abcd-0000-1000-8000-00805f9b34fb"

#define MOVEMENT_DIAGNOSTICS 1
#define MOVEMENT_VERBOSE_PACKET_LOGS 0
#define DEBUG_MOUSE_PACKET_MARKER 0xA1
#define HID_REPORT_INTERVAL_US 16667UL
#define STALE_MOVEMENT_MS 50UL
#define MAX_HID_DELTA_PER_REPORT 64
#define MAX_WHEEL_DELTA_PER_REPORT 1

NimBLEServer* pServer = nullptr;
NimBLEService* pService = nullptr;
NimBLECharacteristic* pChar = nullptr;

bool deviceConnected = false;
bool oldDeviceConnected = false;


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

#if MOVEMENT_DIAGNOSTICS
/************** MOVEMENT DIAGNOSTICS **************/
class MovementDiagnostics {
private:
  unsigned long lastSummaryMs = 0;
  unsigned long lastBlePacketUs = 0;
  unsigned long lastHidReportUs = 0;

  uint32_t blePackets = 0;
  uint32_t bleSeqGaps = 0;
  uint32_t malformedMousePackets = 0;
  uint32_t hidReports = 0;
  uint32_t hidMovingReports = 0;
  uint32_t hidSendReturnFalse = 0;
  uint32_t staleDrops = 0;
  uint32_t cappedReports = 0;
  float maxPendingAbs = 0.0f;

  bool hasLastSeq = false;
  uint8_t lastSeq = 0;

  uint32_t bleIntervalBuckets[7] = {0};
  uint32_t hidIntervalBuckets[7] = {0};

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
    malformedMousePackets = 0;
    hidReports = 0;
    hidMovingReports = 0;
    hidSendReturnFalse = 0;
    staleDrops = 0;
    cappedReports = 0;
    maxPendingAbs = 0.0f;
    memset(bleIntervalBuckets, 0, sizeof(bleIntervalBuckets));
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
      if (hasLastSeq) {
        uint8_t expected = lastSeq + 1;
        if (seq != expected) {
          bleSeqGaps += (uint8_t)(seq - expected);
        }
      }
      lastSeq = seq;
      hasLastSeq = true;
    }
  }

  void recordMalformedMousePacket() {
    malformedMousePackets++;
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

  void recordHidReport(bool sendReturnValue, int16_t dx, int16_t dy, bool capped) {
    unsigned long now = micros();
    if (lastHidReportUs != 0) {
      recordInterval(now - lastHidReportUs, hidIntervalBuckets);
    }
    lastHidReportUs = now;
    hidReports++;

    if (dx != 0 || dy != 0) {
      hidMovingReports++;
    }
    if (!sendReturnValue) {
      hidSendReturnFalse++;
    }
    if (capped) {
      cappedReports++;
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

    Serial.printf("📈 ESP movement diagnostics | BLE rx=%lu/s seqGaps=%lu malformed=%lu maxPending=%.1f staleDrops=%lu capped=%lu | HID reports=%lu/s moving=%lu sendReturnFalse=%lu\n",
                  (unsigned long)blePackets,
                  (unsigned long)bleSeqGaps,
                  (unsigned long)malformedMousePackets,
                  maxPendingAbs,
                  (unsigned long)staleDrops,
                  (unsigned long)cappedReports,
                  (unsigned long)hidReports,
                  (unsigned long)hidMovingReports,
                  (unsigned long)hidSendReturnFalse);
    printBuckets("  BLE interval ms", bleIntervalBuckets);
    Serial.println();
    printBuckets("  HID interval ms", hidIntervalBuckets);
    Serial.println();

    resetWindow();
    lastSummaryMs = now;
  }

  void reset() {
    lastSummaryMs = millis();
    lastBlePacketUs = 0;
    lastHidReportUs = 0;
    hasLastSeq = false;
    lastSeq = 0;
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
    uint32_t nowMs = millis();

    portENTER_CRITICAL(&mouseStateMux);
    mouseState.pendingDx += dx;
    mouseState.pendingDy += dy;
    mouseState.pendingWheel += wheelDelta;
    if (dx != 0 || dy != 0 || wheelDelta != 0) {
      mouseState.lastMovementMs = nowMs;
    }
    if (maskedButtons != mouseState.currentButtons) {
      mouseState.currentButtons = maskedButtons;
      mouseState.buttonDirty = true;
      buttonChanged = true;
    }
    pendingDxSnapshot = mouseState.pendingDx;
    pendingDySnapshot = mouseState.pendingDy;
    portEXIT_CRITICAL(&mouseStateMux);

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

  // Handle keyboard combo packet
  void handleKeyboardCombo(const uint8_t* keyIds, size_t count) {
    if (count == 0) {
      Serial.println("ℹ️ Keyboard combo with 0 keys");
      return;
    }

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

/************** SERVER CALLBACKS **************/
class ServerCallbacks : public NimBLEServerCallbacks {
  void onConnect(NimBLEServer* pServer, NimBLEConnInfo& connInfo) {
    deviceConnected = true;
    Serial.println("📶 iPhone connected");
    
    // Update connection parameters for better stability (iOS-optimized)
    pServer->updateConnParams(
      connInfo.getConnHandle(),
      12,   // min interval (15ms)
      24,   // max interval (30ms)
      0,    // latency
      400   // timeout (4000ms)
    );
    
    NimBLEDevice::getAdvertising()->stop();
    Serial.println("✅ Connection parameters updated");
  }
  
  void onDisconnect(NimBLEServer* pServer, NimBLEConnInfo& connInfo, int reason) {
    deviceConnected = false;
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

/************** FIXED-RATE HID PACER **************/
void emitMouseReportIfDue() {
  uint32_t nowUs = micros();
  uint32_t nowMs = millis();

  bool staleDropped = false;
  int32_t droppedDx = 0;
  int32_t droppedDy = 0;
  int16_t emitWheel = 0;
  int16_t emitDx = 0;
  int16_t emitDy = 0;
  int32_t remainingDx = 0;
  int32_t remainingDy = 0;
  uint8_t buttons = 0;
  bool shouldSend = false;
  bool capped = false;

  portENTER_CRITICAL(&mouseStateMux);

  if (mouseState.lastHidUs == 0) {
    mouseState.lastHidUs = nowUs;
    portEXIT_CRITICAL(&mouseStateMux);
    return;
  }

  if ((uint32_t)(nowUs - mouseState.lastHidUs) < HID_REPORT_INTERVAL_US) {
    portEXIT_CRITICAL(&mouseStateMux);
    return;
  }
  mouseState.lastHidUs = nowUs;

  bool hasPendingMotion = (mouseState.pendingDx != 0 || mouseState.pendingDy != 0 || mouseState.pendingWheel != 0);
  if (hasPendingMotion &&
      mouseState.lastMovementMs != 0 &&
      (uint32_t)(nowMs - mouseState.lastMovementMs) > STALE_MOVEMENT_MS) {
    droppedDx = mouseState.pendingDx;
    droppedDy = mouseState.pendingDy;
    mouseState.pendingDx = 0;
    mouseState.pendingDy = 0;
    mouseState.pendingWheel = 0;
    staleDropped = true;
    hasPendingMotion = false;
  }

  emitDx = clampInt32ToInt16(mouseState.pendingDx, MAX_HID_DELTA_PER_REPORT);
  emitDy = clampInt32ToInt16(mouseState.pendingDy, MAX_HID_DELTA_PER_REPORT);
  emitWheel = clampInt16ToInt8(mouseState.pendingWheel, MAX_WHEEL_DELTA_PER_REPORT);

  capped = (mouseState.pendingDx != emitDx ||
            mouseState.pendingDy != emitDy ||
            mouseState.pendingWheel != emitWheel);
  buttons = mouseState.currentButtons;
  shouldSend = (emitDx != 0 ||
                emitDy != 0 ||
                emitWheel != 0 ||
                mouseState.buttonDirty ||
                buttons != 0);

  if (shouldSend) {
    mouseState.pendingDx -= emitDx;
    mouseState.pendingDy -= emitDy;
    mouseState.pendingWheel -= emitWheel;
    mouseState.buttonDirty = false;
  }

  remainingDx = mouseState.pendingDx;
  remainingDy = mouseState.pendingDy;
  portEXIT_CRITICAL(&mouseStateMux);

#if MOVEMENT_DIAGNOSTICS
  if (staleDropped) {
    movementDiagnostics.recordStaleDrop(droppedDx, droppedDy);
  }
  movementDiagnostics.recordPending((float)remainingDx, (float)remainingDy);
#endif

  if (!shouldSend) {
    return;
  }

  mouseReport.buttons = buttons;
  mouseReport.x = emitDx;
  mouseReport.y = emitDy;
  mouseReport.wheel = (int8_t)emitWheel;

  bool sendReturnValue = Mouse.sendReport();
#if MOVEMENT_DIAGNOSTICS
  movementDiagnostics.recordHidReport(sendReturnValue, emitDx, emitDy, capped);
#endif

  // Movement and wheel are one-shot relative fields; button state persists.
  mouseReport.x = 0;
  mouseReport.y = 0;
  mouseReport.wheel = 0;
  mouseReport.buttons = buttons;
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
  Keyboard.begin();
  USB.begin();
  resetMousePacerState();
  
  Serial.println("✅ Custom USB HID Mouse initialized");  
  
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
}

/************** MAIN LOOP **************/
void loop() {
  // Handle connection state changes
  if (deviceConnected && !oldDeviceConnected) {
    oldDeviceConnected = deviceConnected;
    resetMousePacerState();
#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.reset();
#endif
  }

  if (deviceConnected) {
    emitMouseReportIfDue();
  }
  
  // Restart advertising if disconnected
  if (!deviceConnected && oldDeviceConnected) {
    resetMousePacerState();
    Mouse.reset();
    Mouse.sendReport();
    delay(500);
    NimBLEDevice::getAdvertising()->start();
    Serial.println("🔄 Restarting advertising...");
    oldDeviceConnected = deviceConnected;
#if MOVEMENT_DIAGNOSTICS
    movementDiagnostics.reset();
#endif
  }

#if MOVEMENT_DIAGNOSTICS
  if (deviceConnected) {
    movementDiagnostics.printSummaryIfNeeded();
  }
#endif
  
  delay(1);
}
