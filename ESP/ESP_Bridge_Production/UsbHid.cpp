// UsbHid.cpp — USB HID descriptor, mount wait, and report send helpers.
// Mouse report: buttons + 16-bit x/y + 8-bit wheel. Keyboard: 8-byte boot protocol.

#include "UsbHid.h"

#include <Adafruit_TinyUSB.h>

#include "Config.h"

// Composite HID report descriptor (mouse collection + keyboard collection).
static uint8_t const desc_hid_report[] = {
  // ----- Mouse: 2 buttons + 16-bit X/Y + wheel -----
  0x05, 0x01,        // Usage Page (Generic Desktop)
  0x09, 0x02,        // Usage (Mouse)
  0xA1, 0x01,        // Collection (Application)
    0x85, MOUSE_REPORT_ID, //   Report ID (mouse)

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
      0x16, 0x01, 0x80,  //     Logical Minimum (-32767)
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
  0xC0,                // End Collection (Application)

  // ----- Keyboard: 8 modifier bits + 6 key slots -----
  0x05, 0x01,        // Usage Page (Generic Desktop)
  0x09, 0x06,        // Usage (Keyboard)
  0xA1, 0x01,        // Collection (Application)
    0x85, KEYBOARD_REPORT_ID, //   Report ID (keyboard)

    0x05, 0x07,        //   Usage Page (Keyboard/Keypad)
    0x19, 0xE0,        //   Usage Minimum (Left Control)
    0x29, 0xE7,        //   Usage Maximum (Right GUI)
    0x15, 0x00,        //   Logical Minimum (0)
    0x25, 0x01,        //   Logical Maximum (1)
    0x75, 0x01,        //   Report Size (1)
    0x95, 0x08,        //   Report Count (8)
    0x81, 0x02,        //   Input (Data, Variable, Absolute)

    0x95, 0x01,        //   Report Count (1)
    0x75, 0x08,        //   Report Size (8)
    0x81, 0x03,        //   Input (Constant) — reserved byte

    0x95, 0x06,        //   Report Count (6)
    0x75, 0x08,        //   Report Size (8)
    0x15, 0x00,        //   Logical Minimum (0)
    0x25, 0x65,        //   Logical Maximum (101)
    0x05, 0x07,        //   Usage Page (Keyboard/Keypad)
    0x19, 0x00,        //   Usage Minimum (0)
    0x29, 0x65,        //   Usage Maximum (101)
    0x81, 0x00,        //   Input (Data, Array)

  0xC0                 // End Collection (Application)
};

struct __attribute__((packed)) MouseReport {
  uint8_t buttons;
  int16_t x;
  int16_t y;
  int8_t  wheel;
};
static_assert(sizeof(MouseReport) == 6, "HID report must be 6 bytes");

struct __attribute__((packed)) KeyboardReport {
  uint8_t modifiers;
  uint8_t reserved;
  uint8_t keycodes[6];
};
static_assert(sizeof(KeyboardReport) == 8, "Keyboard report must be 8 bytes");

static Adafruit_USBD_HID usb_hid;

void ensureTinyUsbDeviceStarted() {
  if (!TinyUSBDevice.isInitialized()) {
    TinyUSBDevice.begin(0);
  }
}

// Register descriptor, begin HID, re-attach if needed, wait up to USB_MOUNT_TIMEOUT_MS.
void setupUsbHid() {
  Serial.println();
  Serial.println("🔧 Initializing TinyUSB HID Mouse...");

  usb_hid.setPollInterval(1);
  usb_hid.setReportDescriptor(desc_hid_report, sizeof(desc_hid_report));
  if (!usb_hid.begin()) {
    Serial.println("⚠️ usb_hid.begin() failed");
  }

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
}

bool isUsbHidMounted() {
  return TinyUSBDevice.mounted();
}

// Send one relative mouse report; returns false if host not mounted or endpoint busy.
bool sendMouseHidReport(int16_t dx, int16_t dy, int8_t wheel, uint8_t buttons) {
  if (!TinyUSBDevice.mounted()) return false;
  if (!usb_hid.ready()) return false;

  MouseReport r{};
  r.buttons = buttons & 0x03;
  r.x = dx;
  r.y = dy;
  r.wheel = wheel;
  return usb_hid.sendReport(MOUSE_REPORT_ID, &r, sizeof(r));
}

bool sendKeyboardHidReport(uint8_t modifiers, const uint8_t keycodes[6]) {
  if (!TinyUSBDevice.mounted()) return false;
  if (!usb_hid.ready()) return false;

  KeyboardReport r{};
  r.modifiers = modifiers;
  r.reserved = 0;
  for (uint8_t i = 0; i < 6; i++) {
    r.keycodes[i] = keycodes[i];
  }
  return usb_hid.sendReport(KEYBOARD_REPORT_ID, &r, sizeof(r));
}
