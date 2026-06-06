// ESP_Bridge_Production.ino
//
// Production firmware base for ESP32-S3 using Adafruit TinyUSB.
// This file is intentionally thin: production behavior lives in focused
// .h/.cpp modules so the next transport work can extend one boundary at a time.
//
// Data path: iOS UDP → UdpMotion → MotionQueue → HidPacer → UsbHid → USB host.
// Shared staging (buttons, wheel, keyboard) goes through HidState; metrics in Diagnostics.
//
// Required Arduino IDE settings (cannot be set from code):
//   Tools > USB Mode:           USB-OTG (TinyUSB)
//   Tools > USB CDC On Boot:    Enabled       (so Serial keeps working)
//   Tools > USB Firmware MSC:   Disabled
//   Tools > USB DFU On Boot:    Disabled
//   Library Manager:            "Adafruit TinyUSB Library" (latest)

#include <Arduino.h>

#include "Config.h"
#include "Diagnostics.h"
#include "HidPacer.h"
#include "HidState.h"
#include "MotionQueue.h"
#include "OwnerSession.h"
#include "UdpMotion.h"
#include "UsbHid.h"

// Boot order: USB stack → HID mount → motion queue → pacer task → Wi-Fi/UDP RX.
void setup() {
  // CDC-on-Boot maps Serial to a TinyUSB CDC interface; on ESP32-S3 the
  // arduino-esp32 core auto-initializes TinyUSB before setup() when "USB
  // Mode: USB-OTG (TinyUSB)" is selected.
  ensureTinyUsbDeviceStarted();

  Serial.begin(115200);
  uint32_t serialWaitStart = millis();
  while (!Serial && (millis() - serialWaitStart) < 1000) {
    delay(10);
  }

  setupUsbHid();

  resetMotionFrameQueue();
  resetSharedHidState();
  resetOwnerSession();
  startHidPacerTask();

  if (setupUdpMotion()) {
    startUdpRxTask();
  }

  Serial.println("🎯 ESP_Bridge_Production ready");
}

// Main thread only runs diagnostics; motion and HID run on FreeRTOS tasks.
void loop() {
  #if HID_RELEASE_SELF_TEST
  static bool releasedOnce = false;
  if (!releasedOnce && millis() > 5000) {
    releasedOnce = true;
    releaseAllHidState(RELEASE_REASON_USER_EMERGENCY);
    Serial.println("🧪 releaseAllHidState self-test requested");
  }
  #endif

  checkOwnerHeartbeatTimeout(millis());
  printSummaryIfNeeded();
  delay(10);
}
