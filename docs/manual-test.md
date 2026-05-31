# Manual Test Guide

Status: Reusable validation checklist for firmware/app implementation slices.

Canonical contract: `docs/Production_Transport_Spec.md`.
Current slice under test: iOS UDP smoothness experiment + `ESP/ESP_Bridge_TinyUSB.ino`.

Use this file after every transport/HID implementation slice. Add new slice sections instead of deleting old ones.

---

## 1. Required Hardware And Software

- ESP32-S3 board.
- USB data cable connected from ESP32-S3 to the computer being controlled.
- Arduino IDE or Arduino CLI.
- ESP32 board package installed.
- Adafruit TinyUSB Library installed.
- iPhone app available for UDP motion testing when needed.

Arduino board settings:

```text
Board: ESP32S3 Dev Module
USB Mode: USB-OTG (TinyUSB)
USB CDC On Boot: Enabled
USB Firmware MSC On Boot: Disabled
USB DFU On Boot: Disabled
Upload Mode: UART0 / Hardware CDC
CPU Frequency: 240MHz (WiFi)
```

---

## 2. Build Test

Run from repo root:

```bash
"/Applications/Arduino IDE.app/Contents/Resources/app/lib/backend/resources/arduino-cli" compile \
  --fqbn esp32:esp32:esp32s3:USBMode=default,CDCOnBoot=cdc,MSCOnBoot=default,DFUOnBoot=default \
  --build-path /private/tmp/esp_bridge_production_build \
  ESP/ESP_Bridge_Production
```

Pass:

- Compile exits successfully.
- No missing type/function errors.

Fail:

- Any compile error.
- Wrong board target, especially non-S3 target or non-TinyUSB USB mode.

---

## 3. Upload And Boot Test

1. Open `ESP/ESP_Bridge_Production/ESP_Bridge_Production.ino`.
2. Confirm the Arduino settings from Section 1.
3. Upload the sketch.
4. Open Serial Monitor at `115200`.
5. Reset the ESP.

Expected Serial output contains:

```text
Initializing TinyUSB HID Mouse
TinyUSB HID mounted=yes
Initializing UDP motion POC
UDP motion listening on <ESP_IP>:4210
ESP_Bridge_Production ready
```

Pass:

- Serial reaches `ESP_Bridge_Production ready`.
- `mounted=yes`.
- No boot loop.

Fail:

- `mounted=no` after repeated resets with a known data cable.
- ESP repeatedly resets.
- UDP listener never starts when Wi-Fi credentials are valid.

---

## 4. USB HID Enumeration Test

On macOS:

1. Open System Settings.
2. Go to Bluetooth or Keyboard/Mouse related input device pages.
3. Confirm the ESP appears as a USB input device.
4. Move the cursor using the UDP motion test in Section 5.

Pass:

- The computer accepts the ESP as an input device.
- Cursor movement is possible.
- No stuck mouse button or stuck key appears after reset.

Fail:

- Computer does not recognize the ESP as HID.
- Cursor cannot move after UDP packets are sent.
- Any modifier key or mouse button appears stuck.

---

## 5. UDP Motion Smoke Test

Precondition:

- ESP Serial Monitor shows `UDP motion listening on <ESP_IP>:4210`.
- iPhone and ESP are on a reachable local network.
- iOS UDP sender is configured to send to `<ESP_IP>:4210`.

Steps:

1. Launch the iOS app.
2. Move one finger slowly in a diagonal line for 3 seconds.
3. Move one finger quickly left/right for 3 seconds.
4. Stop touching the screen.
5. Observe cursor behavior and ESP logs.

Expected ESP log during movement:

```text
ESP production | UDP rawPkts=<nonzero>/s datagrams=<nonzero>/s subframes=<nonzero>/s
HID ticks=<nonzero>/s mouseReports=<nonzero>/s
```

Pass:

- Cursor moves.
- Slow diagonal movement is continuous, not large discrete jumps.
- Fast movement does not create delayed glide after finger stop.
- `UDP malformed` stays near `0`.
- `queueMax` stays bounded.
- `staleDrops` is near `0` during good Wi-Fi.

Fail:

- `UDP rawPkts=0/s` while the iOS app is moving.
- Cursor jumps after finger stop.
- `queueMax` grows continuously.
- Frequent `staleDrops` during normal slow movement.

---

## 6. Release-All Test

This test validates the Step 3A safety primitive.

Current limitation:

- Step 3A mouse-first recovery emits neutral mouse reports.
- Keyboard state is cleared internally, but keyboard HID report emission is deferred until the composite descriptor is reintroduced and verified.

Temporary edit:

```cpp
#define HID_RELEASE_SELF_TEST     1
```

Steps:

1. Compile and upload.
2. Open Serial Monitor at `115200`.
3. Wait at least 6 seconds after boot.
4. Watch for:

```text
releaseAllHidState self-test requested
```

Expected behavior:

- Mouse buttons release.
- Keyboard staging state clears internally.
- Cursor does not jump.
- The device remains connected.

Pass:

- Serial prints the self-test line once.
- No stuck keys/buttons after the self-test.
- Diagnostics show `releaseAll=1` in the next window.

Fail:

- ESP disconnects or resets.
- Any mouse button remains stuck.
- Cursor jumps when release-all runs.

After test:

```cpp
#define HID_RELEASE_SELF_TEST     0
```

---

## 7. Local HID Generator Test

Use this only when UDP/iOS is unavailable.

Temporary edit:

```cpp
#define HID_LOCAL_GENERATOR_TEST  1
```

Steps:

1. Compile and upload.
2. Reset ESP.
3. Do not run the iOS app.
4. Observe cursor movement.

Pass:

- Cursor moves left/right automatically.
- Movement is smooth.
- Diagnostics show HID mouse reports.

Fail:

- No cursor movement.
- Movement is visibly chunky.
- `reportFails` grows continuously.

After test:

```cpp
#define HID_LOCAL_GENERATOR_TEST  0
```

---

## 8. iOS UDP Smoothness A/B Test

Purpose:

- Compare cursor feel against diagnostics without changing ESP firmware.
- Test straight lines and circles. Circles reveal jitter faster.

Use the same ESP firmware, same Wi-Fi, same Mac pointer settings, and same iPhone position for all runs.

### Current Run: Active-Only 125Hz Accumulator + Light Path Filter

Use the current default code:

```swift
// RuntimeConfig.swift
static let schedulingMode: UDPMotionSender.SchedulingMode = .accumulator125Hz
static let pointerDtMode: PointerMotionEngine.DtMode = .clamped90Hz
static let smoothingMode: PointerPathSmoothingMode = .oneEuroLight
static let pauseWhenIdle = true
static let enableRandomAnimation = false
```

Expected log label:

```text
experiment: udpMode=accumulator125Hz pointerDt=clamped90Hz pointerFilter=oneEuroLight
```

Note: the current default no-diagnostics feel test disables this log. Set `RuntimeDiagnostics.movementPipeline = true` only when collecting timing data.

### Run A: FIFO Baseline Without Path Filter

Edit `RemoteController/RuntimeConfig.swift`:

```swift
static let schedulingMode: UDPMotionSender.SchedulingMode = .fifo250Hz
static let pointerDtMode: PointerMotionEngine.DtMode = .clamped90Hz
static let smoothingMode: PointerPathSmoothingMode = .off
```

Build and run the iOS app.

### Run B: Bounded FIFO Hybrid

Edit `RemoteController/RuntimeConfig.swift`:

```swift
static let schedulingMode: UDPMotionSender.SchedulingMode = .boundedFifo250Hz
static let pointerDtMode: PointerMotionEngine.DtMode = .clamped90Hz
```

Build and run the iOS app.

### Run C: Latest-Wins Sender

Edit `RemoteController/RuntimeConfig.swift`:

```swift
static let schedulingMode: UDPMotionSender.SchedulingMode = .latestWins250Hz
static let pointerDtMode: PointerMotionEngine.DtMode = .clamped90Hz
```

Build and run the iOS app only as a known low-FPS comparison.

### Run D: Bounded FIFO + High-Rate Touch `dt`

Edit `RemoteController/RuntimeConfig.swift`:

```swift
static let schedulingMode: UDPMotionSender.SchedulingMode = .boundedFifo250Hz
static let pointerDtMode: PointerMotionEngine.DtMode = .highRateTouch
```

Build and run the iOS app only after Run B is judged.

### Movement Pattern

For each run:

1. Move slowly in a straight diagonal line for 5 seconds.
2. Move quickly in a straight horizontal line for 5 seconds.
3. Move slowly in a circle for 5 seconds.
4. Move quickly in a circle for 5 seconds.
5. Stop abruptly and confirm there is no delayed glide.

Record:

- Subjective feel: best / acceptable / worse.
- `experiment: udpMode=... pointerDt=... pointerFilter=...`
- `UDP: datagrams`, `subframes`, `staleDrops`, `maxBatch`, `maxPending`.
- `probe UDP: queueAge`, especially counts above `12ms`.
- `probe raw`, `probe pointer`, and `probe UDP` turn histograms.
- ESP `mouseReports/s`, `queueMax`, `staleDrops`, and `lateMax`.

Best candidate:

- Feels smoother in circles.
- Has lower UDP `queueAge`.
- Does not increase delayed glide after stop.
- Does not make pointer speed uncontrollable.

---

## 9. No-Diagnostics Release-Style Feel Test

Purpose:

- Check cursor feel without touch-path locks, histograms, or repeated console output.

Required defaults:

```swift
// RuntimeConfig.swift
RuntimeDiagnostics.movementPipeline == false
RuntimeDiagnostics.transportStateLogs == false
RuntimeDiagnostics.periodicBlePacketStats == false
AppRuntimeConfig.WifiMotion.schedulingMode == .accumulator125Hz
AppRuntimeConfig.WifiMotion.pointerDtMode == .clamped90Hz
AppRuntimeConfig.PointerPath.smoothingMode == .oneEuroLight
AppRuntimeConfig.DisplayLink.pauseWhenIdle == true
AppRuntimeConfig.DynamicMatrix.enableRandomAnimation == false
```

```cpp
// ESP_Bridge_TinyUSB.ino
#define ENABLE_MOVEMENT_DIAGNOSTICS 0
```

Steps:

1. Upload `ESP/ESP_Bridge_TinyUSB.ino`.
2. Confirm startup prints show `TinyUSB HID mounted=yes` and `UDP motion listening`.
3. Build and run the iOS app.
4. Stop watching the Xcode console during movement.
5. Test straight lines and circles for at least 30 seconds.

Pass:

- Cursor movement feels materially smoother than Log 6 runs.
- No delayed glide after finger stop.

Fail:

- Circle movement still visibly jitters.
- Cursor still feels low-FPS or bursty.

Record only subjective results unless diagnostics are re-enabled.

---

## 10. Result Record Template

Record one result block per test run:

```text
Date:
Git commit / branch:
Sketch:
Board:
Arduino ESP32 package version:
Adafruit TinyUSB version:
USB settings:
Wi-Fi SSID:
ESP IP:
iPhone model / iOS version:

Build: pass/fail
Boot: pass/fail
USB HID enumeration: pass/fail
UDP motion: pass/fail
Release-all: pass/fail
Local generator: pass/fail/not run

Key logs:

Observed issues:

Decision:
```

Decision values:

```text
pass
fail
pass with known limitation
blocked by environment
```
