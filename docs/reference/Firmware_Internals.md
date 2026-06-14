# Firmware Internals

Status: Implementation reference for ESP32 production firmware.

Use this document when working on or extending the firmware modules. For protocol contracts see `docs/Production_Transport_Spec.md`. For architecture rationale see `docs/Production_Transport_Architecture.md`.

---

## Overview

The ESP32-S3 acts as a **wireless USB HID bridge**. It receives input from an iOS app over Wi-Fi or BLE and replays it as USB mouse and keyboard events to a Mac or PC — as if a physical wired mouse and keyboard were plugged in.

From the Mac's perspective, the ESP is just a USB peripheral. It has no idea there is a phone involved.

### What the firmware does

```
iPhone  ──── Wi-Fi / BLE ────►  ESP32-S3  ──── USB cable ────►  Mac / PC
  (sends gestures)              (translates)                  (sees HID events)
```

The firmware's job is to receive wireless input, validate it, and forward it to USB as fast and smoothly as possible.

### Two connection modes

**Wi-Fi Mode** (preferred) — uses two protocols simultaneously:
- UDP on port 4210 for cursor motion. UDP is used here because speed matters more than guaranteed delivery; a dropped motion frame just means a slightly less smooth frame, not a broken interaction.
- TCP on port 4211 for everything else (buttons, scroll, keyboard, session management). TCP is used here because these events must never be lost or reordered — a missed "button down" with no "button up" leaves the Mac stuck with a pressed button.

**BLE Mode** (fallback) — uses a custom GATT service when Wi-Fi is unavailable. All input goes through BLE control frames. Cursor motion is less smooth than Wi-Fi because BLE has higher and more variable latency, but all features work.

### Three design principles

1. **One owner at a time.** Only one transport (Wi-Fi or BLE) can drive HID at once. `OwnerSession` enforces this. Without it, two clients could fight over the device and produce garbage input.

2. **Shared buffers, one sender.** All transports write input into shared buffers (`HidState`, `MotionQueue`). Only `HidPacer` is allowed to read those buffers and send USB reports. This keeps the USB output path clean and predictable.

3. **Safety by default.** If the phone disconnects, crashes, or goes silent, the firmware immediately releases all held buttons and keys so the Mac is never left in a stuck state.

### Boot sequence

The order in `setup()` is load-bearing:

```
ensureTinyUsbDeviceStarted()   ← USB stack must start before HID
setupUsbHid()                  ← register HID descriptor with host
resetMotionFrameQueue()        ← clear shared buffers before tasks start
resetSharedHidState()
resetOwnerSession()
setupPersistentStore()         ← load NVS (Wi-Fi profiles, device ID)
setupBleControl()              ← start BLE advertising
startHidPacerTask()            ← FreeRTOS task on core 1, starts immediately
setupUdpMotion()               ← connect Wi-Fi using saved profiles
setupWifiTcpControl()          ← start TCP server on port 4211
startUdpRxTask()               ← FreeRTOS task on core 0, starts last
```

HidPacer starts before Wi-Fi connects so the USB host always gets timely reports even during the Wi-Fi connection delay. If Wi-Fi fails entirely, BLE still works — `setupUdpMotion()` returns false and TCP/UDP are skipped.

### Why UDP for motion and TCP for buttons

| | UDP (motion) | TCP (buttons/keys) |
|---|---|---|
| Delivery | Best-effort, may drop | Guaranteed, ordered |
| Latency | Lower | Slightly higher |
| Drop consequence | One less-smooth frame | Stuck button / key |
| Rate | ~120 packets/sec | Low — only on state change |

A dropped motion packet is invisible to the user. A dropped button-up packet means the Mac thinks the button is still held down until the next report — which could be never. The protocol is designed so each input type uses whichever transport matches its tolerance for loss.

---

## Layer View — How Data Flows

```
┌─────────────────────────────────────────────────────────┐
│                       iOS App                            │
└──────────┬─────────────────┬──────────────────┬─────────┘
           │ UDP :4210        │ TCP :4211         │ BLE GATT
           │ motion only      │ everything else   │ fallback
           ▼                  ▼                  ▼
┌──────────────┐  ┌────────────────────┐  ┌─────────────┐
│  UdpMotion   │  │  WifiTcpControl    │  │  BleControl │
│  (RX task)   │  │  (polled in loop)  │  │  (polled)   │
└──────┬───────┘  └────────┬───────────┘  └──────┬──────┘
       │                   │                      │
       │        ALL THREE check OwnerSession first│
       └──────────────────►▼◄────────────────────┘
                  ┌─────────────────┐
                  │  OwnerSession   │  ← the gatekeeper
                  │  NONE/WIFI/BLE  │    only one owner at a time
                  └────────┬────────┘
                           │ passes → writes allowed
                           ▼
           ┌──────────────────────────────┐
           │          HidState            │  ← shared mutable state
           │  buttons · wheel · keyboard  │    mutex-protected
           │  scaledAccumX/Y · flags      │
           ├──────────────────────────────┤
           │         MotionQueue          │  ← ring buffer (32 frames)
           │    dx/dy + timestamp pairs   │    UDP writes, pacer reads
           └──────────────┬───────────────┘
                          │ every 2ms (FreeRTOS task, core 1)
                          ▼
                  ┌───────────────┐
                  │   HidPacer    │  ← the heartbeat of the system
                  │  drains queue │    assembles USB reports
                  │  reads state  │
                  └───────┬───────┘
                          │
                          ▼
                  ┌───────────────┐
                  │    UsbHid     │  ← TinyUSB, 1ms host poll
                  │  mouse report │
                  │  kbd report   │
                  └───────┬───────┘
                          │ USB cable
                          ▼
                      Mac / PC
```

---

## How Each File Knows Its Role

| File | Owns | Talks to |
|------|------|----------|
| `UsbHid` | TinyUSB device, sending USB HID reports | nobody — bottom of stack |
| `MotionQueue` | Thread-safe ring buffer of `dx/dy` frames | written by `UdpMotion`, read by `HidPacer` |
| `HidState` | All mutable HID staging (buttons/keys/wheel/accumulators) | written by TCP/BLE/UDP, read by `HidPacer` |
| `HidPacer` | 2ms FreeRTOS task — drains queue, sends reports | reads `MotionQueue` + `HidState`, writes `UsbHid` |
| `OwnerSession` | Who currently owns HID | consulted by `UdpMotion`, `WifiTcpControl`, `BleControl` |
| `UdpMotion` | Wi-Fi STA connect + UDP socket | checks `OwnerSession`, writes `MotionQueue` |
| `WifiTcpControl` | TCP server, session handshake, HID control messages | checks `OwnerSession`, writes `HidState`, reads `PersistentStore` |
| `BleControl` | GATT server, BLE control frames + legacy HID | checks `OwnerSession`, writes `HidState`, reads `PersistentStore` |
| `PersistentStore` | NVS flash — Wi-Fi profiles, device ID, pairing | read/written by `WifiTcpControl` + `BleControl` |
| `Diagnostics` | Periodic serial health log | reads `OwnerSession`, `HidState`, `MotionQueue` |
| `Config.h` | All compile-time constants (ports, timeouts, scales, capability bits) | included everywhere |
| `.ino` | Boot sequence + loop polling | calls into all modules |

The critical rule the whole system is built around: **only HidPacer writes to USB. Everyone else writes to shared buffers. HidPacer is the only one allowed to actually send.**

---

## The 3 Concurrent Execution Contexts

The firmware is not one loop — it is three things running simultaneously:

```
Core 0                    Core 1                  Main Thread
──────────────────────    ───────────────────     ──────────────────────
udp-rx task               hid-pacer task           loop()
runs every 1ms            runs every 2ms           runs every 10ms

Receives UDP packets      Reads shared state       Polls TCP messages
↓                         Sends USB reports        Polls BLE messages
writes to MotionQueue     ↑                        Checks heartbeat
writes to HidState        reads from both          timeout
```

They share data safely using mutexes (`portENTER_CRITICAL` / `portEXIT_CRITICAL`). Without mutexes, two cores writing to the same memory simultaneously would corrupt data.

---

## Trace 1: Moving Your Finger (the motion path)

This is the most critical path — it must be fast and smooth.

```
① iOS finger moves
   → iOS sends UDP packet to ESP port 4210
     [0xB3][ver=1][sessionId][udpToken][packetSeq][inputEpoch][frameCount=1][dx][dy]
     21 bytes total

② udp-rx task (Core 0) wakes up, calls pollUdpMotionPackets()
   → reads packet from socket
   → checks 3 basic fields first (fast fail):
       packet[0] == 0xB3?     ← correct marker
       packet[1] == 1?        ← correct version
       packet[16] == 1?       ← exactly 1 motion frame
     if any fail → diag.udpMalformed++ → discard

③ Extracts sessionId, udpToken, inputEpoch from packet bytes
   → calls acceptWifiUdpMotionForOwner(sessionId, udpToken, inputEpoch, senderIP, now)

④ OwnerSession checks ALL 5 conditions in one mutex lock:
       ownerKind == OWNER_WIFI?   ← is Wi-Fi mode active?
       sessionId matches?         ← is this the current session?
       udpToken matches?          ← is this the right token?
       inputEpoch matches?        ← not a replayed/old packet?
       senderIP matches?          ← is this from the right phone?
       heartbeat not expired?     ← is owner still alive?
     if any fail → diag.udpGateRejected++ → discard

⑤ All checks pass → extracts dx, dy from packet bytes 17-20
   → calls stagePointerMotion(dx, dy)
   → which calls enqueueMotionFrame(dx, dy) in MotionQueue

⑥ MotionQueue stores the frame with a timestamp:
       {dx, dy, enqueuedUs=now}
   in a ring buffer (max 32 slots)
   if buffer is full → oldest frame is dropped (keep newest motion)

──── Core 0 is done. Core 1 takes over. ────

⑦ hid-pacer task (Core 1) wakes up every 2ms
   → calls popFreshMotionFrame()
   → MotionQueue checks: is this frame < 48ms old?
       if too old → drop it (stale — would cause a delayed burst)
       if fresh → return the {dx, dy} frame

⑧ HidPacer adds dx, dy into the accumulator:
       hidState.scaledAccumX += dx
       hidState.scaledAccumY += dy

   Why accumulate? iOS sends dx=24 meaning "move 24 pre-scaled units".
   POINTER_SCALE=8 means the actual HID report delta = 24/8 = 3 pixels.
   The remainder (24 - 3*8 = 0 here, but often non-zero) carries forward
   to the next tick so no sub-pixel motion is lost.

⑨ HidPacer divides accumulator by POINTER_SCALE, clamps to [-127, 127]:
       reportDx = scaledAccumX / 8  (e.g. 3)
       scaledAccumX -= 3 * 8        (remainder carries forward)

⑩ Calls sendMouseHidReport(dx=3, dy=0, wheel=0, buttons=0)
   → UsbHid sends a USB HID mouse report over the cable
   → Mac sees cursor move 3 pixels
```

---

## Trace 2: Pressing a Button (the TCP control path)

Buttons use TCP, not UDP, because a missed packet = stuck button forever.

```
① iOS left button pressed
   → iOS sends TCP message: TCP_MSG_BUTTON_STATE
     [magic=0x5243][version=1][type=10][sessionId][payloadLen][buttons=0x01]

② loop() on main thread calls pollWifiTcpControl()
   → WifiTcpControl reads bytes from the open TCP socket
   → parses the frame header: magic, version, type, sessionId, payloadLen

③ Checks sessionId against OwnerSession:
   → acceptWifiTcpHidForOwner(sessionId)
   → OwnerSession: is ownerKind==WIFI and sessionId matches? → yes

④ WifiTcpControl calls stageMouseButtons(buttons=0x01)

⑤ HidState stores it (mutex-protected):
       hidState.currentButtons = 0x01
       hidState.mouseReportPending = true

⑥ Next time hid-pacer task wakes up (≤2ms later):
   → sees mouseReportPending = true
   → reads reportButtons = hidState.currentButtons = 0x01
   → calls sendMouseHidReport(dx=0, dy=0, wheel=0, buttons=0x01)
   → Mac sees left button down

   iOS finger lifts (button released):
   → TCP_MSG_BUTTON_STATE with buttons=0x00
   → same path → stageMouseButtons(0x00) → USB report with buttons=0x00
   → Mac sees button up
```

---

## Trace 3: Heartbeat Timeout (the safety path)

What happens when the phone app crashes or Wi-Fi drops mid-session:

```
① iOS owns the ESP (OWNER_WIFI, sessionId=0xABCD1234)
   → ownerState.heartbeatDeadlineMs = now + OWNER_HEARTBEAT_TIMEOUT_MS

② iOS sends HEARTBEAT every ~500ms
   → WifiTcpControl receives TCP_MSG_HEARTBEAT
   → calls acceptWifiControlAndRefresh(sessionId, nowMs)
   → OwnerSession: refreshOwnerHeartbeat()
   → heartbeatDeadlineMs = now + OWNER_HEARTBEAT_TIMEOUT_MS  ← deadline keeps sliding forward

③ iOS app crashes. No more heartbeats.

④ After the configured timeout, loop() calls checkOwnerHeartbeatTimeout(nowMs)
   → OwnerSession checks: nowMs >= heartbeatDeadlineMs? → YES

⑤ OwnerSession calls releaseAllHidState(RELEASE_REASON_TIMEOUT)
   → HidState: clears EVERYTHING under mutex:
       currentButtons = 0          ← releases any held mouse buttons
       pendingWheel = 0
       keyboardModifiers = 0
       keyboardKeycodes = {0,…,0}  ← releases any held keys
       scaledAccumX = 0
       scaledAccumY = 0
       releaseAllMousePending = true    ← signals pacer to send neutral report
       releaseAllKeyboardPending = true
   → MotionQueue: resets ring buffer (clears all pending motion frames)

⑥ hid-pacer task sees the release-all flags on next 2ms tick
   → sends mouse report:    dx=0, dy=0, wheel=0, buttons=0  ← all buttons up
   → sends keyboard report: modifiers=0, keycodes=all zero  ← all keys up

⑦ Back in checkOwnerHeartbeatTimeout:
   → clears ownerState entirely → ownerKind = OWNER_NONE
   → calls setActiveInputMode(INPUT_MODE_NONE)
   → HidState.activeMode = INPUT_MODE_NONE

   Result: Mac sees everything released. No stuck keys. No stuck clicks.
   ESP is now free for a new owner to claim.
```

---

## Trace 4: First Connection (ownership claim)

```
① iOS opens TCP connection to ESP port 4211

② iOS sends HELLO {protocolVersion=1, phoneId=0xDEADBEEF}

③ WifiTcpControl responds HELLO_ACK:
   → reads deviceId from PersistentStore ("ESP3-F01005BA2010")
   → reads capabilities bitmask from Config.h
   → sends: {deviceId, firmwareVersion="esp-production-3.8", caps=0x3DFF}

④ iOS sends AUTH {pairingProof}

⑤ WifiTcpControl calls validateStoredPairingProof()
   → PersistentStore checks NVS flash: is this proof valid for this phone?
   → yes → sends AUTH_RESULT {success=true}

⑥ iOS sends CLAIM_OWNER

⑦ WifiTcpControl calls claimWifiOwner(phoneId, tcpEndpoint, nowMs)
   → OwnerSession checks: ownerKind == OWNER_NONE? → yes, free
   → generates random sessionId = 0xABCD1234
   → generates random udpToken = 0x5678FEDC
   → sets inputEpoch = 1
   → sets heartbeatDeadlineMs = nowMs + OWNER_HEARTBEAT_TIMEOUT_MS
   → sets ownerKind = OWNER_WIFI
   → calls setActiveInputMode(INPUT_MODE_WIFI) → HidState.activeMode = WIFI

⑧ WifiTcpControl sends OWNER_RESULT:
   {granted=true, sessionId=0xABCD1234, udpToken=0x5678FEDC, inputEpoch=1}

   iOS now has all 3 tokens:
   - sessionId → included in every TCP HID message
   - udpToken  → included in every UDP motion packet
   - inputEpoch → included in every UDP motion packet
```

---

## Module Interaction Summary

```
             WHO WRITES                          WHO READS
             ────────────────────────────────────────────────────
MotionQueue  UdpMotion (udp-rx task)             HidPacer (hid-pacer task)

HidState     WifiTcpControl (loop thread)        HidPacer (hid-pacer task)
  buttons    BleControl     (loop thread)
  keys       OwnerSession   (releaseAll)
  accum      UdpMotion      (via stagePointerMotion)

OwnerSession WifiTcpControl (claim/release/heartbeat)   UdpMotion (gate check)
             BleControl     (claim/release/heartbeat)   WifiTcpControl (gate check)
             loop()         (heartbeat timeout check)   BleControl (gate check)

PersistentStore WifiTcpControl (setup commands)         WifiTcpControl (auth)
                BleControl     (provisioning)           BleControl     (auth)
                                                        UdpMotion (Wi-Fi profiles on boot)

UsbHid       HidPacer only                             USB Host (Mac/PC)
```

---

## Support Modules

**`Config.h`** — single source of truth for all magic numbers. Ports, timeouts, packet sizes, POINTER_SCALE, capability bitmask. Every other module includes it. Changing a value here propagates everywhere without hunting through source files.

**`Diagnostics`** — reads counters from all modules (`udpRawPackets`, `udpGateRejected`, `hidTicks`, `releaseAllCount`, etc.) and prints a serial summary every 3 seconds. Does not write to any shared state — read-only observer.

**`PersistentStore`** — wraps ESP32 NVS (Non-Volatile Storage, survives reboots). Stores up to 5 Wi-Fi profiles, a stable device ID derived from MAC address, and a paired-phone secret. `UdpMotion` reads Wi-Fi profiles at boot to connect. `WifiTcpControl` and `BleControl` read/write profiles and pairing data at runtime via setup commands.

---

## Bring-Up Lessons From Step 3.8

These are practical debugging rules from the BLE fallback/setup hardware validation.

- nRF Connect must write BLE commands as `ByteArray` with `Request`; pasted command bytes should have no spaces. nRF notification display groups bytes as 4 hex digits, but input is safest as one continuous string.
- A successful BLE control command does not always send a response. In particular, authenticated safety `ReleaseAll` is success-by-silence; verify it with Serial counters (`ble framesRx`, `releaseAll`) and owner state.
- BLE authentication is connection-local. If nRF reconnects, pair/auth again before authenticated setup or safety commands.
- Wi-Fi-owner mode isolation is proven by negative evidence: BLE HID packets are received but ignored, the cursor does not move, and `owner: kind=wifi` remains active.
- The TCP helper must use the same stored pairing identity as BLE. For the manual test identity, that means `--phone-id codex --proof secret`.
- Current hardware can emit legacy one-byte TCP `AuthResult`/`OwnerResult` payloads. In that shape, `00` is success. The helper labels this as `legacy=reason-only` or `legacy=sessionless`.
- Manual testing currently uses long owner heartbeat and TCP idle timeouts (`600000ms`) to keep sessions alive while humans copy bytes between nRF and Serial Monitor. These are development-only bring-up defaults. Before real production release, retune them after iOS automatic heartbeat/reconnect behavior is implemented and validated.

---

## Ownership State Machine

`OwnerSession` is a simple state machine with three states. Only the transitions shown are valid — there is no direct WIFI → BLE or BLE → WIFI switch; the current owner must release first.

```
                    ┌─────────────────────────────┐
                    │                             │
             ┌──────▼──────┐                     │
             │  OWNER_NONE │                     │
             └──────┬──────┘                     │
                    │                            │
       ┌────────────┼────────────┐               │
       │ claimWifi  │            │ claimBle       │
       ▼            │            ▼               │
┌────────────┐      │    ┌───────────┐           │
│ OWNER_WIFI │      │    │ OWNER_BLE │           │
└─────┬──────┘      │    └─────┬─────┘           │
      │             │          │                 │
      │  releaseOwner()        │  releaseOwner() │
      │  or heartbeat timeout  │  or heartbeat   │
      └────────────►│◄─────────┘  timeout        │
                    │                            │
                    └────────────────────────────┘
                         back to OWNER_NONE
```

On every ownership change — claim or release — `setActiveInputMode()` is called to mirror the state into `HidState.activeMode`. This keeps diagnostics and transport guards in sync without having to query `OwnerSession` directly.

---

## Sub-Pixel Accumulator — How Smooth Motion Works

The iOS app scales up its motion values before sending (multiply by `POINTER_SCALE=8`) so that fractional movement isn't thrown away. The ESP divides back by 8 before putting the value in a USB report, but keeps the remainder for the next tick.

**Example walkthrough:**

```
iOS sends dx=3  (meaning "0.375 pixels of real movement, scaled up by 8 to 3")

Tick 1:
  scaledAccumX += 3  → scaledAccumX = 3
  reportDx = 3 / 8 = 0   (integer division — nothing to send yet)
  scaledAccumX -= 0 * 8  → scaledAccumX = 3  (remainder kept)

iOS sends dx=3 again

Tick 2:
  scaledAccumX += 3  → scaledAccumX = 6
  reportDx = 6 / 8 = 0   (still not enough)
  scaledAccumX = 6

iOS sends dx=3 again

Tick 3:
  scaledAccumX += 3  → scaledAccumX = 9
  reportDx = 9 / 8 = 1   (now we can send 1 pixel!)
  scaledAccumX -= 1 * 8  → scaledAccumX = 1  (1 unit carried forward)

Mac sees: 0, 0, 1 — smooth accumulation rather than choppy 0,0,0,1,0,0,0,1
```

Without the accumulator, any motion smaller than 1/8th of a pixel would be silently dropped every frame, making slow movements feel quantized and jerky.

---

## Quick-Reference: Call Chains

The most common paths condensed to one line each:

```
UDP motion packet arrives:
  udpRxTask → pollUdpMotionPackets → acceptWifiUdpMotionForOwner → stagePointerMotion → enqueueMotionFrame

HID pacer sends motion:
  hidPacerTask → popFreshMotionFrame → [accumulate] → sendMouseHidReport

TCP button press:
  pollWifiTcpControl → acceptWifiTcpHidForOwner → stageMouseButtons → [hidPacer] → sendMouseHidReport

TCP ownership claim:
  pollWifiTcpControl → claimWifiOwner → setActiveInputMode(WIFI)

Heartbeat timeout:
  loop → checkOwnerHeartbeatTimeout → releaseAllHidState → resetMotionFrameQueue
                                    → clearOwnerLocked → setActiveInputMode(NONE)

BLE button press:
  pollBleControl → acceptBleHidForOwner → stageMouseButtons → [hidPacer] → sendMouseHidReport

Release-all (any path):
  releaseAllHidState → resetMotionFrameQueue + clear HidState + set release flags
                     → [hidPacer] → sendMouseHidReport(0,0,0,0) + sendKeyboardHidReport(0,zeros)
```
