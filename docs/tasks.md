# Tasks

Status: Canonical completion source of truth
Last Updated: 2026-05-31

## Status Legend

- `[ ]` Todo
- `[~]` In Progress
- `[x]` Done
- `[-]` Superseded

## Update Rules

1. Keep completed items (`[x]`) immutable except typo fixes.
2. If rework is needed, add a new item instead of unchecking done work.
3. Mark obsolete planned work as `[-] Superseded`.
4. Edit unfinished items (`[ ]`, `[~]`) as the plan evolves.
5. Record plan changes in the change log.

## Task Closure Rules

1. Close a task only when its scoped output exists and available build/source checks pass.
2. If hardware/manual validation is required, run the matching section in `docs/manual-test.md` or record why it is deferred.
3. Structural tasks may close before future transports are wired, but the task must name the later integration owner.
4. Transport-specific tasks own proving their own route into shared state; Step 7 owns final end-to-end product validation.

## Step 1: Architecture Baseline

Goal: Lock the production transport architecture so implementation can proceed without reopening the core Wi-Fi/BLE mode decisions.
Non-goals: Define exact packet formats, timeout values, storage schema, or final UX copy.
Exit criteria: The architecture document clearly defines Wi-Fi Mode, BLE Mode, active ownership, Wi-Fi session gating, setup direction, and deferred topics.

- [x] 1.1 Record production transport architecture
  Output: `docs/Production_Transport_Architecture.md`
  Non-goals: Implementation plan, packet-level spec, or code changes.
  Check: Document includes UDP motion + TCP control for Wi-Fi, full-feature BLE fallback, one active owner, and TinyUSB firmware direction.

- [x] 1.2 Preserve UDP motion POC findings as the motion reference
  Output: `docs/reference/UDP_Motion_Findings.md`
  Non-goals: Rewrite the POC or re-evaluate BLE motion smoothness.
  Check: Document records the successful TinyUSB + UDP smooth-motion pipeline and locked iOS/ESP constants.

## Step 2: Protocol And State Design

Goal: Convert the architecture into concrete protocol and state-machine contracts before changing major code paths.
Non-goals: Implement transports or UI.
Exit criteria: Wi-Fi, BLE, ownership, heartbeat, release-all, and versioning behavior are specified enough for firmware and iOS implementation.

- [x] 2.1 Define shared input event model
  Output: `docs/Production_Transport_Spec.md` section 1, listing canonical events such as motion subframe, button state, wheel tick, key combo, release-all, heartbeat, setup command, and status response.
  Non-goals: Swift/C++ implementation.
  Check: Every current input feature maps to one canonical event.

- [x] 2.2 Define Wi-Fi TCP control protocol
  Output: `docs/Production_Transport_Spec.md` section 2, defining TCP framing, session flow, core session messages, reliable HID controls, status, setup/admin messages, and error rules.
  Non-goals: UDP motion packet changes.
  Check: Controls are reliable, ordered, and can recover from reconnect without stuck buttons/keys.

- [x] 2.3 Define UDP motion session gate
  Output: `docs/Production_Transport_Spec.md` section 3, defining the production UDP motion packet, TCP owner/session gate, epoch rule, and lossy drop behavior.
  Non-goals: Custom reliable UDP or UDP retries.
  Check: ESP ignores UDP motion when no TCP owner exists or when the sender does not match the active owner.

- [x] 2.4 Define BLE fallback protocol contract
  Output: `docs/Production_Transport_Spec.md` section 4, defining BLE legacy input packets, BLE control frame, ownership, setup/status, and release-all safety behavior.
  Non-goals: Make BLE cursor match Wi-Fi smoothness.
  Check: Cursor, click, drag, scroll, keyboard, system commands, setup, status, and release-all are covered.

- [x] 2.5 Define mode switching and ownership state machine
  Output: `docs/Production_Transport_Spec.md` section 5, defining ESP ownership authority, transport availability, Wi-Fi usability, intentional switching, failure recovery, and ownership handoff rollback.
  Non-goals: Final UI design.
  Check: Intentional switching only occurs when input is idle; failure recovery blocks input immediately; inactive mode cannot drive HID except allowed safety/setup messages.

- [x] 2.6 Define release-all and heartbeat safety contract
  Output: `docs/Production_Transport_Spec.md` section 6, defining release-all cleanup, heartbeat ownership, timeout defaults, background/crash/disconnect behavior, mode-switch cleanup, and ack policy.
  Non-goals: Tune final timeout values from field testing.
  Check: Mouse buttons, keyboard keys, scroll, motion queues, and HID state are cleared by release-all.

- [x] 2.7 Define protocol version and capability negotiation
  Output: `docs/Production_Transport_Spec.md` section 7, defining version layers, TCP negotiation, BLE compatibility checks, capability bits, mode requirements, and partial compatibility behavior.
  Non-goals: Full backward-compatibility matrix.
  Check: App can detect incompatible firmware or missing capabilities before enabling Wi-Fi Mode.

- [x] 2.8 Lock performance baseline and optimization policy
  Output: `docs/reference/Performance_Findings.md` and `docs/Production_Transport_Architecture.md` section 7.
  Non-goals: Solve native-perfect cursor feel or final active-use thermal tuning.
  Check: Idle heat fix, acceptable smoothness baseline, minimum gates, and deferred optimization policy are recorded.

## Step 3: Firmware Foundation

Goal: Reorganize ESP firmware around the proven TinyUSB motion path and the locked transport contract.
Non-goals: Final pairing UX or polished diagnostics.
Exit criteria: Firmware has separated modules or clearly separated sections for HID output, input state, owner/session state, Wi-Fi UDP, Wi-Fi TCP, BLE, setup storage, status/capability reporting, and diagnostics.

Performance baseline: Continue product implementation unless a minimum gate in `docs/reference/Performance_Findings.md` regresses. Do not block Step 3 on further smoothness tuning.

- [x] 3.1 Create production firmware base from TinyUSB POC
  Output: A production ESP sketch/source layout based on `ESP_Bridge_TinyUSB.ino`.
  Non-goals: Build on legacy `ESP_Bridge.ino` as the production base.
  Check: TinyUSB, `setPollInterval(1)`, high-rate HID pacer, one-frame-per-tick motion queue, and pointer-scale remainder behavior are preserved.

- [x] 3.2 Extract shared HID input state and release-all cleanup
  Output: Shared ESP input state for buttons, wheel, keyboard, motion queue, HID staging, active mode, and release-all.
  Non-goals: New input features.
  Check: Shared HID state, HID staging, Wi-Fi motion feed, and release-all cleanup exist in the production firmware.
  Verification owner: This task closes structural shared-HID work. TCP/BLE route proof belongs to tasks 3.5 and 3.7; full regression belongs to Step 7.

- [x] 3.3 Reorganize production ESP firmware into smaller files
  Output: Production firmware split into focused files or clearly isolated modules for config, USB HID output, shared HID state, motion queue, UDP motion, diagnostics, and main task wiring.
  Non-goals: Add TCP, BLE fallback, pairing, or new behavior.
  Check: Firmware behavior is unchanged, source is easier to navigate, and the required manual smoke tests in `docs/manual-test.md` still pass.
  Status: Source split, source checks, Arduino compile, and manual hardware tests A/B/C pass.

- [x] 3.4 Add ESP owner/session foundation
  Output: ESP state for `NoOwner`, `BleOwner`, `WifiOwner`, `sessionId`, `udpToken`, `inputEpoch`, `phoneId`, and owner heartbeat deadline.
  Non-goals: Final crypto format or multi-phone UX.
  Check: ESP can grant one active owner, reject conflicting owners, timeout stale owners, and expose owner state to TCP/BLE code.
  Status: `OwnerSession` module, boot/diagnostics wiring, source tests, and Arduino compile pass; runtime route proof deferred to 3.5–3.7 and Step 7.4.

- [x] 3.5 Add Wi-Fi TCP control server
  Output: ESP TCP server for `Hello`, `Auth`, `ClaimOwner`, heartbeat, reliable HID controls, status, setup/admin, and errors.
  Non-goals: UDP motion transport.
  Check: TCP negotiates version/capabilities, grants Wi-Fi ownership, refreshes owner liveness, handles release-all, and rejects non-owner HID input.
  Status: TCP control module, source checks, Arduino compile, and hardware TCP manual validation pass; a first-run helper timeout was resolved by confirming port `4211` reachability and rerunning.

- [x] 3.6 Gate production UDP motion by active TCP owner
  Output: UDP receiver for production gated motion packets.
  Non-goals: Reliable UDP.
  Check: UDP is accepted only when active mode is Wi-Fi and source endpoint, packet version, `sessionId`, `udpToken`, `inputEpoch`, frame count, and length all pass.
  Status: Production `0xB3` UDP packet gate, source checks, helper script, stale TCP-client timeout hardening, Arduino compile, and hardware `udp-smoke` validation pass. Old Wi-Fi caused high packet loss/timeouts; moving Mac and ESP to `192.168.3.x` resolved transport instability.

- [x] 3.7 Add ESP persistence foundation
  Output: One ESP storage layer for Wi-Fi profiles and pairing identity.
  Non-goals: BSSID/mesh/router heuristics, final multi-phone UX, or final crypto format.
  Check: ESP can persist Wi-Fi profiles, device identity, and paired-phone secret data across reboot and expose hooks for TCP/BLE auth and setup.
  Status: NVS-backed persistence store, saved Wi-Fi profile hooks, stable device ID, pairing proof hook, TCP setup commands, source checks, Arduino compile, and hardware smoke validation pass on `192.168.3.228`; `HelloAck` device ID stayed `ESP3-F01005BA2010` across reset.
  Sub-steps:
  - Former 3.8: Add storage for multiple simple `SSID + password` profiles; ESP can store, list, try, and clear saved profiles.
  - Former 3.9: Add storage for device identity and paired-phone secret(s); ESP can persist identity/secret across reboot and use them for TCP/BLE authentication hooks.

- [x] 3.8 Merge BLE fallback with setup/status control path
  Output: BLE path supporting cursor, buttons, drag, scroll, keyboard, ownership, setup/status, heartbeat, release-all, and Wi-Fi setup commands.
  Non-goals: Preserve BLE as the smooth cursor path or depend on iOS current-SSID access.
  Check: BLE Mode drives all features only when it owns HID, uses shared HID state, cannot drive HID while Wi-Fi owns the ESP, reports status/capabilities/device ID, shows only ESP-visible SSIDs, and provisions Wi-Fi without hardcoded credentials.
  Status: Complete. `esp-production-3.8` hardware validation passed on `192.168.3.228`: BLE pair/auth, status/device ID/capabilities, owner claim, heartbeat, cursor, Escape, saved-profile list, forget-missing-SSID, Wi-Fi scan, Wi-Fi-owner BLE HID isolation, authenticated BLE safety release-all, reset-pairing owner clear, source checks, and Arduino compile all pass.
  Sub-steps:
  - Former 3.7: Merge full-feature BLE fallback into TinyUSB firmware.
  - Former 3.10: Add ESP status, capability, and BLE Wi-Fi setup commands.

## Step 4: iOS Transport Architecture

Goal: Refactor the app so UI and gesture code produce semantic input events while the active transport decides how to send them.
Non-goals: Final onboarding polish or settings UI.
Exit criteria: iOS has an input router, Wi-Fi transport, BLE transport, local cleanup behavior, and connection state model matching the locked spec.

- [ ] 4.1 Create shared input event layer
  Output: Swift model/API for canonical input events independent of BLE or Wi-Fi.
  Non-goals: Change gesture behavior.
  Check: Touchpad, keyboard, scroll, and command UI can route through one event API.

- [ ] 4.2 Create InputRouter with active mode ownership
  Output: Router that sends events only through the active transport, blocks inactive HID input, and supports SwitchingMode.
  Non-goals: Auto-switch tuning.
  Check: Wi-Fi Mode and BLE Mode are mutually exclusive for HID-driving input, and failure recovery blocks stale input immediately.

- [ ] 4.3 Keep UDP motion sender as Wi-Fi motion lane
  Output: Wi-Fi motion client preserving the successful one-subframe UDP pipeline with production session/token/epoch fields.
  Non-goals: Re-batch UDP motion or move motion to TCP.
  Check: Existing smooth-motion diagnostics remain comparable to the POC, and UDP motion stops immediately when Wi-Fi ownership is lost.

- [ ] 4.4 Add TCP control client
  Output: iOS TCP client for hello/auth, claim owner, heartbeat, buttons, scroll, keyboard, release-all, status, setup/admin, and errors.
  Non-goals: Replace UDP cursor motion.
  Check: Buttons, keyboard, scroll, release-all, capability checks, and owner liveness work over Wi-Fi without BLE.

- [ ] 4.5 Refactor BLE into full fallback transport
  Output: BLE transport that handles all canonical input events in BLE Mode.
  Non-goals: Match Wi-Fi cursor smoothness.
  Check: App can use BLE Mode for all features when Wi-Fi is unavailable.

- [ ] 4.6 Add iOS connection state machine
  Output: App state model for unpaired, BLE setup, BLE active, Wi-Fi setup, Wi-Fi connecting, Wi-Fi active, reconnecting, and degraded states.
  Non-goals: Final visual design.
  Check: Intentional switches wait for idle, failure recovery does not wait for idle, and user-visible status matches active transport health.

- [ ] 4.7 Add background/inactive release-all behavior
  Output: App lifecycle hooks that send release-all before suspension/inactive state.
  Non-goals: Background input support.
  Check: No held mouse/key state remains after app backgrounding.

## Step 5: Wi-Fi Setup And Discovery

Goal: Replace hardcoded Wi-Fi/IP assumptions with user setup, ESP scan results, Local Network permission handling, and automatic Wi-Fi discovery.
Non-goals: ESP hotspot/direct mode.
Exit criteria: A user can set up Wi-Fi Mode without editing firmware, hardcoding credentials, or hardcoding an ESP IP address.

- [ ] 5.1 Add Local Network permission flow
  Output: iOS permission prompt timing and denied-permission handling for Wi-Fi Mode.
  Non-goals: Request permission at app launch without context.
  Check: BLE Mode remains usable if Local Network permission is denied.

- [ ] 5.2 Add BLE Wi-Fi provisioning UI
  Output: UI for ESP scan list, SSID selection, password entry, connection progress, and setup failure.
  Non-goals: Explain 2.4 GHz vs 5 GHz unless setup fails.
  Check: User chooses from ESP-visible SSIDs and sends credentials over BLE.

- [ ] 5.3 Add ESP Wi-Fi connection workflow
  Output: ESP tries saved profiles, connects to selected SSID, reports result, and remembers successful profiles.
  Non-goals: Enterprise/captive-portal Wi-Fi support.
  Check: ESP reconnects to a saved network after reboot without re-entering credentials.

- [ ] 5.4 Add Bonjour/mDNS discovery
  Output: ESP advertises service; iOS discovers device, ports, device ID, and capability summary.
  Non-goals: Final multi-dongle picker polish.
  Check: Hardcoded ESP IP is removed from normal Wi-Fi Mode, and iOS can match Wi-Fi-discovered devices to known BLE/device identities.

- [ ] 5.5 Handle Wi-Fi communication failure UX
  Output: User-facing fallback when ESP joins Wi-Fi but iPhone cannot reach it.
  Non-goals: Teach networking theory.
  Check: App offers retry, choose another Wi-Fi, or use BLE Mode.

## Step 6: Pairing, Security, And Multi-Phone Ownership

Goal: Harden pairing, authentication, and ownership after the minimum transport paths are working.
Non-goals: Enterprise-grade account system.
Exit criteria: Runtime input is accepted only from the active authenticated owner/session.

- [ ] 6.1 Finalize pairing secret flow
  Output: Pairing sequence that creates, stores, authenticates, and rotates/replaces a phone identity and shared secret.
  Non-goals: Final reset UI.
  Check: Rebooted ESP and app can re-authenticate without repeating Wi-Fi password setup.

- [ ] 6.2 Harden active-owner enforcement
  Output: Security review and tests proving ESP accepts HID-driving input only from the current authenticated owner session.
  Non-goals: Simultaneous multi-phone control.
  Check: A second phone cannot move/click/type while another phone owns the dongle.

- [ ] 6.3 Add "dongle in use" status
  Output: ESP status and iOS handling for already-owned runtime sessions.
  Non-goals: Full multi-user collaboration.
  Check: Non-owner app gets a clear status instead of silently failing.

- [ ] 6.4 Add pairing reset behavior
  Output: Defined reset command/button behavior for clearing paired phones and Wi-Fi profiles.
  Non-goals: Firmware update recovery.
  Check: User can recover from lost phone or bad stored credentials.

- [ ] 6.5 Remove lab-only secrets and hardcoded network assumptions
  Output: No production path depends on hardcoded Wi-Fi credentials, hardcoded ESP IP, debug tokens, or example pairing secrets.
  Non-goals: Enterprise device management.
  Check: Normal setup and reconnect work from stored profiles, discovery, and authenticated sessions.

## Step 7: Validation And Release Readiness

Goal: Prove Wi-Fi Mode and BLE Mode work as complete, separated product paths and that safety behavior prevents stuck input.
Non-goals: App Store submission checklist.
Exit criteria: Manual and diagnostic tests pass for motion, controls, setup, fallback, ownership, and safety.

- [ ] 7.1 Validate Wi-Fi smooth motion remains POC-quality
  Output: Logs comparing iOS UDP cadence, ESP UDP rx, ESP HID reports, queue depth, and subjective feel.
  Non-goals: Retune acceleration unless regression is observed.
  Check: Wi-Fi Mode preserves the smooth TinyUSB motion behavior from `docs/reference/UDP_Motion_Findings.md` and stays within `docs/reference/Performance_Findings.md` gates.

- [ ] 7.2 Validate Wi-Fi controls over TCP
  Output: Test results for click, drag, right click, scroll, keyboard combos, release-all, heartbeat, and reconnect.
  Non-goals: Smooth scroll.
  Check: No lost/stuck button or key during normal TCP control use.

- [ ] 7.3 Validate BLE full-feature fallback
  Output: Test results for all features in BLE Mode.
  Non-goals: Native-mouse cursor smoothness.
  Check: BLE Mode remains usable when Wi-Fi is unavailable or permission is denied.

- [ ] 7.4 Validate mode isolation
  Output: Tests proving inactive transport cannot drive HID except allowed setup/status/release-all/ownership paths.
  Non-goals: Final security audit.
  Check: BLE input is ignored during Wi-Fi ownership, and UDP motion is ignored without TCP ownership.

- [ ] 7.5 Validate safety behavior
  Output: Tests for app backgrounding, phone lock, Wi-Fi loss, BLE loss, TCP disconnect, heartbeat timeout, and app relaunch.
  Non-goals: Background input.
  Check: ESP always releases mouse buttons and keyboard keys after failure/timeout/background.

- [ ] 7.6 Validate version and capability handling
  Output: Tests for incompatible protocol versions, missing Wi-Fi/BLE capabilities, unsupported firmware, and partial compatibility.
  Non-goals: Full firmware update flow.
  Check: iOS disables only unsupported modes/features and never routes HID input to an incompatible transport.

- [ ] 7.7 Retune development-only owner/TCP timeouts
  Output: Release-ready owner heartbeat and TCP idle timeout values after iOS automatic heartbeat, reconnect, and fallback behavior are implemented.
  Non-goals: Reopen the ownership state machine.
  Check: Timeouts are short enough for real safety/recovery, long enough for normal transport jitter, and no longer use the 10-minute manual bring-up defaults.

## Plan Change Log

- 2026-05-05: Initial production transport task plan based on `docs/Production_Transport_Architecture.md`.
- 2026-05-05: Added `docs/Production_Transport_Spec.md` with the shared input event model and marked task 2.1 complete.
- 2026-05-05: Added Wi-Fi TCP control protocol to `docs/Production_Transport_Spec.md` and marked task 2.2 complete.
- 2026-05-06: Added ESP Wi-Fi network loss/change recovery notes to `docs/Production_Transport_Spec.md` as draft reference for task 2.5.
- 2026-05-06: Condensed `docs/Production_Transport_Spec.md` for easier agent handoff without changing locked decisions.
- 2026-05-06: Renumbered draft Wi-Fi recovery notes to spec section 5 to match task 2.5.
- 2026-05-06: Added UDP motion session gate to `docs/Production_Transport_Spec.md` and marked task 2.3 complete.
- 2026-05-06: Tightened UDP motion session gate epoch, packet version, frame count, endpoint, and sequence rules after strict review.
- 2026-05-07: Added BLE fallback protocol contract to `docs/Production_Transport_Spec.md` and marked task 2.4 complete.
- 2026-05-07: Tightened BLE fallback dispatch, delivery, chunking, ownership payload, no-epoch, and error rules after review.
- 2026-05-07: Added mode switching and ownership state machine to `docs/Production_Transport_Spec.md` and marked task 2.5 complete.
- 2026-05-07: Tightened Section 5 lifecycle mapping, heartbeat failure transitions, Wi-Fi owner epoch state, handoff rollback notes, and NoOwner recovery rules after review.
- 2026-05-17: Added release-all and heartbeat safety contract to `docs/Production_Transport_Spec.md` and marked task 2.6 complete.
- 2026-05-17: Tightened Section 6 release reason mapping, neutral HID reports, liveness refresh, disconnect coverage, and rollback references after review.
- 2026-05-17: Polished Section 6 terminology for iOS button state, BLE availability, TCP session health, and cleanup cross-references.
- 2026-05-17: Added protocol version and capability negotiation to `docs/Production_Transport_Spec.md` and marked task 2.7 complete.
- 2026-05-17: Tightened Section 7 effective capabilities, frame-version failure, BLE status capability meaning, ownerSession definition, and provisioning/profile requirements after strict review.
- 2026-05-18: Clarified Section 7 v1 capability gating uses ESP capabilities directly and BLE incompatibility means major-version mismatch.
- 2026-05-18: Tightened Sections 1, 3, and 7 for heartbeat payload derivation, epoch updates, and BLE compatibility probing after whole-spec review.
- 2026-05-23: Optimized unfinished task steps around the locked spec, tightening firmware ownership, UDP gate, iOS routing, setup/discovery, and validation dependencies.
- 2026-05-31: Moved historical findings/logs into `docs/reference/`, added `Performance_Findings.md`, recorded the performance baseline, and marked task 2.8 complete.
- 2026-05-31: Completed Step 3.2 by adding shared production firmware HID staging, active mode state, composite mouse/keyboard TinyUSB reports, release-all cleanup, and a focused source verification test.
- 2026-05-31: Added task closure rules, clarified that Step 7 owns final integration validation, and marked 3.2 as a structural shared-HID closure.
- 2026-05-31: Added Step 3.3 to reorganize production ESP firmware before adding owner/session, TCP, UDP gate, and BLE fallback complexity.
- 2026-05-31: Implemented Step 3.3 source split into production firmware modules; source tests and Arduino compile pass, manual smoke tests pending.
- 2026-05-31: Marked Step 3.3 complete after hardware run confirmed the reorganized production firmware works.
- 2026-05-31: Implemented Step 3.4 owner/session foundation (`OwnerSession` module, boot heartbeat polling, diagnostics owner line); source tests and Arduino compile pass.
- 2026-06-06: Completed Step 3.5 Wi-Fi TCP control server (`WifiTcpControl` module with negotiation, placeholder auth, owner claim, heartbeat, status, reliable HID controls, release-all, setup result, and error handling); source checks, Arduino compile, TCP smoke, HID smoke, bad-session rejection, and heartbeat-timeout validation pass. Recorded one resolved first-run helper timeout.
- 2026-06-06: Reorganized unfinished Step 3 work for faster delivery: keep UDP owner gate as 3.6, combine Wi-Fi profile and pairing identity storage into 3.7, and combine BLE fallback with setup/status control into 3.8.
- 2026-06-07: Validated Step 3.6 production UDP owner gate (`0xB3` packet, TCP owner IP/session/token/epoch checks, gate diagnostics, and `udp-smoke` helper); source checks, Arduino compile, TCP ownership, gated UDP cursor movement, and invalid-probe rejection pass. Root-caused intermittent manual-test timeouts to the old Wi-Fi path with severe packet loss; validation completed on the healthier `192.168.3.x` network.
- 2026-06-07: Recorded Step 3.6 debugging lessons: ESP `TCP tx ... ok=yes` plus Mac timeout means verify network reachability before changing protocol code; `ping`, `nc`, and `arp` separated Wi-Fi/AP instability from firmware bugs; disabling UDP RX isolated task contention; `udpRx iters=0/s` after a supposed re-enable means the board is still running the old diagnostic build.
- 2026-06-06: Hardened Step 3.6/3.5 TCP helper path after repeated manual-test timeouts by adding hello/idle timeout cleanup for stale single TCP clients and diagnostics for TCP client timeouts.
- 2026-06-07: Added TCP frame-level diagnostics (`rx`, `tx`, read bytes, write failures, counters) and increased periodic Serial summary interval to reduce log noise while investigating intermittent TCP manual-test timeouts.
- 2026-06-07: Hardened TCP response delivery by enabling no-delay on accepted clients and sending each TCP response as one contiguous frame with flush; source checks and Arduino compile pass.
- 2026-06-07: Completed Step 3.7 ESP persistence foundation (`PersistentStore` NVS storage, saved Wi-Fi profile list/forget hooks, persistent device ID, pairing validation/reset hook, and `esp-production-3.7` firmware reporting); source checks, Arduino compile, hardware setup commands, pairing reset, and reboot-stable device ID validation pass on `192.168.3.228`.
- 2026-06-07: Implemented Step 3.8 firmware slice (`BleControl` module, BLE RX/TX GATT, control frame handlers, owner-gated legacy BLE HID, BLE status/device ID, BLE Wi-Fi scan/provisioning, saved profile commands, reset-pairing, and shared spec-aligned capabilities). Source checks and Arduino compile passed; hardware BLE validation was completed on 2026-06-08.
- 2026-06-07: Hardened Step 3.8 after review by adding BLE local-owner timeout sync, explicit `CommandResult` success/failure notifications for BLE admin commands, heartbeat-aware manual BLE smoke steps, nRF Connect test tooling guidance, safe setup/admin checks, Wi-Fi-owner BLE isolation, and authenticated BLE safety release-all validation.
- 2026-06-08: Increased owner heartbeat timeout to 30 seconds for manual BLE bring-up, updated the TCP timeout helper wait, and rewrote the Step 3.8 manual test with click-by-click nRF Connect instructions and command-local expected responses.
- 2026-06-08: Increased owner heartbeat timeout again to 10 minutes after manual nRF testing proved 30 seconds was still too short for reliable BLE validation; updated the TCP timeout helper and manual-test heartbeat guidance.
- 2026-06-08: Fixed TCP helper/manual mode-isolation path after hardware showed legacy one-byte TCP results: helper now accepts an explicit proof, parses one-byte reason-only Auth/Owner results, can hold sessionless TCP ownership for isolation testing, and firmware disconnect cleanup now clears any Wi-Fi owner held by the TCP client.
- 2026-06-08: Increased TCP control idle timeout to 10 minutes so manual Wi-Fi-owner isolation checks do not drop ownership after the former 3-second TCP idle timer.
- 2026-06-08: Completed Step 3.8 hardware validation on `192.168.3.228`. Key debugging lessons: nRF Connect writes must use `ByteArray`, `Request`, and no spaces; nRF displays notifications in 4-hex-digit groups, so expected bytes should match that display; BLE auth is connection-local and must be repeated after reconnect before authenticated safety release-all; successful BLE safety release-all intentionally sends no BLE response, so confirm with Serial `releaseAll` and owner state; TCP helper must use the same pairing identity as BLE (`--phone-id codex --proof secret` in the manual test); one-byte TCP `00` means legacy success, not boolean false; manual bring-up needs both owner heartbeat and TCP idle timeouts long enough to inspect nRF/Serial state.
- 2026-06-08: Marked the 10-minute owner heartbeat and TCP idle timeout values as development-only manual bring-up defaults and added Step 7.7 to retune them before real production release.
