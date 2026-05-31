// UsbHid.h — Adafruit TinyUSB composite HID (mouse + keyboard) to the USB host.
// Report IDs and descriptor layout match Config.h MOUSE_REPORT_ID / KEYBOARD_REPORT_ID.

#pragma once

#include <Arduino.h>

void ensureTinyUsbDeviceStarted();
void setupUsbHid();
bool isUsbHidMounted();
bool sendMouseHidReport(int16_t dx, int16_t dy, int8_t wheel, uint8_t buttons);
bool sendKeyboardHidReport(uint8_t modifiers, const uint8_t keycodes[6]);
