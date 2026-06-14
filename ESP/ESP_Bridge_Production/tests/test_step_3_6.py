#!/usr/bin/env python3
"""Step 3.6 firmware source checks for the production UDP owner gate."""

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


class Step36UdpGateChecks(unittest.TestCase):
    def test_config_uses_production_udp_packet_constants(self) -> None:
        config = read_file("Config.h")

        self.assertIn("#define UDP_MOTION_PACKET_MARKER  0xB3", config)
        self.assertIn("UDP_MOTION_PACKET_VERSION", config)
        self.assertIn("UDP_MOTION_PACKET_LENGTH  21", config)
        self.assertNotIn("#define UDP_MOTION_PACKET_MARKER  0xB2", config)

    def test_owner_session_exposes_udp_gate(self) -> None:
        header = read_file("OwnerSession.h")
        impl = read_file("OwnerSession.cpp")
        body = function_body(impl, "acceptWifiUdpMotionForOwner")

        self.assertIn("acceptWifiUdpMotionForOwner", header)
        self.assertIn("ownerState.ownerKind == OWNER_WIFI", body)
        self.assertIn("ownerState.sessionId == sessionId", body)
        self.assertIn("ownerState.udpToken == udpToken", body)
        self.assertIn("ownerState.inputEpoch == inputEpoch", body)
        self.assertIn("ownerState.tcpEndpoint.ipv4 == remoteIpv4", body)
        self.assertIn("nowMs < ownerState.heartbeatDeadlineMs", body)
        self.assertNotIn("refreshOwnerHeartbeat", body)

    def test_udp_receiver_parses_only_gated_v1_packet(self) -> None:
        source = read_file("UdpMotion.cpp")
        body = function_body(source, "pollUdpMotionPackets")

        self.assertIn("UDP_MOTION_PACKET_LENGTH", body)
        self.assertIn("UDP_MOTION_PACKET_MARKER", body)
        self.assertIn("UDP_MOTION_PACKET_VERSION", body)
        self.assertIn("UDP_MOTION_FRAME_COUNT", body)
        self.assertIn("readLe32(&packet[2])", body)
        self.assertIn("readLe32(&packet[6])", body)
        self.assertIn("readLe16(&packet[10])", body)
        self.assertIn("readLe32(&packet[12])", body)
        self.assertIn("readLe16(&packet[17])", body)
        self.assertIn("readLe16(&packet[19])", body)

    def test_udp_acceptance_uses_owner_gate_before_motion_stage(self) -> None:
        source = read_file("UdpMotion.cpp")
        body = function_body(source, "pollUdpMotionPackets")

        gate_index = body.find("acceptWifiUdpMotionForOwner")
        stage_index = body.find("stagePointerMotion")
        self.assertGreaterEqual(gate_index, 0)
        self.assertGreater(stage_index, gate_index)
        self.assertIn("udpMotion.remoteIP()", body)
        self.assertIn("diag.udpGateRejected++", body)

    def test_manual_tcp_client_has_udp_smoke_command(self) -> None:
        helper = (FIRMWARE_DIR / "tools" / "tcp_control_client.py").read_text(encoding="utf-8")

        self.assertIn("UDP_MARKER = 0xB3", helper)
        self.assertIn("UDP_VERSION = 1", helper)
        self.assertIn("build_udp_motion_packet", helper)
        self.assertIn("send_udp_rejection_probes", helper)
        self.assertIn("udp-smoke", helper)


if __name__ == "__main__":
    unittest.main()
