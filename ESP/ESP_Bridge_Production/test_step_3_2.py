#!/usr/bin/env python3
"""Step 3.2 firmware source checks.

These tests protect the shared HID foundation before hardware/manual tests run.
They intentionally check named firmware seams that later TCP and BLE adapters
must use instead of writing HID reports directly.
"""

from pathlib import Path
import re
import unittest


SKETCH = Path(__file__).with_name("ESP_Bridge_Production.ino")


def sketch_text() -> str:
    return SKETCH.read_text(encoding="utf-8")


def function_body(source: str, name: str) -> str:
    match = re.search(rf"static [^{{;]+ {name}\([^)]*\) \{{", source)
    if not match:
        return ""

    depth = 0
    start = match.end() - 1
    for index in range(start, len(source)):
        char = source[index]
        if char == "{":
            depth += 1
        elif char == "}":
            depth -= 1
            if depth == 0:
                return source[start : index + 1]
    return ""


class Step32FirmwareChecks(unittest.TestCase):
    def test_composite_mouse_and_keyboard_reports_use_explicit_report_ids(self) -> None:
        source = sketch_text()

        self.assertIn("#define MOUSE_REPORT_ID", source)
        self.assertIn("#define KEYBOARD_REPORT_ID", source)
        self.assertIn("0x85, MOUSE_REPORT_ID", source)
        self.assertIn("0x85, KEYBOARD_REPORT_ID", source)
        self.assertIn("usb_hid.sendReport(MOUSE_REPORT_ID", source)
        self.assertIn("usb_hid.sendReport(KEYBOARD_REPORT_ID", source)

    def test_shared_state_tracks_active_mode_and_hid_staging(self) -> None:
        source = sketch_text()

        self.assertIn("enum ActiveInputMode", source)
        self.assertIn("INPUT_MODE_NONE", source)
        self.assertIn("INPUT_MODE_WIFI", source)
        self.assertIn("INPUT_MODE_BLE", source)
        self.assertRegex(source, r"ActiveInputMode\s+activeMode\s*=")
        self.assertIn("bool mouseReportPending", source)
        self.assertIn("bool keyboardReportPending", source)

    def test_transport_helpers_feed_the_single_hid_state_layer(self) -> None:
        source = sketch_text()

        for helper in (
            "setActiveInputMode",
            "stagePointerMotion",
            "stageMouseButtons",
            "stageWheelTicks",
            "stageKeyboardCombo",
            "releaseAllHidState",
        ):
            with self.subTest(helper=helper):
                self.assertTrue(function_body(source, helper), f"{helper} is missing")

        udp_body = function_body(source, "pollUdpMotionPackets")
        self.assertIn("stagePointerMotion", udp_body)

    def test_keyboard_send_and_release_all_are_not_stubbed(self) -> None:
        source = sketch_text()
        keyboard_body = function_body(source, "sendKeyboardHidReport")
        release_body = function_body(source, "releaseAllHidState")

        self.assertNotIn("(void)modifiers", keyboard_body)
        self.assertNotIn("(void)keycodes", keyboard_body)
        self.assertIn("usb_hid.sendReport(KEYBOARD_REPORT_ID", keyboard_body)
        self.assertIn("resetMotionFrameQueue()", release_body)
        self.assertIn("preservedMode", release_body)
        self.assertIn("mouseReportPending", release_body)
        self.assertIn("keyboardReportPending", release_body)


if __name__ == "__main__":
    unittest.main()
