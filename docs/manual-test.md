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

Source checks:

```bash
python3 ESP/ESP_Bridge_Production/test_step_3_7.py
```

Arduino compile:

```bash
"/Applications/Arduino IDE.app/Contents/Resources/app/lib/backend/resources/arduino-cli" compile --fqbn esp32:esp32:esp32s3 ESP/ESP_Bridge_Production
```

Hardware smoke:

1. Upload `ESP/ESP_Bridge_Production` to the ESP32-S3.
2. Reset the ESP and wait for Serial to print `ESP_Bridge_Production ready`.
3. Find the ESP IP in the Serial diagnostics line.
4. List saved Wi-Fi profile hooks:

```bash
python3 ESP/ESP_Bridge_Production/tools/tcp_control_client.py ESP_IP list-saved-wifi
```

5. Exercise a not-found forget path:

```bash
python3 ESP/ESP_Bridge_Production/tools/tcp_control_client.py ESP_IP forget-wifi "__missing_test_ssid__"
```

6. Exercise pairing reset:

```bash
python3 ESP/ESP_Bridge_Production/tools/tcp_control_client.py ESP_IP reset-pairing
```

Expected:

- `HelloAck` reports firmware `esp-production-3.7`.
- `HelloAck` device ID is stable across ESP reset.
- `list-saved-wifi` returns a `SetupResult` with a count and SSID list.
- `forget-wifi "__missing_test_ssid__"` returns `success=False` without crashing.
- `reset-pairing` returns `success=True`, releases ownership, and leaves the ESP able to accept a fresh auth/claim session.

Verification:

- Full setup persistence validation is deferred to Step 7.

Result:

- Notes: `test_step_3_7.py` passes. Arduino compile for `ESP/ESP_Bridge_Production` succeeds. Hardware smoke passed on `192.168.3.228`: `HelloAck` reported firmware `esp-production-3.7`, capabilities `0x000020ff`, and device ID `ESP3-F01005BA2010`; after ESP reset, `HelloAck` reported the same device ID, proving the identity persisted across reboot. `list-saved-wifi` returned `SetupResult command=1 success=True message=saved wifi profiles count=0 ssids=[]`. `forget-wifi "__missing_test_ssid__"` returned `SetupResult command=2 success=False message=wifi profile not found`. `reset-pairing` returned `SetupResult command=3 success=True message=pairing identity cleared`. Each helper run completed Hello/Auth/ClaimOwner successfully before the setup command.
- Decision: pass

### Task 3.8: BLE Fallback And Setup/Status

Manual tests:

Source checks:

```bash
python3 ESP/ESP_Bridge_Production/test_step_3_8.py
```

Arduino compile:

```bash
"/Applications/Arduino IDE.app/Contents/Resources/app/lib/backend/resources/arduino-cli" compile --fqbn esp32:esp32:esp32s3 ESP/ESP_Bridge_Production
```

Hardware smoke:

1. Upload `ESP/ESP_Bridge_Production` to the ESP32-S3.
2. Open Serial Monitor at `115200` and wait for `ESP_Bridge_Production ready`.
3. Open nRF Connect and connect to `ESP_MouseBridge`.
4. Find service `00001234-0000-1000-8000-00805f9b34fb`.
5. Find characteristic `0000abce-0000-1000-8000-00805f9b34fb`. This is the ESP response/notify channel.
6. Tap the down-arrow button on the `0000abce...` row to enable notifications. ESP replies appear as `Last Read` on this row.
7. Find characteristic `0000abcd-0000-1000-8000-00805f9b34fb`. This is the phone-to-ESP write channel.
8. For every write below:
   - Tap the up-arrow button on the `0000abcd...` row.
   - Choose `ByteArray`.
   - Select all old value text and delete it.
   - Paste the command exactly as shown, with no spaces.
   - Set Write Type to `Request`.
   - Tap `Write`.
   - If the screen shakes, check that `ByteArray` is still selected and that the pasted command has no spaces.
9. Pair with phone ID `codex` and proof `secret`.

```text
F201010100000000010D05636F64657806736563726574
```

Expected notification:

```text
F201 0201 0000 0000 0102 0100
```

10. Request status.

```text
F2010802000000000100
```

Expected notification: variable-length `StatusResponse` starting with:

```text
F201 0902 0000 0000 01
```

11. Claim BLE owner.

```text
F2010303000000000100
```

Expected notification: `OwnerResult granted=true`, followed by 4 `sessionId` bytes. Copy those last 4 bytes for heartbeat/release-owner.

```text
F201 0403 0000 0000 0106 0100 <sessionIdLE>
```

Example: if nRF shows `F201 0403 0000 0000 0106 0100 C727 640F`, then `<sessionIdLE>` is `C727640F`.

12. Send BLE heartbeat. Replace `<sessionIdLE>` with the 4 little-endian session bytes copied from `OwnerResult`.

```text
F2010604000000000104<sessionIdLE>
```

Expected: no BLE notification. Serial should show `owner: kind=ble ... hb=...ms left`. After a fresh claim or heartbeat, `hb` should be near `600000ms left`.

13. Send one legacy debug mouse packet.

```text
A101000040000000
```

Expected: no BLE notification. The cursor should move.

14. Send one legacy key combo packet for Escape.

```text
F10118
```

Expected: no BLE notification. Escape should send once and no key should stay held.

15. If more than 8 minutes passed since the previous heartbeat, send the heartbeat frame again.
16. List saved Wi-Fi profiles.

```text
F2010F05000000000100
```

Expected notification: zero or more `SavedWifiEntry` notifications, then `SavedWifiDone`. If the count is zero:

```text
F201 1105 0000 0000 0101 00
```

17. Exercise safe forget-missing-SSID path.

```text
F2011206000000000116155F5F6D697373696E675F746573745F737369645F5F
```

Expected notification:

```text
F201 1506 0000 0000 011A 1200 0716 7769 6669 2070 726F 6669 6C65 206E 6F74 2066 6F75 6E64
```

18. Request ESP-visible Wi-Fi scan.

```text
F2010A07000000000100
```

Expected notification: zero or more `ScanWifiResult` notifications starting with `F201 0B07 0000 0000 01`, followed by `ScanWifiDone` starting with:

```text
F201 0C07 0000 0000 0101
```

Final expected Serial check: BLE counters show accepted HID and control frames without malformed growth.

Mode isolation check:

1. Release BLE owner before claiming Wi-Fi. Replace `<sessionIdLE>` with the BLE owner session bytes.

```text
F2010508000000000105<sessionIdLE>03
```

Expected: no BLE notification.

2. On the Mac, from the repo root, claim Wi-Fi ownership with the same `codex` / `secret` identity used in the BLE pair step, and keep it alive for 2 minutes:

```bash
python3 ESP/ESP_Bridge_Production/tools/tcp_control_client.py 192.168.3.228 --phone-id codex --proof secret claim --keepalive 120
```

Expected terminal output includes `AuthResult accepted=True` and `OwnerResult granted=True`. Keep the command running for the next step.

If `OwnerResult granted=False reason=1`, the ESP already has an owner. Reboot the ESP, reconnect nRF, and restart this mode-isolation section.

Expected Serial while the helper is running: `owner: kind=wifi ... hb=...ms left`. It should not hit `TCP control client timeout: idle` during this 2-minute check.

3. While the TCP helper is still running, send the legacy BLE mouse packet again through nRF Connect on `0000abcd...`.

```text
A101000040000000
```

Expected: no cursor movement. Serial BLE line increments `hidIgnored`.

4. While Wi-Fi still owns HID, send authenticated BLE safety release-all with `sessionId = 0`.

```text
F20107090000000001050000000005
```

Expected: no BLE notification. Serial increments `releaseAll` but does not clear healthy Wi-Fi ownership.

Reset pairing check:

1. Run this last because it clears BLE auth/pairing and any active owner.

```text
F201130A00000000010105
```

Expected notification:

```text
F201 150A 0000 0000 011C 1301 0018 7061 6972 696E 6720 6964 656E 7469 7479 2063 6C65 6172 6564
```

Expected Serial: increments `releaseAll` and returns to `owner: kind=none`.

Verification:

- Pair/status/owner/heartbeat, BLE cursor, BLE Escape, saved Wi-Fi list, forget-missing-SSID, Wi-Fi scan, Wi-Fi-owner mode isolation, authenticated BLE safety release-all, and reset-pairing owner clear pass on hardware.
- Full app-level BLE fallback validation remains in Step 7.3.

Result:

- Notes: Source checks and Arduino compile pass for `esp-production-3.8`; hardware BLE validation passed on `192.168.3.228`.
- Decision: Close Step 3.8.

Debugging notes:

- nRF Connect write values must be `ByteArray`, `Request`, and pasted with no spaces. If the screen shakes, nRF rejected the value locally.
- nRF displays notifications as 4 hex digits plus a space. Expected values in this section use that display format.
- Four hex digits are two bytes. One byte is two hex digits.
- BLE auth is connection-local. If nRF disconnects/reconnects, send the Pair frame again before authenticated commands such as safety release-all.
- Successful BLE safety release-all sends no BLE response. Confirm it by Serial: `ble framesRx` increments, `releaseAll` increments, and a healthy Wi-Fi owner remains `owner: kind=wifi`.
- TCP helper auth must match the BLE pairing identity. For this manual test, use `--phone-id codex --proof secret`.
- The hardware TCP path may return legacy one-byte results. In helper output, `AuthResult ... legacy=reason-only` and `OwnerResult ... legacy=sessionless` are acceptable when `reason=0`.
- During manual bring-up, both owner heartbeat and TCP idle timeout are intentionally long (`600000ms`) so nRF/Serial checks do not race the timeout. These values are not release-ready production tuning; revisit them before shipping.

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
