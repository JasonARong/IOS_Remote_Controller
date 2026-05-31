// HidState.h — shared staging for mouse/keyboard HID reports and pointer accumulators.
// Writers (UDP task, future BLE) stage here; the HID pacer task reads and sends USB reports.

#pragma once

#include <Arduino.h>

// Which transport currently owns input (used for mode switching and diagnostics).
enum ActiveInputMode : uint8_t {
  INPUT_MODE_NONE = 0,
  INPUT_MODE_WIFI = 1,
  INPUT_MODE_BLE = 2,
};

enum ReleaseReason : uint8_t {
  RELEASE_REASON_BACKGROUND = 1,
  RELEASE_REASON_TIMEOUT = 2,
  RELEASE_REASON_MODE_SWITCH = 3,
  RELEASE_REASON_DISCONNECT = 4,
  RELEASE_REASON_USER_EMERGENCY = 5,
};

// Mutable HID staging protected by hidStateMux (see HidState.cpp).
struct HidInputState {
  ActiveInputMode activeMode = INPUT_MODE_NONE;

  uint8_t currentButtons = 0;
  int16_t pendingWheel = 0;
  bool mouseReportPending = false;

  uint8_t keyboardModifiers = 0;
  uint8_t keyboardKeycodes[6] = {0, 0, 0, 0, 0, 0};
  bool keyboardReportPending = false;
  bool keyboardReleasePending = false;

  // Sub-pixel remainder after POINTER_SCALE division (HID pacer drains these).
  int32_t scaledAccumX = 0;
  int32_t scaledAccumY = 0;

  bool releaseAllMousePending = false;
  bool releaseAllKeyboardPending = false;
};

extern HidInputState hidState;
extern portMUX_TYPE hidStateMux;

int8_t clampWheel(int16_t value);
void setActiveInputMode(ActiveInputMode mode);
void resetSharedHidState();
void stageMouseButtons(uint8_t buttons);
void stageWheelTicks(int16_t wheelDelta);
void stageKeyboardReport(uint8_t modifiers, const uint8_t keycodes[6],
                         bool releaseAfterSend);
void stageKeyboardCombo(const uint8_t* logicalKeys, uint8_t count);
void releaseAllHidState(ReleaseReason reason);
uint8_t stagePointerMotion(int16_t dx, int16_t dy, bool* overflowOut);
