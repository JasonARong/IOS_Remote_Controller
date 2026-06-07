#!/usr/bin/env python3
"""Raw TCP test client for ESP_Bridge_Production task 3.5.

This speaks the firmware's little-endian binary TCP control protocol directly.
It intentionally uses only Python's standard library so it can run on macOS
without setup.
"""

from __future__ import annotations

import argparse
import socket
import struct
import sys
import time
from dataclasses import dataclass


MAGIC = 0x5243
FRAME_VERSION = 1
PROTOCOL_VERSION = 1
DEFAULT_PORT = 4211
UDP_PORT = 4210
UDP_MARKER = 0xB3
UDP_VERSION = 1
UDP_FRAME_COUNT = 1
DEFAULT_STEP_DELAY = 0.05

MSG_HELLO = 1
MSG_HELLO_ACK = 2
MSG_AUTH = 3
MSG_AUTH_RESULT = 4
MSG_CLAIM_OWNER = 5
MSG_OWNER_RESULT = 6
MSG_HEARTBEAT = 7
MSG_STATUS_REQUEST = 8
MSG_STATUS_RESPONSE = 9
MSG_BUTTON_STATE = 10
MSG_WHEEL_TICK = 11
MSG_KEY_COMBO = 12
MSG_RELEASE_ALL = 13
MSG_SETUP_COMMAND = 14
MSG_SETUP_RESULT = 15
MSG_ERROR = 16

ERROR_NOT_OWNER = 5

ERROR_NAMES = {
    1: "badFrame",
    2: "unsupportedVersion",
    3: "authFailed",
    4: "notAuthenticated",
    5: "notOwner",
    6: "alreadyOwned",
    7: "invalidState",
    8: "unknownMessage",
    9: "payloadTooLarge",
}

MESSAGE_NAMES = {
    MSG_HELLO: "Hello",
    MSG_HELLO_ACK: "HelloAck",
    MSG_AUTH: "Auth",
    MSG_AUTH_RESULT: "AuthResult",
    MSG_CLAIM_OWNER: "ClaimOwner",
    MSG_OWNER_RESULT: "OwnerResult",
    MSG_HEARTBEAT: "Heartbeat",
    MSG_STATUS_REQUEST: "StatusRequest",
    MSG_STATUS_RESPONSE: "StatusResponse",
    MSG_BUTTON_STATE: "ButtonState",
    MSG_WHEEL_TICK: "WheelTick",
    MSG_KEY_COMBO: "KeyCombo",
    MSG_RELEASE_ALL: "ReleaseAll",
    MSG_SETUP_COMMAND: "SetupCommand",
    MSG_SETUP_RESULT: "SetupResult",
    MSG_ERROR: "Error",
}

RELEASE_REASON_USER_EMERGENCY = 5


def opaque(value: bytes) -> bytes:
    if len(value) > 255:
        raise ValueError("opaque value too long")
    return struct.pack("<B", len(value)) + value


def text(value: str) -> bytes:
    raw = value.encode("utf-8")
    if len(raw) > 255:
        raise ValueError("string too long")
    return struct.pack("<B", len(raw)) + raw


class PayloadReader:
    def __init__(self, data: bytes) -> None:
        self.data = data
        self.pos = 0

    def _take(self, size: int) -> bytes:
        if self.pos + size > len(self.data):
            raise ValueError("payload truncated")
        chunk = self.data[self.pos : self.pos + size]
        self.pos += size
        return chunk

    def u8(self) -> int:
        return struct.unpack("<B", self._take(1))[0]

    def i8(self) -> int:
        return struct.unpack("<b", self._take(1))[0]

    def u16(self) -> int:
        return struct.unpack("<H", self._take(2))[0]

    def u32(self) -> int:
        return struct.unpack("<I", self._take(4))[0]

    def bool(self) -> bool:
        return self.u8() != 0

    def opaque(self) -> bytes:
        return self._take(self.u8())

    def string(self) -> str:
        return self.opaque().decode("utf-8", errors="replace")

    def done(self) -> bool:
        return self.pos == len(self.data)


@dataclass
class Frame:
    msg_type: int
    seq: int
    payload: bytes


@dataclass
class Owner:
    session_id: int
    udp_token: int
    input_epoch: int


class TcpControlClient:
    def __init__(self, host: str, port: int, timeout: float, step_delay: float) -> None:
        self.host = host
        self.port = port
        self.timeout = timeout
        self.step_delay = step_delay
        self.sock: socket.socket | None = None
        self.tx_seq = 1

    def __enter__(self) -> "TcpControlClient":
        self.sock = socket.create_connection((self.host, self.port), self.timeout)
        self.sock.setsockopt(socket.IPPROTO_TCP, socket.TCP_NODELAY, 1)
        self.sock.settimeout(self.timeout)
        print(f"CLIENT connected {self.host}:{self.port} timeout={self.timeout}s stepDelay={self.step_delay}s tcpNoDelay=on")
        return self

    def __exit__(self, *_exc: object) -> None:
        if self.sock is not None:
            self.sock.close()

    def _socket(self) -> socket.socket:
        if self.sock is None:
            raise RuntimeError("not connected")
        return self.sock

    def send(self, msg_type: int, payload: bytes = b"") -> int:
        seq = self.tx_seq
        self.tx_seq += 1
        header = struct.pack(
            "<HBBIHH",
            MAGIC,
            FRAME_VERSION,
            msg_type,
            seq,
            len(payload),
            0,
        )
        self._socket().sendall(header + payload)
        print(f"CLIENT tx {MESSAGE_NAMES.get(msg_type, msg_type)} seq={seq} len={len(payload)}")
        self.pause()
        return seq

    def recv_frame(self) -> Frame:
        header = self._recv_exact(12)
        magic, version, msg_type, seq, payload_len, flags = struct.unpack("<HBBIHH", header)
        if magic != MAGIC:
            raise RuntimeError(f"bad magic 0x{magic:04x}")
        if version != FRAME_VERSION:
            raise RuntimeError(f"bad frame version {version}")
        if flags != 0:
            raise RuntimeError(f"bad flags {flags}")
        frame = Frame(msg_type, seq, self._recv_exact(payload_len))
        print(f"CLIENT rx {MESSAGE_NAMES.get(msg_type, msg_type)} seq={seq} len={payload_len}")
        self.pause()
        return frame

    def pause(self) -> None:
        if self.step_delay > 0:
            time.sleep(self.step_delay)

    def expect(self, msg_type: int) -> Frame:
        frame = self.recv_frame()
        if frame.msg_type == MSG_ERROR:
            raise RuntimeError(format_error(frame))
        if frame.msg_type != msg_type:
            name = MESSAGE_NAMES.get(frame.msg_type, str(frame.msg_type))
            expected = MESSAGE_NAMES.get(msg_type, str(msg_type))
            raise RuntimeError(f"expected {expected}, got {name}")
        return frame

    def drain_optional_errors(self, seconds: float = 0.15) -> list[str]:
        errors: list[str] = []
        sock = self._socket()
        old_timeout = sock.gettimeout()
        sock.settimeout(seconds)
        try:
            while True:
                try:
                    frame = self.recv_frame()
                except socket.timeout:
                    break
                if frame.msg_type == MSG_ERROR:
                    errors.append(format_error(frame))
                else:
                    errors.append(f"unexpected {MESSAGE_NAMES.get(frame.msg_type, frame.msg_type)}")
        finally:
            sock.settimeout(old_timeout)
        return errors

    def _recv_exact(self, size: int) -> bytes:
        chunks = bytearray()
        while len(chunks) < size:
            chunk = self._socket().recv(size - len(chunks))
            if not chunk:
                raise RuntimeError("connection closed")
            chunks.extend(chunk)
        return bytes(chunks)


def parse_error(frame: Frame) -> tuple[int, int, str]:
    if frame.msg_type != MSG_ERROR:
        name = MESSAGE_NAMES.get(frame.msg_type, str(frame.msg_type))
        raise RuntimeError(f"expected Error, got {name}")
    reader = PayloadReader(frame.payload)
    code = reader.u16()
    related_seq = reader.u32()
    message = reader.string()
    return code, related_seq, message


def format_error(frame: Frame) -> str:
    code, related_seq, message = parse_error(frame)
    return f"Error {ERROR_NAMES.get(code, code)} relatedSeq={related_seq}: {message}"


def parse_hello_ack(frame: Frame) -> None:
    reader = PayloadReader(frame.payload)
    selected = reader.u16()
    capabilities = reader.u32()
    device_id = reader.opaque().decode("utf-8", errors="replace")
    firmware = reader.string()
    print(f"HelloAck protocol={selected} capabilities=0x{capabilities:08x} device={device_id} firmware={firmware}")


def parse_auth_result(frame: Frame) -> None:
    reader = PayloadReader(frame.payload)
    accepted = reader.bool()
    reason = reader.u8()
    print(f"AuthResult accepted={accepted} reason={reason}")
    if not accepted:
        raise RuntimeError("auth rejected")


def parse_owner_result(frame: Frame) -> Owner:
    reader = PayloadReader(frame.payload)
    granted = reader.bool()
    reason = reader.u8()
    session_id = reader.u32()
    udp_token = reader.u32()
    input_epoch = reader.u32()
    print(
        "OwnerResult "
        f"granted={granted} reason={reason} sessionId={session_id} "
        f"udpToken={udp_token} inputEpoch={input_epoch}"
    )
    if not granted:
        raise RuntimeError("owner claim rejected")
    return Owner(session_id, udp_token, input_epoch)


def parse_status(frame: Frame) -> None:
    reader = PayloadReader(frame.payload)
    request_id = reader.u32()
    active_mode = reader.u8()
    wifi_connected = reader.bool()
    ble_connected = reader.bool()
    usb_hid_mounted = reader.bool()
    owned = reader.bool()
    owned_by_this_session = reader.bool()
    firmware = reader.string()
    protocol = reader.u16()
    capabilities = reader.u32()
    mode_label = {0: "none", 1: "wifi", 2: "ble"}.get(active_mode, str(active_mode))
    print(
        "StatusResponse "
        f"requestId={request_id} activeMode={mode_label} wifi={wifi_connected} "
        f"ble={ble_connected} usbHidMounted={usb_hid_mounted} owned={owned} "
        f"ownedByThisSession={owned_by_this_session} firmware={firmware} "
        f"protocol={protocol} capabilities=0x{capabilities:08x}"
    )


def handshake(client: TcpControlClient, phone_id: str) -> Owner:
    client.send(MSG_HELLO, struct.pack("<HHI", PROTOCOL_VERSION, PROTOCOL_VERSION, 0xFFFFFFFF))
    parse_hello_ack(client.expect(MSG_HELLO_ACK))

    payload = opaque(phone_id.encode("utf-8")) + opaque(b"placeholder-proof")
    client.send(MSG_AUTH, payload)
    parse_auth_result(client.expect(MSG_AUTH_RESULT))

    client.send(MSG_CLAIM_OWNER, struct.pack("<B", 1))
    return parse_owner_result(client.expect(MSG_OWNER_RESULT))


def send_status(client: TcpControlClient, request_id: int = 1) -> None:
    client.send(MSG_STATUS_REQUEST, struct.pack("<I", request_id))
    parse_status(client.expect(MSG_STATUS_RESPONSE))


def send_heartbeat(client: TcpControlClient, owner: Owner) -> None:
    client.send(MSG_HEARTBEAT, struct.pack("<I", owner.session_id))
    errors = client.drain_optional_errors()
    if errors:
        raise RuntimeError("; ".join(errors))


def keepalive(client: TcpControlClient, owner: Owner, seconds: float) -> None:
    end = time.monotonic() + seconds
    count = 0
    while time.monotonic() < end:
        send_heartbeat(client, owner)
        count += 1
        time.sleep(0.5)
    print(f"sent {count} heartbeat(s)")


def send_bad_session_probe(client: TcpControlClient, owner: Owner) -> None:
    bad_session = owner.session_id ^ 0xFFFFFFFF
    if bad_session == owner.session_id:
        bad_session += 1
    sent_seq = client.send(MSG_WHEEL_TICK, struct.pack("<Ib", bad_session, 1))
    frame = client.recv_frame()
    code, related_seq, message = parse_error(frame)
    if code != ERROR_NOT_OWNER:
        raise RuntimeError(format_error(frame))
    if related_seq != sent_seq:
        raise RuntimeError(f"notOwner relatedSeq mismatch: expected {sent_seq}, got {related_seq}")
    print(f"Expected bad-session rejection: PASS ({ERROR_NAMES[code]}: {message})")


def hid_smoke(client: TcpControlClient, owner: Owner) -> Owner:
    print("Sending HID smoke: left click, wheel tick, Escape key, release-all")

    owner.input_epoch += 1
    client.send(MSG_BUTTON_STATE, struct.pack("<IIB", owner.session_id, owner.input_epoch, 1))
    time.sleep(0.08)
    owner.input_epoch += 1
    client.send(MSG_BUTTON_STATE, struct.pack("<IIB", owner.session_id, owner.input_epoch, 0))

    client.send(MSG_WHEEL_TICK, struct.pack("<Ib", owner.session_id, 1))
    client.send(MSG_KEY_COMBO, struct.pack("<IBB", owner.session_id, 1, 24))  # Escape

    owner.input_epoch += 1
    client.send(
        MSG_RELEASE_ALL,
        struct.pack("<IIB", owner.session_id, owner.input_epoch, RELEASE_REASON_USER_EMERGENCY),
    )
    errors = client.drain_optional_errors(0.3)
    if errors:
        raise RuntimeError("; ".join(errors))
    print(f"HID smoke sent; new inputEpoch={owner.input_epoch}")
    return owner


def build_udp_motion_packet(
    owner: Owner,
    packet_seq: int,
    dx: int,
    dy: int,
    *,
    session_id: int | None = None,
    udp_token: int | None = None,
    input_epoch: int | None = None,
    frame_count: int = UDP_FRAME_COUNT,
) -> bytes:
    return struct.pack(
        "<BBIIHIBhh",
        UDP_MARKER,
        UDP_VERSION,
        owner.session_id if session_id is None else session_id,
        owner.udp_token if udp_token is None else udp_token,
        packet_seq & 0xFFFF,
        owner.input_epoch if input_epoch is None else input_epoch,
        frame_count,
        dx,
        dy,
    )


def send_udp_motion(host: str, owner: Owner, dx: int, dy: int, count: int) -> None:
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as udp:
        for index in range(count):
            packet = build_udp_motion_packet(owner, index, dx, dy)
            udp.sendto(packet, (host, UDP_PORT))
            time.sleep(0.01)
    print(f"Sent {count} valid UDP motion packet(s) to {host}:{UDP_PORT}")


def send_udp_rejection_probes(host: str, owner: Owner) -> None:
    probes = (
        ("bad session", build_udp_motion_packet(owner, 100, 60, 0, session_id=owner.session_id ^ 0xFFFFFFFF)),
        ("bad token", build_udp_motion_packet(owner, 101, 60, 0, udp_token=owner.udp_token ^ 0xFFFFFFFF)),
        ("bad epoch", build_udp_motion_packet(owner, 102, 60, 0, input_epoch=owner.input_epoch + 99)),
        ("bad frameCount", build_udp_motion_packet(owner, 103, 60, 0, frame_count=2)),
        ("old 0xB2 marker", bytes([0xB2, 0x00, 0x01, 60, 0, 0, 0])),
    )
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as udp:
        for label, packet in probes:
            udp.sendto(packet, (host, UDP_PORT))
            print(f"Sent invalid UDP probe: {label}")
            time.sleep(0.02)


def command_claim(args: argparse.Namespace) -> None:
    with TcpControlClient(args.host, args.port, args.timeout, args.step_delay) as client:
        owner = handshake(client, args.phone_id)
        send_status(client)
        if args.keepalive > 0:
            keepalive(client, owner, args.keepalive)


def command_smoke(args: argparse.Namespace) -> None:
    with TcpControlClient(args.host, args.port, args.timeout, args.step_delay) as client:
        owner = handshake(client, args.phone_id)
        send_status(client, 1)
        keepalive(client, owner, 2.0)
        send_bad_session_probe(client, owner)
        send_status(client, 2)
        print("Smoke complete. Close this client or wait 1.5s to verify owner timeout on Serial.")


def command_hid_smoke(args: argparse.Namespace) -> None:
    with TcpControlClient(args.host, args.port, args.timeout, args.step_delay) as client:
        owner = handshake(client, args.phone_id)
        send_status(client, 1)
        owner = hid_smoke(client, owner)
        send_bad_session_probe(client, owner)
        send_status(client, 2)
        if args.keepalive > 0:
            keepalive(client, owner, args.keepalive)


def command_udp_smoke(args: argparse.Namespace) -> None:
    with TcpControlClient(args.host, args.port, args.timeout, args.step_delay) as client:
        owner = handshake(client, args.phone_id)
        send_status(client, 1)
        send_udp_motion(args.host, owner, args.dx, args.dy, args.count)
        send_heartbeat(client, owner)
        send_udp_rejection_probes(args.host, owner)
        send_status(client, 2)
        print("UDP smoke complete. Expect cursor movement from valid packets only; invalid probes should raise gateReject/malformed diagnostics.")


def command_timeout(args: argparse.Namespace) -> None:
    with TcpControlClient(args.host, args.port, args.timeout, args.step_delay) as client:
        handshake(client, args.phone_id)
        print(f"Waiting {args.wait}s without heartbeat...")
        time.sleep(args.wait)
        send_status(client, 1)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="ESP production TCP control test client")
    parser.add_argument("host", help="ESP IP address, shown in Serial diagnostics")
    parser.add_argument("--port", type=int, default=DEFAULT_PORT)
    parser.add_argument("--timeout", type=float, default=3.0)
    parser.add_argument("--step-delay", type=float, default=DEFAULT_STEP_DELAY, help="seconds to pause after each TCP frame send/receive")
    parser.add_argument("--phone-id", default="mac-manual-test")

    subparsers = parser.add_subparsers(dest="command", required=True)

    claim = subparsers.add_parser("claim", help="Hello/Auth/ClaimOwner plus Status")
    claim.add_argument("--keepalive", type=float, default=0.0, help="seconds to send heartbeat")
    claim.set_defaults(func=command_claim)

    smoke = subparsers.add_parser("smoke", help="safe owner/status/heartbeat/bad-session test")
    smoke.set_defaults(func=command_smoke)

    hid = subparsers.add_parser("hid-smoke", help="sends click, wheel, Escape, and release-all")
    hid.add_argument("--keepalive", type=float, default=0.0, help="seconds to send heartbeat after HID")
    hid.set_defaults(func=command_hid_smoke)

    udp = subparsers.add_parser("udp-smoke", help="claims TCP owner, then sends gated UDP motion/probes")
    udp.add_argument("--dx", type=int, default=80)
    udp.add_argument("--dy", type=int, default=0)
    udp.add_argument("--count", type=int, default=8)
    udp.set_defaults(func=command_udp_smoke)

    timeout = subparsers.add_parser("timeout", help="claim owner, stop heartbeat, then request status")
    timeout.add_argument("--wait", type=float, default=2.0)
    timeout.set_defaults(func=command_timeout)

    return parser


def main(argv: list[str]) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    try:
        args.func(args)
    except (OSError, RuntimeError, ValueError) as exc:
        print(f"FAIL: {exc}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
