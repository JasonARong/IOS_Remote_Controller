# Manual Test Guide

Status: Current required human validation only.
Canonical contract: `docs/Production_Transport_Spec.md`.
Reference findings: `docs/reference/UDP_Motion_Findings.md` and `docs/reference/Performance_Findings.md`.

This file lists only manual tests needed to close tasks. If a task is not listed, no manual test is currently required.

## Editing Rules

- Keep this file task-first: update `Current Task Closures` before changing test cards.
- List only tests needed to close the current task. Do not add broad regression suites here.
- State the current runnable status explicitly. Do not make the tester infer whether a self-test, transport trigger, device, or feature exists.
- If a test is not runnable now, say `not runnable yet` and name the later trigger/task that will make it runnable.
- Keep each task result to `Notes` and `Decision` only.
- Keep test cards short: `Use for`, optional `Preconditions`, `Steps`, and `Pass`.
- Do not add `Time`, `Fail`, or `Do not run` sections.
- Put historical experiments, diagnostics-heavy procedures, and optional investigations in `docs/reference/`, not here.

## Common Setup

Required:

- ESP32-S3 board.
- USB data cable from ESP32-S3 to the computer being controlled.
- Arduino IDE or Arduino CLI.
- ESP32 board package.
- Adafruit TinyUSB Library.
- iPhone app when testing Wi-Fi UDP motion.

Arduino settings:

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

## Current Task Closures

### Task 3.1: Production Firmware Base

Manual tests:

- Test A: Build And Upload
- Test B: USB HID Mount
- Test C: UDP Cursor Smoke

Result:

- Notes:
- Decision:

### Task 3.2: Shared HID State And Release-All

Manual tests:

- Test A: Build And Upload
- Test B: USB HID Mount
- Test C: UDP Cursor Smoke
- Test D: Release-All Check is not runnable yet.

Verification:

- Structural shared-HID work closes here.
- Release-all runtime proof is deferred until a self-test, TCP trigger, or BLE trigger exists.
- TCP route proof is deferred to task 3.5.
- BLE route proof is deferred to task 3.7.
- Final integration proof is deferred to Step 7.

Result:

- Notes:
- Decision:

### Task 3.3: Reorganize ESP Firmware

Manual tests:

- Test A: Build And Upload
- Test B: USB HID Mount
- Test C: UDP Cursor Smoke

Result:

- Notes: Source split, source checks, Arduino compile, and manual run completed. Firmware runs correctly after reorganization.
- Decision: pass

### Task 3.4: Owner/Session Foundation

Manual tests:

- None for this task.

Verification:

- Source/build checks only.
- Runtime route proof is deferred to tasks 3.5, 3.6, 3.7, and Step 7.4.

Result:

- Notes: `test_step_3_4.py` and `test_step_3_2.py` pass. Arduino compile for `ESP/ESP_Bridge_Production` succeeds. Boot no longer sets `INPUT_MODE_WIFI` without an owner; diagnostics print owner kind/session/epoch/heartbeat. Legacy `0xB2` UDP motion path unchanged.
- Decision: pass

### Task 3.5: TCP Control Server

Goal: prove the ESP can accept a Wi-Fi TCP owner, keep it alive, reject bad sessions, drive reliable HID controls, and clear ownership safely.

Prerequisites:

- ESP is connected over USB to the host computer.
- Mac and ESP are on the same Wi-Fi network.
- Serial Monitor is open at `115200`.
- Firmware has been built and uploaded.

Steps:

1. Wait for Serial Monitor to print `ESP_Bridge_Production ready`.
2. Find the ESP IP in the Serial diagnostics line, for example `ip=192.168.18.123`.
3. Run the safe TCP smoke test from the repo root:

```bash
python3 ESP/ESP_Bridge_Production/tools/tcp_control_client.py ESP_IP smoke
```

Expected:

- Script prints `HelloAck`, `AuthResult accepted=True`, and `OwnerResult granted=True`.
- Script prints `StatusResponse activeMode=wifi`.
- Script prints `Expected bad-session rejection: PASS`.
- Serial Monitor shows `owner: kind=wifi ... hb=...ms left` while the script is active.

4. Run the HID smoke test:

```bash
python3 ESP/ESP_Bridge_Production/tools/tcp_control_client.py ESP_IP hid-smoke
```

Expected:

- Host receives one left click, one wheel tick, one Escape key press, and then release-all.
- Script finishes without `FAIL`.
- Serial Monitor increments `releaseAll`.

5. Run the timeout test:

```bash
python3 ESP/ESP_Bridge_Production/tools/tcp_control_client.py ESP_IP timeout
```

Expected:

- Script claims Wi-Fi ownership, waits without heartbeat, then prints status.
- Serial Monitor shows owner clearing after heartbeat timeout.
- Serial Monitor increments `releaseAll`.

Pass criteria:

- All three helper commands finish without unexpected `FAIL`.
- Safe smoke confirms owner claim, heartbeat/status, and bad-session rejection.
- HID smoke visibly drives and clears HID state.
- Timeout test clears Wi-Fi ownership and runs release-all.

Verification:

- Full Wi-Fi control validation is deferred to Step 7.2.

Result:

- Notes: `test_step_3_2.py`, `test_step_3_4.py`, and `test_step_3_5.py` pass. Arduino compile for `ESP/ESP_Bridge_Production` succeeds. Hardware TCP runtime validation passed against `192.168.18.104`: `smoke` confirmed owner claim/status/heartbeat/bad-session rejection, `hid-smoke` confirmed reliable HID controls and release-all, and `timeout` confirmed heartbeat timeout clears Wi-Fi ownership. Minor hiccup: one first-run `smoke` attempt timed out before `HelloAck`; `nc -vz 192.168.18.104 4211` showed TCP reachable and rerunning the helper passed.
- Decision: pass

### Task 3.6: UDP Owner Gate

Goal: prove production UDP motion is accepted only after TCP Wi-Fi ownership and only when source IP, packet version, `sessionId`, `udpToken`, `inputEpoch`, frame count, and packet length are valid.

Prerequisites:

- Task 3.5 TCP tests pass.
- ESP is connected over USB to the host computer.
- Mac and ESP are on the same Wi-Fi network.
- Serial Monitor is open at `115200`.
- Firmware has been built and uploaded.

Steps:

1. Wait for Serial Monitor to print `ESP_Bridge_Production ready`.
2. Find the ESP IP in the Serial diagnostics line, for example `ip=192.168.18.123`.
3. Run the gated UDP smoke test from the repo root:

```bash
python3 ESP/ESP_Bridge_Production/tools/tcp_control_client.py ESP_IP udp-smoke
```

Expected:

- Script prints `OwnerResult granted=True`.
- Host receives visible cursor motion from the valid UDP burst.
- Script prints invalid UDP probes for bad session, bad token, bad epoch, bad frame count, and old `0xB2` marker.
- Serial Monitor shows accepted UDP datagrams/subframes for the valid burst.
- Serial Monitor shows `gateReject` and/or `malformed` increments for invalid probes.
- Serial Monitor still shows Wi-Fi owner while heartbeats are active.

Pass criteria:

- `udp-smoke` finishes without `FAIL`.
- Cursor moves from valid gated UDP packets.
- Invalid probes do not create extra cursor movement.
- Diagnostics show valid UDP accepted and invalid UDP rejected.

Verification:

- Full mode-isolation validation is deferred to Step 7.4.

Result:

- Notes: `test_step_3_2.py`, `test_step_3_4.py`, `test_step_3_5.py`, and `test_step_3_6.py` pass. Arduino compile for `ESP/ESP_Bridge_Production` succeeds. Hardware `udp-smoke` runtime validation passed on `192.168.3.228`: TCP owner claim/status succeeded, valid gated UDP packets moved the cursor, and invalid probes were sent for bad session, bad token, bad epoch, bad frame count, and old `0xB2` marker. Earlier intermittent TCP/UDP timeouts were traced to the old Wi-Fi network path with severe packet loss.
- Debugging lessons: When ESP Serial shows `TCP tx ... ok=yes` but the Mac client times out, first check network health with `ping` and `nc` before changing protocol code. `arp` helped confirm the target MAC belonged to the ESP, while high packet loss and delayed ping replies pointed to Wi-Fi/AP forwarding instability. A temporary `UDP_RX_TASK_ENABLED=0` isolation build proved UDP polling was not the root cause. After re-enabling UDP RX, `udpRx iters=0/s` in Serial meant the new firmware had not actually been uploaded yet; `udpRx iters=~1000/s` confirms the UDP task is running.
- Decision: pass

### Task 3.7: ESP Persistence Foundation

Manual tests:

- Add persistence/reboot tests when this task is implemented.

Verification:

- Full setup persistence validation is deferred to Step 7.

Result:

- Notes:
- Decision:

### Task 3.8: BLE Fallback And Setup/Status

Manual tests:

- Add BLE fallback and Wi-Fi setup/status tests when this task is implemented.

Verification:

- Full BLE fallback validation is deferred to Step 7.3.

Result:

- Notes:
- Decision:

---

## Test Cards

### Test A: Build And Upload

Use for: 3.1, 3.2, 3.3, 3.5, 3.6

Steps:

1. Open `ESP/ESP_Bridge_Production/ESP_Bridge_Production.ino`.
2. Confirm the Arduino settings from Common Setup.
3. Compile the sketch.
4. Upload the sketch.
5. Open Serial Monitor at `115200`.
6. Reset the ESP.

Pass:

- Compile succeeds.
- Upload succeeds.
- Serial reaches `ESP_Bridge_Production ready`.
- No boot loop.

### Test B: USB HID Mount

Use for: 3.1, 3.2, 3.3, 3.5, 3.6

Steps:

1. Connect the ESP USB cable to the computer being controlled.
2. Reset the ESP.
3. Watch Serial Monitor at `115200`.

Pass:

- Serial shows `Initializing TinyUSB HID`.
- Serial shows `TinyUSB HID mounted=yes`.
- Serial shows `ESP_Bridge_Production ready`.
- Computer accepts the ESP as a USB HID input device.
- No mouse button or keyboard key is stuck after boot.

### Test C: UDP Cursor Smoke

Use for: 3.1, 3.2, 3.3, 3.6

Preconditions:

- ESP Serial shows `UDP motion listening on <ESP_IP>:4210`.
- iPhone and ESP are on a reachable local network.
- iOS `AppRuntimeConfig.WifiMotion.host` is set to `<ESP_IP>`.

Steps:

1. Launch the iOS app.
2. Move one finger slowly in a diagonal line for 3 seconds.
3. Move one finger in a circle for 3 seconds.
4. Move one finger quickly left/right for 3 seconds.
5. Stop touching the screen.

Pass:

- Cursor moves.
- No delayed glide after finger stop.
- ESP diagnostics show nonzero `UDP rawPkts`, `datagrams`, `subframes`, and `mouseReports`.
- `UDP malformed` stays near `0`.
- Queue depth stays bounded.

### Test D: Release-All Check

Use for: 3.2, later tasks that add a release-all trigger.

Current status: Not runnable yet. No production self-test, TCP trigger, or BLE trigger exists in the current task slice.

Steps:

1. Trigger release-all.
2. Watch Serial Monitor for a release-all count or log line.
3. Confirm the computer has no stuck mouse button or keyboard key.
4. Move the cursor again after release-all.

Pass:

- Mouse buttons release.
- Keyboard report is neutral.
- Motion and wheel state are cleared.
- Device stays mounted.
- Cursor still works after release-all.

### Test E: Keyboard HID Smoke

Use for: later tasks that wire keyboard input.

Run only after a transport path or temporary self-test can stage keyboard reports.

Steps:

1. Focus a safe text field.
2. Send a single normal key.
3. Send one modifier combo.
4. Trigger release-all.
5. Type again using the physical keyboard.

Pass:

- Expected key input appears.
- Modifier combo behaves once.
- No modifier remains held after release-all.
