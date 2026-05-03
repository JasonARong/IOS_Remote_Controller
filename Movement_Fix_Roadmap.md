**Major Chunks**

1. **Measurement First**
   Add lightweight diagnostics so we know what is actually happening:
   - iOS touch/sample interval histogram
   - BLE send interval histogram
   - `canSendWriteWithoutResponse` blocked duration
   - dropped/stale movement count
   - ESP BLE packet interarrival time
   - ESP USB HID report interval

2. **iOS Touch Sampling Cleanup**
   Make input deltas more stable before BLE is involved:
   - use `event.coalescedTouches(for:)` or fixed display-link sampling
   - use `UITouch.timestamp` for movement timing
   - reset timing cleanly on gesture start/end
   - remove movement hot-path logging

3. **Pointer Motion Model**
   Make acceleration less jumpy:
   - add light velocity EMA filtering
   - cap maximum speed used for gain calculation
   - reduce iOS-side acceleration because host OS already applies mouse acceleration
   - add tiny jitter dead zone if needed
   - keep subpixel accumulation

4. **BLE Send Queue**
   Replace the current “clear then try send” behavior:
   - do not lose fresh movement when CoreBluetooth is briefly blocked
   - queue/coalesce recent movement
   - drop or fade stale movement after a latency budget, around `40-70 ms`
   - clamp each packet so one flush cannot become a cursor jump
   - flush from both display-link tick and `peripheralIsReady(toSendWriteWithoutResponse:)`

5. **Button And Keyboard Priority Path**
   Keep clicks and key commands reliable:
   - button down/up should be prioritized over movement
   - avoid losing button transitions during BLE congestion
   - consider `.withResponse` or a small priority queue for non-movement commands
   - keep movement lossy under bad signal, but button state reliable

6. **ESP HID Pacer Rewrite**
   Remove fake smoothing from the bridge:
   - delete/disable the 50% geometric movement tail
   - BLE callback only adds pending movement/button/wheel state
   - USB HID loop emits bounded reports at a fixed cadence
   - clamp per-report X/Y to mouse-like values
   - do not decay old movement into delayed cursor motion
   - remove movement hot-path `Serial.printf`

7. **BLE Parameter Reality Check**
   Tune for what iOS will actually allow:
   - stop assuming 120 Hz BLE sends are sustainable
   - start around 60 Hz
   - request iOS-friendly connection params, likely `15-30 ms`
   - log/verify whether requested ESP params are actually accepted
   - only chase lower intervals if moving to real BLE HID/HOGP

8. **End-to-End Tuning**
   Tune after the pipeline is corrected:
   - compare 60 Hz vs 90/120 Hz iOS send pacing
   - tune velocity EMA alpha
   - tune stale movement age limit
   - tune per-packet clamp
   - tune iOS gain curve
   - test near ESP, far from ESP, and with obstruction/interference

9. **Optional Architecture Upgrade**
   If the current custom GATT bridge still feels limited:
   - make ESP present as real BLE HID to the iPhone/computer, or
   - avoid BLE for motion and use Wi-Fi/USB/direct transport, or
   - keep BLE only for low-rate commands and use another path for pointer motion

The most important implementation order is: **measure → stop losing/over-flushing movement → remove ESP smoothing tail → tune acceleration**.