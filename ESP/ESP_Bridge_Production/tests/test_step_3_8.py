#!/usr/bin/env python3
"""Step 3.8 firmware source checks for BLE fallback and setup/status."""

from pathlib import Path
import re
import unittest


FIRMWARE_DIR = Path(__file__).parent


def read_file(name: str) -> str:
    path = FIRMWARE_DIR / name
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8")


def function_body(source: str, name: str) -> str:
    match = re.search(rf"(?:static\s+)?[^{{;]+ {name}\([^)]*\) \{{", source)
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


class Step38BleFallbackChecks(unittest.TestCase):
    def test_ble_module_exists_and_is_wired(self) -> None:
        self.assertTrue((FIRMWARE_DIR / "BleControl.h").exists())
        self.assertTrue((FIRMWARE_DIR / "BleControl.cpp").exists())

        ino = read_file("ESP_Bridge_Production.ino")
        self.assertIn("#include \"BleControl.h\"", ino)
        self.assertIn("setupBleControl()", ino)
        self.assertIn("pollBleControl()", ino)

    def test_ble_gatt_has_rx_write_and_tx_notify(self) -> None:
        config = read_file("Config.h")
        source = read_file("BleControl.cpp")

        for symbol in (
            "BLE_SERVICE_UUID",
            "BLE_RX_CHARACTERISTIC_UUID",
            "BLE_TX_CHARACTERISTIC_UUID",
            "BLE_CONTROL_MARKER",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, config)

        setup_body = function_body(source, "setupBleControl")
        self.assertIn("NIMBLE_PROPERTY::WRITE", setup_body)
        self.assertIn("NIMBLE_PROPERTY::WRITE_NR", setup_body)
        self.assertIn("NIMBLE_PROPERTY::NOTIFY", setup_body)
        self.assertIn("BLE_TX_CHARACTERISTIC_UUID", setup_body)

    def test_ble_owner_gates_legacy_hid(self) -> None:
        source = read_file("BleControl.cpp")

        mouse_body = function_body(source, "dispatchLegacyMouse")
        key_body = function_body(source, "dispatchLegacyKeyCombo")

        for body in (mouse_body, key_body):
            with self.subTest(body=body[:40]):
                self.assertIn("acceptBleHidForOwner", body)
                self.assertIn("bleHidIgnored", body)
                self.assertIn("bleHidAccepted", body)

        self.assertIn("stagePointerMotion", mouse_body)
        self.assertIn("stageMouseButtons", mouse_body)
        self.assertIn("stageWheelTicks", mouse_body)
        self.assertIn("stageKeyboardCombo", key_body)

    def test_ble_control_owns_pair_claim_heartbeat_release_and_status(self) -> None:
        header = read_file("BleControl.h")
        source = read_file("BleControl.cpp")

        for symbol in (
            "BLE_CTRL_PAIR",
            "BLE_CTRL_CLAIM_OWNER",
            "BLE_CTRL_HEARTBEAT",
            "BLE_CTRL_RELEASE_ALL",
            "BLE_CTRL_STATUS_REQUEST",
            "BLE_CTRL_STATUS_RESPONSE",
            "BLE_CTRL_ERROR",
            "BLE_CTRL_COMMAND_RESULT",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, header)

        self.assertIn("saveStoredPairingIdentity", source)
        self.assertIn("validateStoredPairingProof", source)
        self.assertIn("claimBleOwner", source)
        self.assertIn("refreshOwnerHeartbeat", source)
        self.assertIn("releaseAllHidState", source)
        self.assertIn("acceptBleControlAndRefresh", source)
        self.assertIn("syncBleOwnerLocalState", source)

    def test_status_reports_device_id_ble_connected_and_shared_capabilities(self) -> None:
        config = read_file("Config.h")
        ble_source = read_file("BleControl.cpp")
        tcp_source = read_file("WifiTcpControl.cpp")

        for symbol in (
            "REMOTE_CAP_BLE_CONTROL_V1",
            "REMOTE_CAP_BLE_LEGACY_INPUT",
            "REMOTE_CAP_WIFI_TCP_CONTROL_V1",
            "REMOTE_CAP_WIFI_UDP_MOTION_V1",
            "REMOTE_CAP_TINYUSB_HIGH_RATE_HID",
            "REMOTE_CAP_OWNER_SESSION",
            "REMOTE_CAP_RELEASE_ALL",
            "REMOTE_CAP_OWNER_HEARTBEAT",
            "REMOTE_CAP_BLE_WIFI_PROVISIONING",
            "REMOTE_CAP_MOUSE_BUTTONS",
            "REMOTE_CAP_WHEEL_INPUT",
            "REMOTE_CAP_KEYBOARD_INPUT",
            "REMOTE_CAP_SAVED_WIFI_PROFILES",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, config)

        self.assertIn("TCP_CONTROL_FIRMWARE_VERSION \"esp-production-3.8\"", config)
        self.assertIn("getPersistentDeviceId", function_body(ble_source, "sendStatusResponse"))
        self.assertIn("isBleControlClientConnected", function_body(tcp_source, "handleStatusRequest"))
        self.assertIn("writer.writeBytes((const uint8_t*)deviceId", tcp_source)

    def test_ble_wifi_setup_commands_exist(self) -> None:
        header = read_file("BleControl.h")
        source = read_file("BleControl.cpp")

        for symbol in (
            "BLE_CTRL_SCAN_WIFI",
            "BLE_CTRL_SCAN_WIFI_RESULT",
            "BLE_CTRL_SCAN_WIFI_DONE",
            "BLE_CTRL_SET_WIFI_CREDENTIALS",
            "BLE_CTRL_WIFI_CONNECT_RESULT",
            "BLE_CTRL_LIST_SAVED_WIFI",
            "BLE_CTRL_SAVED_WIFI_ENTRY",
            "BLE_CTRL_SAVED_WIFI_DONE",
            "BLE_CTRL_FORGET_WIFI",
            "BLE_CTRL_RESET_PAIRING",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, header)

        self.assertIn("WiFi.scanNetworks", source)
        self.assertIn("connectWifiForProvisioning", source)
        self.assertIn("saveStoredWifiProfile", read_file("UdpMotion.cpp"))
        self.assertIn("getStoredWifiProfileCount", source)
        self.assertIn("forgetStoredWifiProfile", source)
        self.assertIn("clearStoredPairingIdentity", source)
        self.assertIn("sendCommandResult(frame.requestId, BLE_CTRL_FORGET_WIFI", source)
        self.assertIn("sendCommandResult(frame.requestId, BLE_CTRL_RESET_PAIRING", source)

    def test_ble_disconnect_releases_ble_owner_only(self) -> None:
        source = read_file("BleControl.cpp")

        self.assertIn("releaseOwner(bleSessionId, OWNER_BLE", source)
        self.assertIn("bleAuthenticated = false", source)
        self.assertIn("clearBleOwnerLocal", source)
        self.assertIn("NimBLEDevice::startAdvertising", source)


if __name__ == "__main__":
    unittest.main()
