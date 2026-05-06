# Production Transport Spec

Implementation contract derived from `docs/Production_Transport_Architecture.md`.

Status:

- Section 1 locked: shared semantic events.
- Section 2 locked: Wi-Fi TCP control protocol.
- Section 3 locked: UDP motion session gate.
- Section 5 draft: reference notes for task 2.5 only.

---

## 1. Shared Input Event Model

Events describe semantic input. They are not wire bytes.

| Event | Purpose | Reliability | Wi-Fi | BLE |
|---|---|---|---|---|
| `PointerMotion` | Relative cursor movement | Loss-tolerant | UDP | BLE |
| `ButtonState` | Absolute mouse button state | Reliable | TCP | BLE |
| `WheelTick` | Mouse wheel tick count | Reliable | TCP | BLE |
| `KeyCombo` | One or more `LogicalKey` values | Reliable | TCP | BLE |
| `ReleaseAll` | Clear all HID state | Reliable + timeout backup | TCP | BLE |
| `Heartbeat` | Keep owner session alive | Reliable periodic control | TCP | BLE/status |
| `StatusRequest` | Request ESP state | Reliable | TCP | BLE |
| `StatusResponse` | Report ESP state | Reliable | TCP | BLE |
| `SetupCommand` | Pairing/Wi-Fi/admin setup | Reliable | TCP or BLE by phase | BLE |

### 1.1 Event Fields And Rules

`PointerMotion`

```text
dx: Int16
dy: Int16
```

- Relative deltas only, not coordinates.
- Units come from the pointer engine and may be transport-scaled.
- Wi-Fi must preserve the UDP motion pipeline in `docs/UDP_Motion_Findings.md`.
- Stale motion may be dropped; never replay delayed motion.

`ButtonState`

```text
buttons: UInt8
```

- Absolute bitfield, not down/up deltas.
- Bit 0 = left, bit 1 = right, bits 2...7 reserved.
- `0` = all mouse buttons released.
- Unsupported bits must be ignored.
- Repeated identical states are idempotent.

`WheelTick`

```text
delta: Int8
```

- Relative wheel tick count.
- May contain accumulated ticks.
- Direction must match current app behavior.
- Smooth trackpad-style scroll is out of scope.

`KeyCombo`

```text
keys: [LogicalKey]
```

- `keys.count >= 1`.
- Single key is valid: `[space]`, `[backspace]`, `[keyA]`.
- Multiple keys are valid: `[shift, keyA]`, `[control, arrowRight]`.
- Keep current max combo length unless a later spec changes it.
- ESP presses listed keys, emits combo, then releases keyboard state.

`ReleaseAll`

```text
reason: background | timeout | modeSwitch | disconnect | userEmergency
```

- Must release mouse buttons and keyboard keys.
- Must clear wheel state, motion queues, and local HID report state.
- Must be safe to repeat.

`Heartbeat`

```text
sessionId: UInt32 or wider
activeMode: wifi | ble
```

- Keeps the active owner alive.
- Missing heartbeat eventually triggers ESP release-all.
- Exact interval/timeout is defined later.

`StatusRequest`

```text
requestId: UInt32
```

`StatusResponse`

```text
requestId: UInt32
activeMode: none | wifi | ble
wifiConnected: Bool
bleConnected: Bool
usbHidMounted: Bool
owned: Bool
ownedByThisSession: Bool
firmwareVersion: String
protocolVersion: UInt16
capabilities: CapabilitySet
```

`SetupCommand`

```text
scanWifi
setWifiCredentials
forgetWifi
listSavedWifi
pair
resetPairing
```

- Initial Wi-Fi setup begins over BLE.
- ESP scan results are the source of selectable SSIDs.
- iOS current-SSID access may help preselect, but must not be required.
- ESP stores Wi-Fi profiles as `SSID + password` for now.

### 1.2 HID Impact

| Event | Drives HID |
|---|---|
| `PointerMotion` | Yes |
| `ButtonState` | Yes |
| `WheelTick` | Yes |
| `KeyCombo` | Yes |
| `ReleaseAll` | Yes |
| `Heartbeat` | No, except timeout side effect |
| `StatusRequest` | No |
| `StatusResponse` | No |
| `SetupCommand` | No, except `resetPairing` may force release-all |

### 1.3 Transport Rules

- Wi-Fi uses UDP only for `PointerMotion`.
- Wi-Fi uses TCP for all reliable events.
- BLE supports all events as the full fallback path.
- Only active mode may drive HID.
- Inactive mode is ignored except setup, status, heartbeat, ownership, and release-all safety paths.
- UDP motion is accepted only while an authenticated TCP owner session is active.

### 1.4 App-Local Concepts

`SystemCommand` is app-local for now. It resolves to `KeyCombo` before transport.

```text
swipeLeft  -> [control, arrowRight]
swipeRight -> [control, arrowLeft]
swipeUp    -> [control, arrowUp]
swipeDown  -> [control, arrowDown]
```

Do not add `SystemCommand` as a wire event unless a later spec changes this.

---

## 2. Wi-Fi TCP Control Protocol

Wi-Fi TCP carries reliable control only. Cursor motion remains UDP.

TCP owns:

- protocol negotiation
- authentication
- ownership
- heartbeat
- status
- setup/admin after Wi-Fi is available
- `ButtonState`, `WheelTick`, `KeyCombo`, `ReleaseAll`

### 2.1 Frame

TCP is a byte stream; every message is framed.

All multi-byte integers are little-endian.

```text
magic: UInt16          // 0x5243 ("RC")
version: UInt8
type: UInt8            // TcpMessageType
seq: UInt32            // monotonically increasing per sender
payloadLength: UInt16  // max 1024 for now
flags: UInt16          // reserved, send 0
payload: [UInt8]
```

Primitive encoding:

```text
Bool: UInt8            // 0=false, 1=true
Enum: UInt8 unless specified
String: UInt8 length + UTF-8 bytes
OpaqueBytes: UInt8 length + raw bytes
```

Rules:

- Bad `magic`, unsupported version, unknown type, or invalid length => `Error`; receiver may close connection.
- Numeric message IDs are assigned during implementation and must remain stable after first integration.

### 2.2 Message Types

| Type | Direction | Purpose |
|---|---|---|
| `Hello` | iOS -> ESP | Start version/capability negotiation |
| `HelloAck` | ESP -> iOS | Select version, report identity/capabilities |
| `Auth` | iOS -> ESP | Prove paired identity |
| `AuthResult` | ESP -> iOS | Accept/reject auth |
| `ClaimOwner` | iOS -> ESP | Request active Wi-Fi ownership |
| `OwnerResult` | ESP -> iOS | Grant/reject ownership; provide session data |
| `Heartbeat` | iOS -> ESP | Keep owner alive |
| `StatusRequest` | iOS -> ESP | Request ESP state |
| `StatusResponse` | ESP -> iOS | Report ESP state |
| `ButtonState` | iOS -> ESP | Set absolute mouse button state |
| `WheelTick` | iOS -> ESP | Emit wheel ticks |
| `KeyCombo` | iOS -> ESP | Emit one or more `LogicalKey` values |
| `ReleaseAll` | iOS -> ESP | Clear all HID state |
| `SetupCommand` | iOS -> ESP | Post-session setup/admin command |
| `SetupResult` | ESP -> iOS | Setup/admin result |
| `Error` | Either | Protocol/session error |

### 2.3 Session Flow

```text
iOS opens TCP
iOS -> Hello
ESP -> HelloAck
iOS -> Auth
ESP -> AuthResult
iOS -> ClaimOwner
ESP -> OwnerResult
iOS starts Heartbeat
Wi-Fi Mode active
UDP PointerMotion accepted
```

Rules:

- UDP motion ignored until ownership is granted.
- HID-driving TCP messages rejected until ownership is granted.
- TCP disconnect => clear Wi-Fi ownership and reject UDP motion.
- Heartbeat timeout => release-all, clear Wi-Fi ownership, reject UDP motion.

### 2.4 Payloads

`Hello`

```text
minProtocolVersion: UInt16
maxProtocolVersion: UInt16
clientCapabilities: UInt32
```

`HelloAck`

```text
selectedProtocolVersion: UInt16
espCapabilities: UInt32
deviceId: OpaqueBytes
firmwareVersion: String
```

`Auth`

```text
phoneId: OpaqueBytes
credentialProof: OpaqueBytes
```

Exact proof format is deferred to pairing/security spec.

`AuthResult`

```text
accepted: Bool
reason: UInt8
```

`ClaimOwner`

```text
requestedMode: wifi
```

`OwnerResult`

```text
granted: Bool
reason: UInt8
sessionId: UInt32
udpToken: UInt32
inputEpoch: UInt32
```

- `sessionId` identifies active TCP owner session.
- `udpToken` gates UDP motion.
- `inputEpoch` initializes cross-transport ordering.

`Heartbeat`

```text
sessionId: UInt32
```

`ButtonState`

```text
sessionId: UInt32
inputEpoch: UInt32
buttons: UInt8
```

- `inputEpoch` increments when button state changes.
- ESP stores latest accepted button state and includes it in HID reports.
- UDP-side epoch handling is specified in task 2.3.

`WheelTick`

```text
sessionId: UInt32
delta: Int8
```

`KeyCombo`

```text
sessionId: UInt32
count: UInt8
keys: [LogicalKey]
```

- `1 <= count <= 3` for now.
- Single key is valid.
- ESP may use `Keyboard.releaseAll()` after combo.

`ReleaseAll`

```text
sessionId: UInt32
inputEpoch: UInt32
reason: ReleaseReason
```

- Idempotent.
- Clears buttons, keys, wheel, motion queues, and local HID report state.
- `inputEpoch` increments when sent.

`StatusRequest`

```text
requestId: UInt32
```

`StatusResponse`

```text
requestId: UInt32
activeMode: none | wifi | ble
wifiConnected: Bool
bleConnected: Bool
usbHidMounted: Bool
owned: Bool
ownedByThisSession: Bool
firmwareVersion: String
protocolVersion: UInt16
capabilities: UInt32
```

`SetupCommand`

Allowed TCP variants:

```text
listSavedWifi
forgetWifi
resetPairing
```

- TCP setup/admin is post-session only.
- Initial `scanWifi` and `setWifiCredentials` are BLE-first.
- `resetPairing` must force release-all before clearing ownership/credentials.

### 2.5 Responses And Errors

Explicit responses:

```text
Hello         -> HelloAck
Auth          -> AuthResult
ClaimOwner    -> OwnerResult
StatusRequest -> StatusResponse
SetupCommand  -> SetupResult
```

No per-message acknowledgement:

```text
ButtonState
WheelTick
KeyCombo
ReleaseAll
Heartbeat
```

`Error`

```text
code: UInt16
relatedSeq: UInt32
message: String
```

Common codes:

```text
badFrame
unsupportedVersion
authFailed
notAuthenticated
notOwner
alreadyOwned
invalidState
unknownMessage
payloadTooLarge
```

---

## 3. UDP Motion Session Gate

UDP carries Wi-Fi `PointerMotion` only. It is lossy, unacknowledged, and gated by the active TCP owner session.

### 3.1 Packet

Production UDP motion uses a gated packet, not the raw POC `0xB2` packet.

All multi-byte integers are little-endian.

```text
marker: UInt8        // 0xB3 production gated motion
udpPacketVersion: UInt8
sessionId: UInt32
udpToken: UInt32
packetSeq: UInt16
inputEpoch: UInt32
frameCount: UInt8
frames: (dx: Int16, dy: Int16) * frameCount
```

Rules:

- `frameCount` must be `1` for production v1.
- Any `frameCount` other than `1` is invalid.
- `dx/dy` are scaled relative motion units from the pointer pipeline.

### 3.2 Acceptance Gate

ESP accepts a UDP motion packet only if all checks pass:

```text
activeMode == wifi
TCP owner session is active
UDP source address matches active TCP owner address
udpPacketVersion is supported
sessionId == active sessionId
udpToken == active udpToken
inputEpoch == current inputEpoch
frameCount == 1
packet length is valid
```

Otherwise drop the packet without moving HID.

UDP drops must not:

- update buttons
- update wheel
- send keyboard input
- claim ownership
- authenticate
- refresh heartbeat
- change active mode

### 3.3 Epoch Rule

`inputEpoch` links TCP control state to UDP motion.

- iOS owns `inputEpoch`.
- ESP initializes `inputEpoch` from `OwnerResult`.
- iOS increments `inputEpoch` only for TCP `ButtonState` changes and TCP `ReleaseAll`.
- ESP updates its current accepted epoch only from accepted TCP control messages.
- iOS includes the latest known `inputEpoch` in every UDP motion packet.
- ESP accepts UDP only when packet epoch equals current accepted TCP epoch.
- Packets with older or future epoch are dropped in v1.
- ESP does not buffer future-epoch UDP packets in v1.

This prevents motion from being applied with stale drag/button state.

iOS rule:

- After sending `ButtonState` or `ReleaseAll`, iOS must update its UDP `inputEpoch` to match that TCP control state.
- Small motion loss around button transitions is acceptable in v1.

### 3.4 Sequence And Loss

- `packetSeq` increments per UDP datagram and may wrap.
- `packetSeq` is a diagnostic/drop hint in v1, not a reliability mechanism.
- Missing sequence numbers are acceptable.
- Duplicate or detectably older packets may be dropped.
- No UDP retries.
- No UDP ACKs.
- Stale frames are dropped, not replayed.
- Delayed motion must never be accumulated into a later jump.

### 3.5 Relation To POC

The production packet adds session fields, but the motion behavior must preserve the POC decisions:

- per-sample FIFO on iOS
- one subframe per UDP datagram by default
- no sender-side drain-all batching
- ESP queues per-subframe motion
- ESP HID pacer emits at most one motion frame per tick
- TinyUSB high-rate HID path remains the output path

---

## 5. Wi-Fi Network Change And Recovery Rules

Status: Draft reference for task 2.5. Not locked yet.

These notes cover ESP-side Wi-Fi loss/change behavior and must be reviewed during the mode-switching state machine spec.

### 5.1 Rules

- ESP must not roam while the current Wi-Fi owner session is healthy.
- ESP may try another saved network only if current Wi-Fi is unhealthy, no Wi-Fi owner exists, or user starts setup/recovery.
- ESP joining Wi-Fi does not prove iOS can reach it; iOS must verify Bonjour/TCP reachability.
- Visible unsaved SSIDs are not usable by default. They may be neighbor/guest/captive networks.
- If no saved usable Wi-Fi exists, BLE remains active fallback and setup is optional.

### 5.2 ESP Loses Current Wi-Fi

```text
stop TCP control
stop UDP motion
clear Wi-Fi ownership
enter BLE fallback/recovery availability
scan visible Wi-Fi
release-all via heartbeat/timeout safety path
```

### 5.3 Saved Wi-Fi Available

```text
ESP connects using stored credentials
ESP advertises/discovers over Wi-Fi
iOS verifies reachability
reachable   -> Wi-Fi Mode may become active
unreachable -> BLE remains available; prompt user to switch iPhone Wi-Fi or continue BLE
```

### 5.4 No Saved Usable Wi-Fi

```text
BLE Mode remains active fallback
optional actions: Set Up Smooth Wi-Fi / Continue With BLE
```

Do not prompt for password only because unsaved SSIDs are visible.

### 5.5 New Wi-Fi Setup

```text
ESP provides visible SSID list
user selects accessible network
user enters password
ESP stores SSID/password after successful setup
ESP connects
iOS verifies reachability before Wi-Fi Mode
```

iOS current-SSID lookup may preselect a network if available, but must not be required.
