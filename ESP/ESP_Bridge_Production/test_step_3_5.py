#!/usr/bin/env python3
"""Step 3.5 firmware source checks for the Wi-Fi TCP control server."""

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


class Step35TcpControlChecks(unittest.TestCase):
    def test_tcp_control_module_exists_and_is_wired(self) -> None:
        self.assertTrue((FIRMWARE_DIR / "WifiTcpControl.h").exists())
        self.assertTrue((FIRMWARE_DIR / "WifiTcpControl.cpp").exists())

        ino = read_file("ESP_Bridge_Production.ino")
        self.assertIn("#include \"WifiTcpControl.h\"", ino)
        self.assertIn("setupWifiTcpControl()", ino)
        self.assertIn("pollWifiTcpControl()", ino)

    def test_config_defines_tcp_protocol_constants(self) -> None:
        config = read_file("Config.h")

        for symbol in (
            "TCP_CONTROL_PORT",
            "TCP_CONTROL_MAGIC",
            "TCP_CONTROL_FRAME_VERSION",
            "TCP_CONTROL_PROTOCOL_VERSION",
            "TCP_CONTROL_MAX_PAYLOAD_LENGTH",
            "TCP_CONTROL_CAPABILITIES",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, config)

    def test_message_and_error_ids_are_stable_named_constants(self) -> None:
        header = read_file("WifiTcpControl.h")

        for symbol in (
            "TCP_MSG_HELLO",
            "TCP_MSG_HELLO_ACK",
            "TCP_MSG_AUTH",
            "TCP_MSG_AUTH_RESULT",
            "TCP_MSG_CLAIM_OWNER",
            "TCP_MSG_OWNER_RESULT",
            "TCP_MSG_HEARTBEAT",
            "TCP_MSG_STATUS_REQUEST",
            "TCP_MSG_STATUS_RESPONSE",
            "TCP_MSG_BUTTON_STATE",
            "TCP_MSG_WHEEL_TICK",
            "TCP_MSG_KEY_COMBO",
            "TCP_MSG_RELEASE_ALL",
            "TCP_MSG_SETUP_COMMAND",
            "TCP_MSG_SETUP_RESULT",
            "TCP_MSG_ERROR",
            "TCP_ERROR_NOT_OWNER",
            "TCP_ERROR_NOT_AUTHENTICATED",
            "TCP_ERROR_UNSUPPORTED_VERSION",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, header)

    def test_negotiation_auth_claim_and_heartbeat_handlers_exist(self) -> None:
        source = read_file("WifiTcpControl.cpp")

        self.assertIn("handleHello", source)
        self.assertIn("TCP_MSG_HELLO_ACK", function_body(source, "handleHello"))
        self.assertIn("handleAuth", source)
        self.assertIn("TCP_MSG_AUTH_RESULT", function_body(source, "handleAuth"))

        claim_body = function_body(source, "handleClaimOwner")
        self.assertIn("claimWifiOwner", claim_body)
        self.assertIn("TCP_MSG_OWNER_RESULT", claim_body)
        self.assertIn("udpToken", claim_body)
        self.assertIn("inputEpoch", claim_body)

        heartbeat_body = function_body(source, "handleHeartbeat")
        self.assertIn("refreshOwnerHeartbeat", heartbeat_body)
        self.assertIn("TCP_ERROR_NOT_OWNER", heartbeat_body)

    def test_disconnect_releases_wifi_owner_with_release_all(self) -> None:
        source = read_file("WifiTcpControl.cpp")
        disconnect_body = function_body(source, "releaseOwnedClientOnDisconnect")

        self.assertIn("tcpClientOwnsWifi", disconnect_body)
        self.assertIn("releaseOwner", disconnect_body)
        self.assertIn("OWNER_WIFI", disconnect_body)
        self.assertIn("RELEASE_REASON_DISCONNECT", disconnect_body)

    def test_hid_handlers_are_owner_gated_and_feed_shared_hid_state(self) -> None:
        source = read_file("WifiTcpControl.cpp")

        require_owner_body = function_body(source, "requireWifiOwner")
        self.assertIn("acceptWifiTcpHidForOwner", require_owner_body)
        self.assertIn("TCP_ERROR_NOT_OWNER", require_owner_body)

        expected_calls = {
            "handleButtonState": ("requireWifiOwner", "updateOwnerInputEpoch", "stageMouseButtons"),
            "handleWheelTick": ("requireWifiOwner", "stageWheelTicks"),
            "handleKeyCombo": ("requireWifiOwner", "stageKeyboardCombo"),
            "handleReleaseAll": ("requireWifiOwner", "updateOwnerInputEpoch", "releaseAllHidState"),
        }
        for handler, calls in expected_calls.items():
            body = function_body(source, handler)
            self.assertTrue(body, f"{handler} is missing")
            for call in calls:
                with self.subTest(handler=handler, call=call):
                    self.assertIn(call, body)

    def test_status_reports_owner_usb_protocol_and_capabilities(self) -> None:
        source = read_file("WifiTcpControl.cpp")
        status_body = function_body(source, "handleStatusRequest")

        self.assertIn("getOwnerSnapshot", status_body)
        self.assertIn("isUsbHidMounted", status_body)
        self.assertIn("TCP_CONTROL_FIRMWARE_VERSION", status_body)
        self.assertIn("TCP_CONTROL_PROTOCOL_VERSION", status_body)
        self.assertIn("TCP_CONTROL_CAPABILITIES", status_body)

    def test_setup_command_is_post_session_only(self) -> None:
        source = read_file("WifiTcpControl.cpp")
        setup_body = function_body(source, "handleSetupCommand")

        self.assertIn("requireAuthenticated", setup_body)
        self.assertIn("tcpClientOwnsWifi", setup_body)
        self.assertIn("acceptWifiTcpHidForOwner", setup_body)
        self.assertIn("TCP_ERROR_NOT_OWNER", setup_body)

    def test_manual_tcp_client_helper_exists(self) -> None:
        helper = FIRMWARE_DIR / "tools" / "tcp_control_client.py"
        self.assertTrue(helper.exists())
        source = helper.read_text(encoding="utf-8")

        for symbol in (
            "MSG_HELLO",
            "MSG_AUTH",
            "MSG_CLAIM_OWNER",
            "MSG_HEARTBEAT",
            "MSG_BUTTON_STATE",
            "MSG_WHEEL_TICK",
            "MSG_KEY_COMBO",
            "MSG_RELEASE_ALL",
            "hid-smoke",
            "smoke",
            "timeout",
        ):
            with self.subTest(symbol=symbol):
                self.assertIn(symbol, source)


if __name__ == "__main__":
    unittest.main()
