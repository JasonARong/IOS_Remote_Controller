// HidPacer.cpp — fixed-interval task: pop motion → accumulate → clamp → USB HID send.
// Retries failed sends by re-staging pending flags in hidState.

#include "HidPacer.h"

#include "Config.h"
#include "Diagnostics.h"
#include "HidState.h"
#include "MotionQueue.h"
#include "UsbHid.h"

static TaskHandle_t hidPacerTaskHandle = nullptr;

// Main loop: one tick per HID_PACER_INTERVAL_MS; may send mouse and/or keyboard.
static void hidPacerTask(void* /*parameter*/) {
  TickType_t lastWake = xTaskGetTickCount();
  uint32_t lastTickUs = micros();

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

    uint32_t staleDrops = 0;
    uint8_t depth = 0;
    bool hasFrame = false;
    MotionFrame frame{};
    #if HID_LOCAL_GENERATOR_TEST
    static int8_t localDirection = 1;
    static uint16_t localTicks = 0;
    localTicks++;
    if (localTicks >= 125) {
      localTicks = 0;
      localDirection = -localDirection;
    }
    frame = {localDirection, 0, nowUs};
    hasFrame = true;
    #else
    {
      hasFrame = popFreshMotionFrame(&frame, nowUs, &staleDrops, &depth);
    }
    #endif
    if (staleDrops > 0) diag.hidMotionStaleDrops += staleDrops;

    int16_t reportDx = 0;
    int16_t reportDy = 0;
    int8_t reportWheel = 0;
    uint8_t reportButtons = 0;
    bool mouseShouldSend = false;

    uint8_t keyboardModifiers = 0;
    uint8_t keyboardKeycodes[6] = {0, 0, 0, 0, 0, 0};
    bool keyboardShouldSend = false;
    bool keyboardReleaseAfterSend = false;

    portENTER_CRITICAL(&hidStateMux);

    if (hasFrame) {
      #if HID_LOCAL_GENERATOR_TEST
      hidState.scaledAccumX += (int32_t)frame.dx * POINTER_SCALE;
      hidState.scaledAccumY += (int32_t)frame.dy * POINTER_SCALE;
      #else
      hidState.scaledAccumX += frame.dx;
      hidState.scaledAccumY += frame.dy;
      #endif
    }

    // Convert scaled accumulator to one HID report, leaving fractional remainder.
    if (hidState.scaledAccumX != 0 || hidState.scaledAccumY != 0) {
      int32_t outX = hidState.scaledAccumX / POINTER_SCALE;
      int32_t outY = hidState.scaledAccumY / POINTER_SCALE;
      if (outX > MAX_HID_DELTA_PER_REPORT)       outX = MAX_HID_DELTA_PER_REPORT;
      else if (outX < -MAX_HID_DELTA_PER_REPORT) outX = -MAX_HID_DELTA_PER_REPORT;
      if (outY > MAX_HID_DELTA_PER_REPORT)       outY = MAX_HID_DELTA_PER_REPORT;
      else if (outY < -MAX_HID_DELTA_PER_REPORT) outY = -MAX_HID_DELTA_PER_REPORT;
      reportDx = (int16_t)outX;
      reportDy = (int16_t)outY;
      hidState.scaledAccumX -= (int32_t)reportDx * POINTER_SCALE;
      hidState.scaledAccumY -= (int32_t)reportDy * POINTER_SCALE;
    }

    reportWheel = clampWheel(hidState.pendingWheel);
    hidState.pendingWheel -= reportWheel;
    reportButtons = hidState.currentButtons;

    mouseShouldSend = (reportDx != 0 ||
                       reportDy != 0 ||
                       reportWheel != 0 ||
                       hidState.mouseReportPending ||
                       hidState.releaseAllMousePending);
    hidState.mouseReportPending = false;
    hidState.releaseAllMousePending = false;

    keyboardShouldSend = (hidState.keyboardReportPending ||
                          hidState.releaseAllKeyboardPending);
    keyboardModifiers = hidState.keyboardModifiers;
    for (uint8_t i = 0; i < 6; i++) {
      keyboardKeycodes[i] = hidState.keyboardKeycodes[i];
    }
    keyboardReleaseAfterSend = hidState.keyboardReleasePending;
    hidState.keyboardReportPending = false;
    hidState.releaseAllKeyboardPending = false;
    hidState.keyboardReleasePending = false;

    portEXIT_CRITICAL(&hidStateMux);

    if (!mouseShouldSend && !keyboardShouldSend) continue;

    if (mouseShouldSend) {
      bool ok = sendMouseHidReport(reportDx, reportDy, reportWheel, reportButtons);
      diag.recordHidSend(ok, reportDx, reportDy, nowUs);
      // USB busy or unmounted: re-stage so a later tick retries the same intent.
      if (!ok) {
        portENTER_CRITICAL(&hidStateMux);
        hidState.mouseReportPending = true;
        portEXIT_CRITICAL(&hidStateMux);
      }
    }

    if (keyboardShouldSend) {
      bool ok = sendKeyboardHidReport(keyboardModifiers, keyboardKeycodes);
      if (ok) {
        diag.hidKeyboardReports++;
        if (keyboardReleaseAfterSend) {
          portENTER_CRITICAL(&hidStateMux);
          hidState.keyboardModifiers = 0;
          for (uint8_t i = 0; i < 6; i++) {
            hidState.keyboardKeycodes[i] = 0;
          }
          hidState.keyboardReportPending = true;
          hidState.keyboardReleasePending = false;
          portEXIT_CRITICAL(&hidStateMux);
        }
      } else {
        diag.hidReportFails++;
        portENTER_CRITICAL(&hidStateMux);
        hidState.keyboardReportPending = true;
        hidState.keyboardReleasePending = keyboardReleaseAfterSend;
        portEXIT_CRITICAL(&hidStateMux);
      }
    }
  }
}

// Pin HID pacing to core 1 (UDP RX uses core 0) to reduce cross-core contention.
void startHidPacerTask() {
  if (hidPacerTaskHandle != nullptr) return;
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
