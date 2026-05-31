# UDP Motion POC — Findings & Decisions

Status: Historical POC findings and motion reference.

Canonical production contract: `docs/Production_Transport_Spec.md`.
Canonical execution plan: `docs/tasks.md`.
Performance baseline: `docs/reference/Performance_Findings.md`.

Use this document to preserve the motion lessons that made Wi-Fi cursor movement smooth. Do not use its packet markers, ports, credentials, or lab setup as the production protocol contract.

This document records what we learned proving **Wi‑Fi UDP + ESP32‑S3 USB HID** can deliver **mouse‑like smooth cursor motion**, the engineering decisions that fixed it, and how constants must stay paired across iOS and firmware. Use it as the handoff from POC to integration.

---

## 1. Goal & outcome

**Goal:** Replace BLE‑bridged pointer motion with a high‑rate UDP path so the Mac sees dense relative‑motion HID reports (similar feel to a wired mouse), without sacrificing correctness.

**Outcome:** POC succeeded. Subjectively smooth motion was achieved after fixing **three stacked bottlenecks** (iOS aggregation, UDP batching, ESP HID coalescing) and compensating **macOS pointer acceleration** when per‑report deltas became small.

Primary POC firmware: `ESP_Bridge_TinyUSB.ino` (Adafruit TinyUSB, motion‑only). Legacy full‑feature sketch: `ESP_Bridge.ino` (Espressif stack + BLE control path — not the smoothness winner for motion).

---

## 2. Executive summary — why it felt “not smooth” for so long

| Layer | Symptom in logs | Root cause |
|--------|------------------|------------|
| **iOS `touchesMoved`** | ~30–60 callbacks/s; each carries **many** `coalescedTouches` | UIKit delivers bursts; digitizer is fast but callbacks are not |
| **iOS UDP sender (early)** | `emptyWhileActive` huge; few subframes/s | Summed all samples in a burst → **lost per‑sample timing** |
| **iOS UDP sender (mid)** | Still chunky host motion | Packed **multiple subframes per packet** per timer tick → bursts at ESP |
| **ESP HID pacer (early)** | `HID reports/s` ~30–40; `HID interval ms >=16` dominant | **Drained entire UDP queue each tick** → summed subframes → **one big HID report** → ~30 Hz effective cursor |
| **macOS (after fixes)** | “Smoother but slower” | Small per‑report deltas → OS acceleration curve applies **less gain** than with chunky reports |

**Net:** Smoothness needs **high HID report rate with moderately sized deltas**. We fixed rate + spacing first; we restored perceived speed with an **iOS velocity curve** (`motionGain`), not by undoing the pipeline fixes.

---

## 3. End‑to‑end data path (reference)

```
UITouch (coalesced) → TouchPadViewModel / PointerMotionEngine
  → scaled Int16 subframes (× pointerScale, × velocity gain)
  → UDPMotionSender (FIFO, quantize, 250 Hz drain)
  → UDP Wi‑Fi
  → ESP: WiFiUDP RX task → per‑subframe queue
  → HID pacer (500 Hz): POINTER_SCALE divide + clamp → TinyUSB mouse report
  → macOS HID → cursor
```

---

## 4. Decisions (chronological rationale)

### 4.1 ESP: TinyUSB instead of default Espressif HID (Phase 2)

- **Problem:** `sendReport` failures and sparse successful reports (`reportFails`, uneven spacing).
- **Decision:** Clean‑room `ESP_Bridge_TinyUSB.ino` with Adafruit TinyUSB, custom 6‑byte mouse descriptor, `usb_hid.setPollInterval(1)` (1 ms bInterval / 1000 Hz host poll).
- **Note:** Integration must **merge BLE/control paths into this sketch** (or equivalent); motion path should stay on TinyUSB.

### 4.2 iOS: `pointerScale` matched to firmware

- **Problem:** Mismatch made speed wrong and hid quantization issues.
- **Decision:** `PointerMotionEngine.pointerScale == 8` must match `#define POINTER_SCALE 8` on ESP; ESP divides with fractional remainder before HID.

### 4.3 iOS: Per‑sample FIFO (not scalar accumulator)

- **Problem:** Summing coalesced samples destroyed temporal granularity → sparse UDP/HID.
- **Decision:** Each coalesced sample → own quantized `MotionSubframe` in a FIFO (`UDPMotionSender`).

### 4.4 iOS: One subframe per UDP datagram; one chunk per timer tick

- **Problem:** Sending 8 subframes in one datagram re‑created bursts at the receiver; ESP pacer then summed them again.
- **Decision:** `maxSubframesPerDatagram = 1`, and **flush at most one chunk per tick** (not `while`‑drain entire queue in one tick).

### 4.5 ESP: One queue element per pacer tick (not drain‑all)

- **Problem:** “Drain ALL frames this tick” summed N subframes into **one** HID delta per 2 ms boundary → **~30 Hz** cursor despite high UDP subframe rate.
- **Decision:** Pop **at most one** `MotionFrame` per `HID_PACER_INTERVAL_MS` tick; remainder stays queued → **~150–220 HID reports/s** under load, small deltas.

### 4.6 iOS: Velocity curve after pipeline fix (“slower but smooth”)

- **Problem:** macOS pointer acceleration is nonlinear; small HID deltas get less boost than large chunks.
- **Decision:** Re‑enable `motionGain(forSpeed:settings:)` in `PointerMotionEngine.scaledRawDelta` using `MotionCurveSettings`.

**Tuned values that felt best in testing** (commit these as the default until product UX says otherwise):

| Parameter | Value |
|-----------|--------|
| `minSpeed` | 40 |
| `maxSpeed` | 1400 |
| `baseGain` | 2.2 |
| `maxGain` | 6.2 |
| `gamma` | 0.9 |

---

## 5. POC constants — iOS ↔ ESP motion reference

These constants describe the successful POC motion pipeline. Production keeps the behavior, but the production wire protocol is gated by ownership/session fields in `docs/Production_Transport_Spec.md`.

**Do not change one side without the other** where noted during POC or motion retuning.

| Concern | iOS | ESP (`ESP_Bridge_TinyUSB.ino`) |
|---------|-----|--------------------------------|
| Wire marker | `packetMarker` `0xB2` (configured where sender is created) | `UDP_MOTION_PACKET_MARKER` `0xB2` |
| Subframe layout | `marker \| seq \| count \| (dx i16 LE, dy i16 LE) × count` | Same |
| Max subframes per datagram | `maxSubframesPerDatagram` **1** | `UDP_SUBFRAMES_PER_PACKET` **≥ 1** (8 allows future flexibility; current sender uses 1) |
| Resolution scale | `PointerMotionEngine.pointerScale` **8** | `POINTER_SCALE` **8** |
| Per‑subframe clamp (scaled ints) | `maxDeltaPerFrame` **1024** | N/A at RX; HID clamp `MAX_HID_DELTA_PER_REPORT` **127** after scale divide |
| Sender cadence | `frameInterval` **0.004 s** (250 Hz) | — |
| Stale prune | `staleInterval` **0.032 s** | Queue stale: `UDP_FRAME_STALE_US` **48000** (~48 ms) — related but not identical purpose |
| HID emit cadence | — | `HID_PACER_INTERVAL_MS` **2** (500 Hz attempts) |
| USB polling | — | `setPollInterval(1)` |

Production differences:

- Production UDP motion uses the gated packet from `Production_Transport_Spec.md`, not raw unauthenticated POC packets.
- Production mode ownership, `sessionId`, `udpToken`, `inputEpoch`, heartbeat, release-all, and capability rules are defined only in the spec.

---

## 6. Evidence summary (diagnostic logs)

Captured in `docs/reference/debug_logs.md` under **Log 13–16**.

| Log | What it showed |
|-----|----------------|
| **13** | High coalesced sample rate vs **very low** UDP subframes/s + high `emptyWhileActive` → iOS sender path bottleneck |
| **14** | FIFO helped subframe count; ESP still **~36 HID reports/s**, **`>=16ms` HID intervals** → ESP pacer **summing queue** |
| **15** | After **1 subframe/packet** + **one frame/pacer tick**: **~200 HID reports/s**, emit deltas mostly **2–8**; motion felt smoother but **slower** (macOS accel) |
| **16** | After **velocity curve** (`baseGain`/`maxGain`/`gamma`): gain buckets populated; ESP emit deltas **8–32** range; subjective **best balance** |

---

## 7. Known limitations

1. **UIKit delivery is bursty:** `touchesMoved` fires on the order of **tens of Hz** (varies by device/load), so each batch of **coalesced** samples lands together. That shapes **latency and burst spacing**, not a hard cap on output — the host still sees **~150–200 HID reports/s** when active (Log 16). Worst case: the **oldest** sample in a batch may be a few tens of ms behind real time before we enqueue it.
2. **`staleDrops` / `udpStaleDrops`** can occur on aggressive flicks (queue + 32 ms sender stale vs burst size). If skips appear, consider increasing `staleInterval` slightly or reducing peak gain — trade‑off vs latency.
3. **Wi‑Fi / debugger**: Debugging attached can add hangs; use logs on device for “clean” metrics.
4. **Secrets in sketches:** `ESP_Bridge_TinyUSB.ino` contains example Wi‑Fi credentials — **replace or externalize before shipping.**

---

## 8. Integration checklist (post‑POC)

- [ ] Merge **BLE control path** (buttons, scroll, keyboard, discovery) from `ESP_Bridge.ino` into **`ESP_Bridge_TinyUSB.ino`** (or rename unified sketch), **without** changing the motion UDP → HID pacer behavior proven here.
- [ ] Re‑validate **BLE + Wi‑Fi coexistence** (connection interval / latency — earlier “coexistence breaker” in `ESP_Bridge.ino` is a reference).
- [ ] Strip or `#if DEBUG` **verbose movement diagnostics** for release builds (`MovementDiagnostics.swift`).
- [ ] Single **source of truth** for production protocol constants if needed; `Production_Transport_Spec.md` is the written contract.
- [ ] Remove or archive **`og_ESP_Bridge.ino`** if obsolete; keep git history.
- [ ] Update developer setup docs for USB-OTG TinyUSB and required libraries. User-facing setup should avoid same-Wi-Fi/same-LAN theory unless communication fails.

---

## 9. Key source files

| Area | File |
|------|------|
| iOS UDP sender | `RemoteController/UDPMotionSender.swift` |
| iOS pointer scaling + curve | `RemoteController/MotionEngines/PointerMotionEngine.swift`, `MotionCurves.swift` |
| iOS touch → motion | `RemoteController/TouchPadViewModel.swift` |
| iOS diagnostics | `RemoteController/MovementDiagnostics.swift` |
| ESP POC (smooth) | `ESP_Bridge_TinyUSB.ino` |
| ESP legacy (full feature) | `ESP_Bridge.ino` |

---

## 10. Conclusion

Wi‑Fi UDP is **viable for mouse‑like motion** when:

1. Per‑sample motion is **preserved** through iOS and **not re‑batched** into a single HID step at the ESP.
2. USB HID uses a **reliable stack** (TinyUSB POC) and **high enough** effective report rate to the host.
3. **Host OS acceleration** is compensated when deltas become small — via an explicit **velocity‑based gain** on iOS matching product feel.

Next step is **product integration**: unify firmware (TinyUSB motion + BLE control) and harden configuration and diagnostics for release.
