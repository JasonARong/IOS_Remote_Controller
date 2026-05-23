# Production Transport Architecture

Status: High-level architecture context.

Canonical implementation contract: `docs/Production_Transport_Spec.md`.
Canonical execution plan: `docs/tasks.md`.
POC evidence: `docs/UDP_Motion_Findings.md` and `docs/debug_logs.md`.

Use this document for product direction and architecture rationale. If this document conflicts with `Production_Transport_Spec.md`, the spec wins.

This document records the production transport decisions after the UDP motion POC proved that **same-Wi-Fi UDP + TinyUSB** can produce smooth, mouse-like cursor movement. It should be read together with `docs/UDP_Motion_Findings.md`, which explains the motion-specific POC results and timing constraints.

The goal here is to define the product architecture clearly enough to guide implementation without prematurely specifying every packet, timeout, storage key, or onboarding screen.

---

## 1. Product Direction

The production app will support two user-visible connection paths:

1. **Wi-Fi Mode**
   - Preferred mode when available.
   - Provides smooth cursor movement.
   - Requires ESP Wi-Fi setup and iOS Local Network permission.
   - Uses the TinyUSB firmware path proven by the UDP motion POC.

2. **BLE Mode**
   - Complete fallback mode.
   - Supports the full feature set, but cursor movement is expected to be less smooth.
   - Covers unsupported Wi-Fi environments, setup, recovery, and users who do not want Wi-Fi setup.

ESP hotspot/direct mode is intentionally deferred. It may become a future feature, but adding it now would create too many modes and increase setup complexity.

---

## 2. High-Level Transport Direction

Packet formats, ownership rules, release-all behavior, heartbeat behavior, and capability negotiation are defined in `docs/Production_Transport_Spec.md`.

### Wi-Fi Mode

Wi-Fi Mode uses two transport lanes:

| Input / Command Type | Transport | Reason |
|----------------------|-----------|--------|
| Cursor motion | UDP | Loss-tolerant, high-rate, preserves the proven smooth motion pipeline |
| Mouse buttons / drag state | TCP | Must be reliable and ordered |
| Keyboard combos / system commands | TCP | Must not be dropped or reordered |
| Scroll wheel ticks | TCP | Wheel is tick-based; smooth trackpad-style scroll is not required |
| Settings / session / heartbeat / status | TCP | Control plane must be reliable |

This keeps the user-visible mode simple while avoiding a custom reliable-UDP protocol in the first production version.

### BLE Mode

BLE Mode sends all inputs through BLE:

- cursor movement
- left/right click
- drag
- scroll
- keyboard combos
- system commands
- setup/control commands as needed

BLE Mode is a fully viable alternative, not setup-only. Its drawback is lower cursor smoothness.

---

## 3. Active Mode Ownership

Only one active input mode owns HID at a time:

```text
activeMode = wifi or ble
```

The inactive mode must not send normal input events to HID.

Allowed exceptions:

- setup/provisioning
- heartbeat/status
- release-all safety command
- ownership/session negotiation

This rule prevents split-brain input where BLE and Wi-Fi both try to control the same HID state.

---

## 4. Wi-Fi Session Gate

UDP motion is accepted only while an authenticated TCP control session owns the ESP.

```text
valid TCP owner session -> UDP motion accepted
no valid TCP owner      -> UDP motion ignored
wrong owner/session     -> UDP motion ignored
```

The production gate also checks packet version, source endpoint, `sessionId`, `udpToken`, `inputEpoch`, frame count, and packet length as specified in `docs/Production_Transport_Spec.md`.

This gives the high-rate UDP motion path a safety boundary without adding heavy reliability logic to every motion packet.

The TCP session is responsible for:

- authentication/session ownership
- heartbeat
- mode ownership
- control inputs
- release-all safety
- settings/status exchange

---

## 5. Firmware Direction

Production firmware should be based on the smooth TinyUSB path:

```text
ESP_Bridge_TinyUSB.ino + BLE fallback/control features
```

Do not build production motion on top of the legacy `ESP_Bridge.ino` HID stack.

The motion pipeline from the POC must be preserved:

- Adafruit TinyUSB
- `usb_hid.setPollInterval(1)`
- UDP motion queue
- one motion frame per HID pacer tick
- no drain-all queue coalescing
- `POINTER_SCALE` divide with fractional remainder
- high-rate HID pacer

The old BLE sketch is useful as a source of feature behavior, but the production firmware should be reorganized so BLE, Wi-Fi, HID output, input state, pairing, and diagnostics are not tangled in one giant control flow.

Conceptual firmware modules:

```text
UsbHidOutput
MotionQueue
WifiMotionUdp
WifiControlTcp
BleTransport
InputState
PairingStore
Diagnostics
```

---

## 6. iOS Architecture Direction

iOS should expose one semantic input layer and route events through the active transport.

Conceptual app modules:

```text
InputEvent
InputRouter
WiFiTransport
  - UdpMotionClient
  - TcpControlClient
BleTransport
Pairing / Setup Flow
Connection State Machine
```

The touchpad, keyboard UI, and gesture code should not need to know the low-level transport details.

---

## 7. Wi-Fi Setup Model

ESP Wi-Fi setup is performed over BLE.

Initial setup flow:

```text
App discovers ESP over BLE
ESP scans nearby Wi-Fi networks
ESP returns visible SSIDs to app
User chooses a visible network and enters password
App sends SSID/password to ESP over BLE
ESP stores credentials and joins Wi-Fi
ESP advertises over Bonjour/mDNS
App discovers ESP on Wi-Fi
App opens TCP control session
Wi-Fi Mode becomes active
```

For now, ESP stores Wi-Fi profiles as simple:

```text
SSID + password
```

No BSSID/router identity/mesh heuristics are required in the first version.

### 2.4 GHz Handling

ESP should show only networks it can actually see in its scan results. This naturally filters the setup list to Wi-Fi networks that are viable for the ESP hardware, usually 2.4 GHz.

Do not make regular users reason about 2.4 GHz vs 5 GHz unless setup fails.

### Same Wi-Fi vs Same LAN

The product should not surface this distinction unless communication fails.

If iPhone and ESP are on different SSIDs but can communicate, the user should simply see a working Wi-Fi connection.

If ESP joins Wi-Fi but the app cannot reach it, show a practical error:

```text
Dongle joined Wi-Fi, but this iPhone cannot reach it.
Try another Wi-Fi network or use BLE Mode.
```

Unsupported networks such as captive portals, enterprise Wi-Fi, isolated guest networks, and unusual routers are covered by BLE Mode.

---

## 8. iOS Permissions

Wi-Fi Mode requires iOS Local Network permission.

The app should request/explain this during Wi-Fi setup or Wi-Fi connection, not randomly at launch.

If Local Network permission is denied:

- Wi-Fi Mode should be unavailable or degraded.
- BLE Mode remains available.
- The app should guide the user to Settings if they want Wi-Fi Mode.

Reading the iPhone's current SSID must not be a hard dependency. iOS restricts SSID access. If current SSID is available, the app can use it to preselect the likely network. If not, the user chooses from the ESP scan list.

---

## 9. Pairing And Session Ownership

The ESP should store a device/phone secret when paired through this app.

Product rule:

- An ESP dongle may be paired with different phones over time.
- At runtime, once one iPhone owns an active session, the ESP accepts input only from that iPhone/session.
- Other phones must not be able to send HID input while the dongle is owned.

This requires:

- stored paired-phone identity/secret
- active session owner
- ownership timeout
- clear handling for "dongle already in use"

Detailed crypto/token format, storage layout, reset UX, and multiple-phone UX are deferred. Runtime ownership rules are specified in `docs/Production_Transport_Spec.md`.

---

## 10. Mode Switching Rules

The high-level rule is:

```text
Prefer Wi-Fi Mode when healthy.
Use BLE Mode when Wi-Fi is unavailable, unsupported, not provisioned, or unhealthy.
Intentional switches wait for input idle.
Failure recovery blocks input immediately and does not wait for idle.
```

Wi-Fi should be considered healthy only when:

- ESP is discoverable/reachable on Wi-Fi
- TCP control session is connected and authenticated
- UDP motion gate is valid for accepted packets
- ESP reports USB HID is mounted/ready

BLE should remain available as the complete fallback path.

Switching and failure-recovery state rules are specified in `docs/Production_Transport_Spec.md`. Values still subject to field tuning include:

- heartbeat timeout duration
- reconnect grace period
- number of failed pings before fallback
- BLE-to-Wi-Fi promotion timing

---

## 11. Safety Requirements

The release-all safety behavior is required and specified in `docs/Production_Transport_Spec.md`.

Locked requirements:

- iOS sends release-all when the app backgrounds or becomes inactive.
- ESP auto-releases on heartbeat timeout.
- Mode switching must clear unsafe held state.
- Release-all clears mouse buttons, keyboard keys, scroll/wheel state, motion queues, and HID report state.

This must be implemented before production because stuck mouse buttons or stuck keys are unacceptable.

---

## 12. Deferred Topics

The following remain intentionally deferred after the locked transport spec:

1. **Bonjour/mDNS details**
   - service name
   - TXT fields
   - advertised TCP/UDP ports
   - multiple dongle picker UX

2. **Pairing/security details**
   - token format
   - crypto approach
   - multiple paired phones
   - "dongle in use" behavior

3. **ESP storage schema**
   - Wi-Fi profile storage
   - paired phone secret storage
   - device name
   - factory reset behavior

4. **Field tuning**
   - final heartbeat timeout values
   - reconnect grace periods
   - automatic promotion/fallback timing

5. **ESP hotspot/direct mode**
   - deferred future feature, not part of the current production architecture phase

---

## 13. Architecture Summary

This is a high-level summary. Use `docs/Production_Transport_Spec.md` for implementation details and `docs/tasks.md` for execution order.

```text
Two modes:
  Wi-Fi Mode:
    UDP = cursor motion
    TCP = buttons, keyboard, scroll, settings, session, heartbeat

  BLE Mode:
    BLE = all inputs, complete fallback, less smooth cursor

One owner:
  Only activeMode can drive HID.
  Inactive mode is ignored except setup/status/release-all/ownership.

Wi-Fi gate:
  UDP motion is accepted only while an authenticated TCP control session owns the ESP.

Setup:
  BLE provisions Wi-Fi.
  ESP scans visible SSIDs.
  User selects SSID and enters password.
  ESP stores SSID/password.
  App discovers ESP via Bonjour/mDNS.

Firmware base:
  Preserve TinyUSB smooth motion pipeline.
  Merge BLE fallback/control features into that architecture.
```
