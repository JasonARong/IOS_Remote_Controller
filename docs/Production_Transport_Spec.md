# Production Transport Spec

Implementation contract derived from `docs/Production_Transport_Architecture.md`.

Status:

- Section 1 locked: shared semantic events.
- Section 2 locked: Wi-Fi TCP control protocol.
- Section 3 locked: UDP motion session gate.
- Section 4 locked: BLE fallback protocol contract.
- Section 5 locked: mode switching and ownership state machine.

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

## 4. BLE Fallback Protocol Contract

BLE Mode is the full-feature fallback path. It supports all input features, setup, status, and safety behavior, but it does not try to match Wi-Fi cursor smoothness.

### 4.1 GATT Shape

One BLE service exposes two characteristics:

```text
RX: iOS -> ESP, properties WRITE and WRITE_NR
TX: ESP -> iOS, property NOTIFY
```

RX/TX are named from the ESP perspective.

Use rules:

- Pure cursor motion may use `WRITE_NR`.
- Legacy mouse packets with `wheel != 0` or a button-state change use `WRITE`.
- Pure-motion legacy mouse packets may use `WRITE_NR`.
- Key combos, release-all, ownership, setup, and status use `WRITE`.
- ESP responses and async setup/status results use `TX` notifications.

### 4.2 Legacy Input Packets

These packets stay unchanged for BLE input compatibility.

Mouse packet:

```text
buttons: UInt8       // valid bits: left=0x01, right=0x02
wheel: Int8
dx: Int16
dy: Int16
```

Debug mouse packet:

```text
marker: UInt8        // 0xA1
seq: UInt8
buttons: UInt8
wheel: Int8
dx: Int16
dy: Int16
```

Key combo packet:

```text
marker: UInt8        // 0xF1
count: UInt8         // 1...3 for now
keys: [LogicalKey]
```

Rules:

- A single key is a valid key combo.
- Packet dispatch is based on `byte[0]`:

```text
0x00...0x9F and length 6 -> legacy mouse packet; unsupported button bits ignored
0xA1 and length 8        -> debug mouse packet
0xF1                     -> key combo packet
0xF2                     -> control frame
otherwise               -> error
```

- Marker values `>= 0xA0` are reserved for typed packets except valid legacy debug/key/control markers.
- BLE mouse input feeds the same TinyUSB HID state/pacer used by Wi-Fi Mode.
- BLE motion may be bounded and stale-dropped; delayed motion must not be replayed as a later jump.

### 4.3 BLE Control Frame

All new BLE non-legacy messages use one control frame.

All multi-byte integers are little-endian.
Payload primitive encoding follows Section 2.1.

```text
marker: UInt8         // 0xF2
version: UInt8
type: UInt8           // BleControlType
requestId: UInt32
chunkIndex: UInt8     // 0 for unchunked
chunkCount: UInt8     // 1 for unchunked
payloadLength: UInt8
payload: [UInt8]
```

Rules:

- `chunkIndex < chunkCount`.
- Receiver reassembles chunks by `requestId` and `type`.
- Header size is 10 bytes. Chunk payload must fit the negotiated ATT value size minus 10 bytes and must not exceed 255 bytes.
- Invalid chunks, unknown types, unsupported versions, or oversized payloads produce `Error`.
- A completed request receives either its specific result message or `Error`.

### 4.4 Control Types

| Type | Direction | Purpose |
|---|---|---|
| `Pair` | iOS -> ESP | Start explicit app pairing |
| `PairResult` | ESP -> iOS | Report pairing result |
| `ClaimOwner` | iOS -> ESP | Request BLE active ownership |
| `OwnerResult` | ESP -> iOS | Grant/reject BLE ownership |
| `ReleaseOwner` | iOS -> ESP | Give up BLE ownership |
| `Heartbeat` | iOS -> ESP | Keep BLE owner alive |
| `ReleaseAll` | iOS -> ESP | Clear HID state |
| `StatusRequest` | iOS -> ESP | Request ESP state |
| `StatusResponse` | ESP -> iOS | Report ESP state |
| `ScanWifi` | iOS -> ESP | Request ESP-visible Wi-Fi scan |
| `ScanWifiResult` | ESP -> iOS | Report one visible SSID |
| `ScanWifiDone` | ESP -> iOS | End scan result stream |
| `SetWifiCredentials` | iOS -> ESP | Send selected SSID/password |
| `WifiConnectResult` | ESP -> iOS | Report Wi-Fi connection result |
| `ListSavedWifi` | iOS -> ESP | Request saved profile list |
| `SavedWifiEntry` | ESP -> iOS | Report one saved profile |
| `SavedWifiDone` | ESP -> iOS | End saved profile stream |
| `ForgetWifi` | iOS -> ESP | Delete saved profile |
| `ResetPairing` | iOS -> ESP | Clear pairing/admin state |
| `Error` | Either | Protocol/session error |

`ScanWifiResult` and `SavedWifiEntry` use one entry per notification. Long payloads use frame chunking.

BLE notifications are ordered within one connection. If a streamed result is interrupted or incomplete, iOS must re-request it.

### 4.5 Core Payloads

Only BLE-specific payload differences are listed here. Shared field meanings come from Section 1.

| Payload | Fields |
| --- | --- |
| `Pair` | `phoneId: OpaqueBytes`<br>`pairingProof: OpaqueBytes` |
| `PairResult` | `accepted: Bool`<br>`reason: UInt8` |
| `ClaimOwner` | `empty payload` |

Pair establishes long-term phone identity. ClaimOwner requests runtime HID ownership for an already-paired phone. Every granted ClaimOwner creates a fresh runtime `sessionId`; old ownership sessions are not resumed. ClaimOwner without valid pairing/authentication is rejected.

| Payload | Fields |
| --- | --- |
| `OwnerResult` | `granted: Bool`<br>`reason: UInt8`<br>`sessionId: UInt32` |
| `ReleaseOwner` | `sessionId: UInt32`<br>`reason: UInt8` |

iOS sends ReleaseOwner before intentionally leaving BLE HID ownership, such as when switching to Wi-Fi Mode.

| Payload | Fields |
| --- | --- |
| `Heartbeat` | `sessionId: UInt32` |
| `ReleaseAll` | `sessionId: UInt32`<br>`reason: ReleaseReason` |
| `StatusRequest` | `empty payload; requestId is in the control frame` |
| `StatusResponse` | `same fields as Section 1 StatusResponse` |
| `ScanWifi` | `empty payload` |
| `ScanWifiResult` | `ssid: String`<br>`rssi: Int8`<br>`security: UInt8` |
| `ScanWifiDone` | `resultCount: UInt8` |
| `SetWifiCredentials` | `ssid: String`<br>`password: String` |
| `WifiConnectResult` | `success: Bool`<br>`reason: UInt8` |
| `ListSavedWifi` | `empty payload` |
| `SavedWifiEntry` | `ssid: String` |
| `SavedWifiDone` | `resultCount: UInt8` |
| `ForgetWifi` | `ssid: String` |
| `ResetPairing` | `reason: UInt8` |
| `Error` | `code: UInt16`<br>`relatedRequestId: UInt32`<br>`message: String` |

### 4.6 Ownership And Mode Isolation

- BLE HID input is accepted only when `activeMode == ble` and BLE ownership is granted.
- Wi-Fi-owned ESP ignores BLE HID input packets.
- BLE setup, status, ownership, heartbeat, and authenticated release-all safety paths may run while BLE is not the HID owner.
- Authenticated `ReleaseAll` is accepted as a safety message even if Wi-Fi owns HID.
- Heartbeat timeout in BLE Mode triggers release-all and clears BLE ownership.
- Exact timeout values are specified in the release-all/heartbeat task.
- BLE has no `inputEpoch`; all BLE fallback input/control events share one ordered BLE lane.

### 4.7 Security Rule

- Wi-Fi credentials and HID-driving BLE input require an authenticated app session once pairing exists.
- Unauthenticated clients may only request minimal status and start explicit pairing flows.
- Pairing reset requires an authenticated admin session or a physical/user-confirmed reset flow defined later.
- Exact proof, secret storage, and multi-phone policy are specified in the pairing/security task.

---

## 5. Mode Switching And Ownership State Machine

ESP is the HID ownership authority. iOS may request a mode, but HID input is accepted only after ESP grants ownership for that mode.

### 5.1 Ownership State

ESP tracks one active owner:

```text
NoOwner
BleOwner(sessionId, phoneId)
WifiOwner(sessionId, phoneId, tcpEndpoint, udpToken, inputEpoch)
```

`phoneId` is the long-term pairing identity from the Pair flow.

Availability is separate from ownership:

```text
bleConnected: Bool
wifiAvailable: Bool
tcpOwnerAlive: Bool
udpGateValid: Bool
```

iOS tracks transport availability separately from routed input mode:

```text
bleAvailable: Bool
wifiPathAvailable: Bool
localNetworkAllowed: Bool
bonjourReachable: Bool
tcpConnected: Bool
activeMode: none | ble | wifi
inputIdle: Bool
```

Lifecycle labels from the task plan map to this model:

| Label | Formal state |
|---|---|
| BLE setup | `NoOwner` + iOS pairing/provisioning over BLE |
| BLE active | `BleOwner` + `activeMode == ble` |
| Wi-Fi connecting | intentional handoff toward `WifiOwner` |
| Wi-Fi active | `WifiOwner` + `activeMode == wifi` |
| Reconnecting | failure recovery while trying to restore Wi-Fi ownership |
| Fallback | BLE recovery or `BleOwner` after Wi-Fi is unavailable |

### 5.2 Ownership Rules

- Only the active ESP owner may drive HID.
- Inactive transports may connect, discover, authenticate, request status, perform setup, negotiate ownership, send heartbeat, and send authenticated release-all safety commands.
- Candidate TCP may exist while BLE owns HID, but it cannot drive HID or validate UDP until Wi-Fi ownership is granted.
- ESP grants `ClaimOwner` only when `activeOwner == NoOwner`.
- ESP rejects `ClaimOwner` while another owner is active.
- Same-phone atomic owner transfer is deferred; v1 uses explicit release then claim.
- Wi-Fi UDP is accepted only while `activeOwner == WifiOwner` and the UDP gate in Section 3 passes.

### 5.3 Wi-Fi Usability

The state machine does not compare SSIDs.

Wi-Fi Mode is usable only when:

```text
iOS Wi-Fi path is available
iOS Local Network permission allows discovery/connection
ESP is reachable by Bonjour/TCP
TCP ownership is granted
UDP gate is valid
```

Rules:

- Any Wi-Fi path loss or TCP owner loss invalidates current Wi-Fi ownership.
- Any Wi-Fi availability only creates a chance to rediscover ESP and claim fresh ownership.
- Old Wi-Fi ownership never resumes automatically.
- Every Wi-Fi recovery requires a fresh TCP `ClaimOwner`.
- Every new Wi-Fi ownership grant provides a fresh `sessionId`, `udpToken`, and `inputEpoch`.
- iOS resets UDP epoch tracking when it receives Wi-Fi `OwnerResult(granted=true)`.
- A Wi-Fi owner session is healthy only while all usability conditions above hold concurrently.
- Loss of any Wi-Fi usability condition makes the session unhealthy and triggers failure recovery.
- ESP must not intentionally roam while a healthy Wi-Fi owner session exists.
- ESP may try saved Wi-Fi profiles only when no healthy Wi-Fi owner exists or user starts setup/recovery.

### 5.4 Transition Classes

Intentional switches happen while the current mode is healthy:

```text
user requests Wi-Fi
user requests BLE
automatic BLE -> Wi-Fi upgrade
```

Intentional switches require idle input.

Failure recovery happens because the current mode is broken:

```text
iOS Wi-Fi path lost
ESP Wi-Fi lost
TCP disconnected
owner heartbeat timed out
BLE disconnected while BLE owns HID
```

Failure recovery must not wait for idle. It immediately blocks old input, clears local queues, attempts release-all through any surviving path, and enters fallback/recovery.

Failure recovery is not an intentional mode switch. The idle requirement applies only to intentional switching.

### 5.5 Idle And SwitchingMode

Input is idle when:

```text
no active touch gesture
buttons == 0
no key combo currently being submitted
no wheel pending
local motion queues are clear or discarded
```

The latest key combo must have been written to its transport before input is considered idle.

During intentional switching:

```text
InputRouter enters SwitchingMode
new HID input is dropped, not queued
current owner receives ReleaseAll
handoff waits for ReleaseAll delivery result or bounded timeout
current owner is released
target owner is claimed
InputRouter resumes only after OwnerResult(granted=true)
```

Exact release-all timeout values are defined in the release-all/heartbeat task.

Intentional switches wait for `inputIdle` indefinitely from the state machine perspective. iOS UI may offer cancel; cancel leaves current ownership untouched.

### 5.6 Intentional Handoff With Rollback

BLE -> Wi-Fi:

```text
wait for inputIdle
block new HID input
send BLE ReleaseAll
send BLE ReleaseOwner
open or use candidate TCP
Hello -> Auth -> ClaimOwner(wifi)
if granted:
  activeMode = wifi
  start TCP heartbeat
  enable UDP motion
else:
  try ClaimOwner(ble)
  if granted: activeMode = ble
  else: activeMode = none
```

Wi-Fi -> BLE:

```text
wait for inputIdle
block new HID input
stop UDP motion
send TCP ReleaseAll
release/close Wi-Fi owner session
send BLE ClaimOwner
if granted:
  activeMode = ble
  start BLE heartbeat
else:
  try ClaimOwner(wifi) if still reachable
  if granted: activeMode = wifi
  else: activeMode = none
```

Wi-Fi has no explicit `ReleaseOwner` message. iOS releases Wi-Fi ownership by sending TCP `ReleaseAll` and closing the TCP owner connection; ESP clears `WifiOwner` on TCP close.

If both target and rollback ownership fail, iOS enters no-owner recovery/setup state.

During intentional handoff, ESP briefly transitions through `NoOwner` between old-owner release and new-owner grant. This is acceptable for v1; multi-phone contention UX is deferred.

### 5.7 Failure Recovery

Both sides clean up independently. iOS attempts release-all through any surviving authenticated channel; ESP releases HID locally when it detects owner failure. Cross-side notification is best-effort, and brief iOS/ESP state mismatch during failure recovery is acceptable.

iOS Wi-Fi path lost or TCP disconnected:

```text
block new Wi-Fi HID input
stop UDP immediately
clear local motion/control queues
attempt TCP ReleaseAll if still possible
attempt authenticated BLE ReleaseAll if BLE is available
clear local Wi-Fi active state
claim BLE owner if available
otherwise enter no-owner recovery
```

ESP Wi-Fi lost:

```text
release-all
stop UDP motion
clear WifiOwner
reject UDP
stop TCP control
keep BLE available for fallback/recovery
```

ESP Wi-Fi owner heartbeat timeout:

```text
release-all
stop UDP motion
clear WifiOwner
reject UDP
close TCP control
keep Wi-Fi services available for fresh ClaimOwner
```

ESP BLE owner heartbeat timeout:

```text
release-all
clear BleOwner
keep BLE available for fresh ClaimOwner/setup
```

ESP Wi-Fi available:

```text
start Wi-Fi services
advertise by Bonjour/mDNS
accept TCP connection attempts
do not restore old Wi-Fi ownership automatically
```

BLE disconnected while BLE owns HID:

```text
release-all
clear BleOwner
enter no-owner recovery
```

BLE disconnected while Wi-Fi owns HID:

```text
keep Wi-Fi Mode active if Wi-Fi owner session is healthy
mark BLE fallback/setup unavailable
attempt BLE rediscovery when appropriate
```

ResetPairing:

```text
release-all
clear any active owner
clear stored pairing
enter NoOwner
iOS must pair again before future ClaimOwner
```

### 5.8 Mode Selection Policy

In NoOwner recovery, iOS keeps available transports in discovery/setup mode, may show setup UI, and routes no HID input until an owner claim succeeds.

Default v1 policy:

```text
Wi-Fi usable and owner granted -> Wi-Fi Mode
Wi-Fi unavailable/rejected     -> BLE Mode if BLE owner can be granted
Neither owner available        -> NoOwner recovery/setup
```

Auto-upgrade from BLE to Wi-Fi is allowed only through intentional switching and only when input is idle. Auto-fallback from Wi-Fi to BLE is allowed immediately during failure recovery.

Auto-upgrade probes may run when iOS observes Wi-Fi path availability, Bonjour discovery, or explicit user request. Probes must not interrupt active BLE input.

BLE may remain connected during Wi-Fi Mode for fallback/setup/status. ESP rejects BLE HID input while Wi-Fi owns HID; authenticated release-all remains available as a safety path.

### 5.9 Non-Goals

- Exact heartbeat intervals and timeout values.
- Final onboarding or error copy.
- Multi-phone conflict UX.
- Same-phone atomic owner transfer.
- Advanced SSID/BSSID/router identity handling.
- ESP hotspot/direct mode.
