#!/usr/bin/env python3
"""Step 3.4 firmware source checks for owner/session foundation."""

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


class Step34OwnerSessionChecks(unittest.TestCase):
    def test_owner_session_module_exists(self) -> None:
        self.assertTrue((FIRMWARE_DIR / "OwnerSession.h").exists())
        self.assertTrue((FIRMWARE_DIR / "OwnerSession.cpp").exists())

    def test_owner_session_exposes_required_types_and_apis(self) -> None:
        header = read_file("OwnerSession.h")
        impl = read_file("OwnerSession.cpp")
        combined = header + impl

        for symbol in (
            "OWNER_NONE",
            "OWNER_BLE",
            "OWNER_WIFI",
            "OwnerKind",
            "OwnerSessionState",
            "sessionId",
            "udpToken",
            "inputEpoch",
            "phoneId",
            "heartbeatDeadlineMs",
            "resetOwnerSession",
            "claimWifiOwner",
            "claimBleOwner",
            "releaseOwner",
            "refreshOwnerHeartbeat",
            "checkOwnerHeartbeatTimeout",
            "getOwnerSnapshot",
            "isWifiOwnerSession",
            "isBleOwnerSession",
            "acceptWifiTcpHidForOwner",
            "acceptWifiControlAndRefresh",
            "updateOwnerInputEpoch",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, combined)
        self.assertNotIn("acceptTcpHidForOwner", combined)

    def test_owner_session_mirrors_active_input_mode(self) -> None:
        impl = read_file("OwnerSession.cpp")
        for fn in ("resetOwnerSession", "claimWifiOwner", "claimBleOwner", "releaseOwner"):
            body = function_body(impl, fn)
            self.assertTrue(body, f"{fn} is missing")
            self.assertIn("setActiveInputMode", body, f"{fn} should mirror active mode")

        timeout_body = function_body(impl, "checkOwnerHeartbeatTimeout")
        self.assertIn("setActiveInputMode(INPUT_MODE_NONE)", timeout_body)

    def test_timeout_and_release_clear_hid_before_owner(self) -> None:
        impl = read_file("OwnerSession.cpp")
        timeout_body = function_body(impl, "checkOwnerHeartbeatTimeout")
        release_body = function_body(impl, "releaseOwner")

        self.assertIn("releaseAllHidState(RELEASE_REASON_TIMEOUT)", timeout_body)
        self.assertIn("releaseAllHidState", release_body)

    def test_release_and_timeout_revalidate_owner_snapshot_before_clear(self) -> None:
        impl = read_file("OwnerSession.cpp")
        release_body = function_body(impl, "releaseOwner")
        timeout_body = function_body(impl, "checkOwnerHeartbeatTimeout")

        for body in (release_body, timeout_body):
            self.assertIn("capturedOwnerKind", body)
            self.assertIn("capturedSessionId", body)
            self.assertRegex(body, r"ownerState\.ownerKind\s*==\s*capturedOwnerKind")
            self.assertRegex(body, r"ownerState\.sessionId\s*==\s*capturedSessionId")

        self.assertIn("capturedHeartbeatDeadlineMs", timeout_body)
        self.assertRegex(
            timeout_body,
            r"ownerState\.heartbeatDeadlineMs\s*==\s*capturedHeartbeatDeadlineMs",
        )

    def test_conflicting_claims_are_rejected_without_state_mutation(self) -> None:
        impl = read_file("OwnerSession.cpp")
        wifi_body = function_body(impl, "claimWifiOwner")
        ble_body = function_body(impl, "claimBleOwner")

        self.assertRegex(wifi_body, r"ownerKind\s*!=\s*OWNER_NONE|OWNER_NONE\s*!=\s*ownerKind")
        self.assertRegex(ble_body, r"ownerKind\s*!=\s*OWNER_NONE|OWNER_NONE\s*!=\s*ownerKind")
        self.assertIn("granted", wifi_body)
        self.assertIn("granted", ble_body)

    def test_boot_wiring_uses_owner_session_not_direct_wifi_mode(self) -> None:
        ino = read_file("ESP_Bridge_Production.ino")
        self.assertIn("OwnerSession.h", ino)
        self.assertIn("resetOwnerSession()", ino)
        self.assertIn("checkOwnerHeartbeatTimeout", ino)
        self.assertNotRegex(
            ino,
            r"setActiveInputMode\s*\(\s*INPUT_MODE_WIFI\s*\)",
            "boot must not assign Wi-Fi active mode before ownership is granted",
        )

    def test_config_defines_owner_heartbeat_timeout(self) -> None:
        config = read_file("Config.h")
        self.assertIn("OWNER_HEARTBEAT_TIMEOUT_MS", config)

    def test_tcp_acceptance_is_wifi_only_and_refreshes_liveness(self) -> None:
        impl = read_file("OwnerSession.cpp")
        accept_body = function_body(impl, "acceptWifiTcpHidForOwner")
        refresh_body = function_body(impl, "acceptWifiControlAndRefresh")

        self.assertTrue(accept_body, "acceptWifiTcpHidForOwner is missing")
        self.assertNotIn("OwnerKind ownerKind", accept_body)
        self.assertIn("ownerState.ownerKind == OWNER_WIFI", accept_body)
        self.assertNotIn("OWNER_BLE", accept_body)

        self.assertTrue(refresh_body, "acceptWifiControlAndRefresh is missing")
        self.assertIn("acceptWifiTcpHidForOwner", refresh_body)
        self.assertIn("refreshOwnerHeartbeat", refresh_body)


if __name__ == "__main__":
    unittest.main()
