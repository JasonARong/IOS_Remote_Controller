# Performance Findings

Status: Current performance baseline and historical findings.

Canonical production contract: `docs/Production_Transport_Spec.md`.
Canonical execution plan: `docs/tasks.md`.
Related motion POC: `docs/reference/UDP_Motion_Findings.md`.
Raw evidence: `docs/reference/debug_logs.md`.

Use this file to understand smoothness and heat decisions. Do not treat it as a wire-protocol contract.

---

## 1. Current Baseline

Smoothness and heat are acceptable enough to continue product implementation.

Do not block transport, setup, pairing, or fallback work on further cursor tuning unless a minimum gate regresses.

---

## 2. Proven Working

- Wi-Fi UDP motion plus TinyUSB HID is the preferred smooth cursor path.
- ESP USB HID is healthy when Serial shows `mounted=yes`.
- UDP sender should be active-only, not a permanent background timer.
- Release/feel tests should run with movement diagnostics and Serial spam disabled.
- Disabling the random matrix animation stops idle heat buildup.
- The phone cools again after returning to idle, so there is no known runaway idle loop.

---

## 3. Problems Identified

### Smoothness

- BLE GATT motion is uneven and should be treated as fallback-quality cursor motion.
- Wi-Fi UDP is smoother, but not native-perfect.
- Circle motion reveals jitter more clearly than straight-line motion.
- Further smoothing depends on finger noise, iOS touch delivery, UDP scheduling, HID cadence, host cursor behavior, and UI render load.

### Heat

- Main idle heat source was `DynamicMatrixViewModel` running a 60Hz random animation over 336 circles.
- Active heat remains during heavy finger movement.
- Active heat likely comes from touch processing, UDP sending, pointer filtering, and visual updates during interaction.

### Setup Fragility

- Hardcoded ESP IP breaks when DHCP assigns a new address.
- Hardcoded Wi-Fi credentials and lab IPs are POC-only.

---

## 4. Accepted Limits

- Cursor does not need to be native-perfect before product architecture work resumes.
- Active use may create mild heat, as long as heat falls after idle.
- BLE Mode remains fully viable, but cursor smoothness is lower than Wi-Fi Mode.
- Extra smoothness tuning is expected to be trial-heavy and should wait until the production transport/UI shape is stable.

---

## 5. Minimum Gates

Performance work must be reopened immediately if any gate regresses:

- No idle heat buildup.
- Cursor usable for sustained normal use.
- No delayed glide after finger stop.
- No stuck mouse buttons or keyboard keys.
- No obvious low-FPS cursor during normal use.
- Release build feels better than diagnostic/debug runs.

---

## 6. Current Defaults For Feel Tests

iOS:

```swift
RuntimeDiagnostics.movementPipeline == false
RuntimeDiagnostics.transportStateLogs == false
RuntimeDiagnostics.periodicBlePacketStats == false

AppRuntimeConfig.WifiMotion.schedulingMode == .accumulator125Hz
AppRuntimeConfig.WifiMotion.pointerDtMode == .clamped90Hz
AppRuntimeConfig.PointerPath.smoothingMode == .oneEuroLight
AppRuntimeConfig.DisplayLink.pauseWhenIdle == true
AppRuntimeConfig.DynamicMatrix.enableRandomAnimation == false
```

ESP:

```cpp
#define ENABLE_MOVEMENT_DIAGNOSTICS 0
```

Run feel tests as Release-style builds when possible. Xcode debugger and console output can distort heat and smoothness.

---

## 7. Deferred Optimization

Defer unless a minimum gate regresses:

- Further pointer filter tuning.
- Active heat reduction during heavy movement.
- UI render optimization during touch.
- UDP rate experiments above or below 125Hz.
- Matrix visual redesign or low-rate animation.

Recommended product approach:

1. Keep the current acceptable baseline.
2. Build the production transport and setup flows.
3. Retune smoothness and heat after the real Wi-Fi/BLE/TCP/UDP architecture is in place.
