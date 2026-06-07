#!/usr/bin/env python3
"""Step 3.7 firmware source checks for ESP persistence foundation."""

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


class Step37PersistenceChecks(unittest.TestCase):
    def test_persistent_store_module_exists_and_is_wired(self) -> None:
        self.assertTrue((FIRMWARE_DIR / "PersistentStore.h").exists())
        self.assertTrue((FIRMWARE_DIR / "PersistentStore.cpp").exists())

        ino = read_file("ESP_Bridge_Production.ino")
        self.assertIn("#include \"PersistentStore.h\"", ino)
        self.assertIn("setupPersistentStore()", ino)

    def test_store_uses_preferences_for_wifi_device_and_pairing(self) -> None:
        header = read_file("PersistentStore.h")
        impl = read_file("PersistentStore.cpp")
        combined = header + impl

        self.assertIn("#include <Preferences.h>", impl)
        for symbol in (
            "StoredWifiProfile",
            "PERSISTENT_MAX_WIFI_PROFILES",
            "getPersistentDeviceId",
            "getStoredWifiProfileCount",
            "getStoredWifiProfile",
            "saveStoredWifiProfile",
            "forgetStoredWifiProfile",
            "clearStoredWifiProfiles",
            "saveStoredPairingIdentity",
            "validateStoredPairingProof",
            "clearStoredPairingIdentity",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, combined)

    def test_udp_connects_saved_profiles_before_hardcoded_fallback(self) -> None:
        source = read_file("UdpMotion.cpp")
        setup_body = function_body(source, "setupUdpMotion")

        self.assertIn("#include \"PersistentStore.h\"", source)
        self.assertIn("connectStoredWifiProfiles", source)
        self.assertIn("getStoredWifiProfileCount", source)
        self.assertIn("getStoredWifiProfile", source)
        self.assertIn("connectStoredWifiProfiles()", setup_body)
        self.assertIn("WIFI_SSID", setup_body)

    def test_tcp_reports_persistent_device_id_and_saved_wifi_capability(self) -> None:
        config = read_file("Config.h")
        source = read_file("WifiTcpControl.cpp")
        hello_body = function_body(source, "handleHello")

        self.assertIn("TCP_CAP_SAVED_WIFI_PROFILES", config)
        self.assertIn("TCP_CONTROL_FIRMWARE_VERSION \"esp-production-3.7\"", config)
        self.assertIn("getPersistentDeviceId", hello_body)
        self.assertIn("writer.writeBytes((const uint8_t*)deviceId", hello_body)

    def test_tcp_auth_uses_pairing_validation_hook(self) -> None:
        source = read_file("WifiTcpControl.cpp")
        auth_body = function_body(source, "handleAuth")

        self.assertIn("validateStoredPairingProof", auth_body)
        self.assertIn("TCP_ERROR_AUTH_FAILED", auth_body)
        self.assertNotIn("final credential proof validation belongs", auth_body)

    def test_tcp_setup_handles_list_forget_and_reset_pairing(self) -> None:
        header = read_file("WifiTcpControl.h")
        source = read_file("WifiTcpControl.cpp")
        setup_body = function_body(source, "handleSetupCommand")

        for symbol in (
            "TCP_SETUP_LIST_SAVED_WIFI",
            "TCP_SETUP_FORGET_WIFI",
            "TCP_SETUP_RESET_PAIRING",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, header)
                self.assertIn(symbol, setup_body)

        self.assertIn("getStoredWifiProfileCount", setup_body)
        self.assertIn("forgetStoredWifiProfile", setup_body)
        self.assertIn("releaseOwner", setup_body)
        self.assertIn("clearStoredPairingIdentity", setup_body)

    def test_manual_tcp_client_exposes_persistence_commands(self) -> None:
        helper = (FIRMWARE_DIR / "tools" / "tcp_control_client.py").read_text(encoding="utf-8")

        for symbol in (
            "SETUP_LIST_SAVED_WIFI",
            "SETUP_FORGET_WIFI",
            "SETUP_RESET_PAIRING",
            "list-saved-wifi",
            "forget-wifi",
            "reset-pairing",
            "parse_setup_result",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, helper)


if __name__ == "__main__":
    unittest.main()
