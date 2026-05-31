// HidState.cpp — stage mouse, wheel, keyboard, and pointer motion for the HID pacer.
// All public mutators take hidStateMux; pointer motion is delegated to MotionQueue.

#include "HidState.h"

#include "Diagnostics.h"
#include "MotionQueue.h"

HidInputState hidState;
portMUX_TYPE hidStateMux = portMUX_INITIALIZER_UNLOCKED;

int8_t clampWheel(int16_t value) {
  if (value > 127) return 127;
  if (value < -127) return -127;
  return (int8_t)value;
}

void setActiveInputMode(ActiveInputMode mode) {
  portENTER_CRITICAL(&hidStateMux);
  hidState.activeMode = mode;
  portEXIT_CRITICAL(&hidStateMux);
}

void resetSharedHidState() {
  portENTER_CRITICAL(&hidStateMux);
  hidState = HidInputState{};
  portEXIT_CRITICAL(&hidStateMux);
}

// Stage left/right button state (bits 0–1 only per HID mouse report).
void stageMouseButtons(uint8_t buttons) {
  buttons &= 0x03;
  portENTER_CRITICAL(&hidStateMux);
  if (hidState.currentButtons != buttons) {
    hidState.currentButtons = buttons;
    hidState.mouseReportPending = true;
  }
  portEXIT_CRITICAL(&hidStateMux);
}

void stageWheelTicks(int16_t wheelDelta) {
  if (wheelDelta == 0) return;
  portENTER_CRITICAL(&hidStateMux);
  int32_t nextWheel = (int32_t)hidState.pendingWheel + wheelDelta;
  if (nextWheel > INT16_MAX) nextWheel = INT16_MAX;
  if (nextWheel < INT16_MIN) nextWheel = INT16_MIN;
  hidState.pendingWheel = (int16_t)nextWheel;
  portEXIT_CRITICAL(&hidStateMux);
}

// Map iOS logical key IDs to USB HID modifier bits and key usages (v1 table).
static bool mapLogicalKeyToKeyboardReport(uint8_t logicalKey, uint8_t* modifiers,
                                          uint8_t keycodes[6], uint8_t* keycodeCount) {
  switch (logicalKey) {
    case 1: *modifiers |= 0x01; return true; // control
    case 2: *modifiers |= 0x02; return true; // shift
    case 3: *modifiers |= 0x04; return true; // alt/option
    case 4: *modifiers |= 0x08; return true; // command/GUI
    case 5: return false; // fn has no USB HID usage in this v1 mapping

    case 20: keycodes[(*keycodeCount)++] = 0x50; return true; // left arrow
    case 21: keycodes[(*keycodeCount)++] = 0x4F; return true; // right arrow
    case 22: keycodes[(*keycodeCount)++] = 0x52; return true; // up arrow
    case 23: keycodes[(*keycodeCount)++] = 0x51; return true; // down arrow

    case 24: keycodes[(*keycodeCount)++] = 0x29; return true; // escape
    case 25: keycodes[(*keycodeCount)++] = 0x2B; return true; // tab
    case 26: keycodes[(*keycodeCount)++] = 0x28; return true; // enter
    case 27: keycodes[(*keycodeCount)++] = 0x2A; return true; // backspace
    case 28: keycodes[(*keycodeCount)++] = 0x4C; return true; // delete forward
    case 29: keycodes[(*keycodeCount)++] = 0x2C; return true; // space

    case 80: keycodes[(*keycodeCount)++] = 0x27; return true; // 0
    case 81: keycodes[(*keycodeCount)++] = 0x1E; return true; // 1
    case 82: keycodes[(*keycodeCount)++] = 0x1F; return true; // 2
    case 83: keycodes[(*keycodeCount)++] = 0x20; return true; // 3
    case 84: keycodes[(*keycodeCount)++] = 0x21; return true; // 4
    case 85: keycodes[(*keycodeCount)++] = 0x22; return true; // 5
    case 86: keycodes[(*keycodeCount)++] = 0x23; return true; // 6
    case 87: keycodes[(*keycodeCount)++] = 0x24; return true; // 7
    case 88: keycodes[(*keycodeCount)++] = 0x25; return true; // 8
    case 89: keycodes[(*keycodeCount)++] = 0x26; return true; // 9

    case 90: keycodes[(*keycodeCount)++] = 0x2D; return true; // -
    case 91: keycodes[(*keycodeCount)++] = 0x2E; return true; // =
    case 92: keycodes[(*keycodeCount)++] = 0x2F; return true; // [
    case 93: keycodes[(*keycodeCount)++] = 0x30; return true; // ]
    case 94: keycodes[(*keycodeCount)++] = 0x33; return true; // ;
    case 95: keycodes[(*keycodeCount)++] = 0x34; return true; // '
    case 96: keycodes[(*keycodeCount)++] = 0x36; return true; // ,
    case 97: keycodes[(*keycodeCount)++] = 0x37; return true; // .
    case 98: keycodes[(*keycodeCount)++] = 0x38; return true; // /
    case 99: keycodes[(*keycodeCount)++] = 0x31; return true; // backslash
    case 100: keycodes[(*keycodeCount)++] = 0x35; return true; // `
  }

  if (logicalKey >= 40 && logicalKey <= 65) {
    keycodes[(*keycodeCount)++] = (uint8_t)(0x04 + (logicalKey - 40));
    return true;
  }

  return false;
}

void stageKeyboardReport(uint8_t modifiers, const uint8_t keycodes[6],
                         bool releaseAfterSend) {
  portENTER_CRITICAL(&hidStateMux);
  hidState.keyboardModifiers = modifiers;
  for (uint8_t i = 0; i < 6; i++) {
    hidState.keyboardKeycodes[i] = keycodes[i];
  }
  hidState.keyboardReportPending = true;
  hidState.keyboardReleasePending = releaseAfterSend;
  portEXIT_CRITICAL(&hidStateMux);
}

// Stage up to three logical keys as one keyboard report; auto-release after send.
void stageKeyboardCombo(const uint8_t* logicalKeys, uint8_t count) {
  if (logicalKeys == nullptr || count == 0) return;

  uint8_t modifiers = 0;
  uint8_t keycodes[6] = {0, 0, 0, 0, 0, 0};
  uint8_t keycodeCount = 0;
  uint8_t limitedCount = count > 3 ? 3 : count;

  for (uint8_t i = 0; i < limitedCount; i++) {
    if (keycodeCount >= 6) break;
    mapLogicalKeyToKeyboardReport(logicalKeys[i], &modifiers, keycodes, &keycodeCount);
  }

  if (modifiers == 0 && keycodeCount == 0) return;
  stageKeyboardReport(modifiers, keycodes, true);
}

// Emergency / disconnect path: flush motion queue and schedule neutral HID reports.
void releaseAllHidState(ReleaseReason reason) {
  (void)reason;
  resetMotionFrameQueue();

  portENTER_CRITICAL(&hidStateMux);
  ActiveInputMode preservedMode = hidState.activeMode;
  hidState = HidInputState{};
  hidState.activeMode = preservedMode;
  hidState.mouseReportPending = true;
  hidState.keyboardReportPending = true;
  hidState.keyboardReleasePending = false;
  hidState.releaseAllMousePending = true;
  hidState.releaseAllKeyboardPending = true;
  portEXIT_CRITICAL(&hidStateMux);

  diag.releaseAllCount++;
}

// UDP ingress calls this; motion is queued for the HID pacer (not sent synchronously).
uint8_t stagePointerMotion(int16_t dx, int16_t dy, bool* overflowOut) {
  return enqueueMotionFrame(dx, dy, overflowOut);
}
