**Minimal POC Goal**

Test only one question:

> If motion packets travel over Wi-Fi/UDP instead of BLE GATT, does cursor movement become meaningfully smoother?

So I would avoid Wi-Fi provisioning, Bonjour discovery, full transport abstraction, settings UI, reconnection logic, and polished fallback. This should be a hardcoded lab test.

**POC Architecture**

Keep the current app and ESP structure, but add a debug-only UDP path for mouse packets:

```text
iPhone touch pipeline
-> existing ConnectionManager tick
-> existing 6/8 byte mouse packet format
-> UDP instead of BLE write
-> ESP UDP receiver
-> existing ESP pendingDx/pendingDy pacer
-> USB HID to computer
```

BLE remains in the project and can still connect, but for the cleanest motion test I would make **mouse movement use UDP only** when `UDP_MOTION_POC` is enabled.

**ESP Minimal Plan**

In [ESP_Bridge.ino](/Users/chenjiecheng/Documents/XcodeProjects/IOS_Remote_Controller/ESP_Bridge.ino):

1. Add `WiFi.h` and `WiFiUdp.h`.
2. Hardcode:
   - Wi-Fi SSID
   - Wi-Fi password
   - UDP port, for example `4210`
3. In `setup()`:
   - connect ESP to Wi-Fi station mode
   - call `WiFi.setSleep(false)` if available in Arduino ESP32
   - print ESP IP address to Serial
   - start `udp.begin(UDP_PORT)`
4. In `loop()`:
   - call `pollUdpMousePackets()`
   - keep existing `emitMouseReportIfDue()`
5. Reuse the existing mouse packet format:
   - release: `[buttons, wheel, dxLE, dxLE, dyLE, dyLE]`
   - debug: `[0xA1, seq, buttons, wheel, dxLE, dxLE, dyLE, dyLE]`
6. Refactor the BLE mouse parsing body into a shared helper:
   - `handleMousePacketBytes(data, len, source)`
   - BLE `onWrite()` calls it
   - UDP receiver calls it
7. Add very small UDP diagnostics:
   - UDP packets per second
   - UDP interval buckets
   - UDP seq gaps
   - HID interval buckets
   - max pending / stale drops

For the POC, I would also test with BLE connected and then with BLE disconnected/quiet, because ESP Wi-Fi/BLE coexistence can matter.

**iOS Minimal Plan**

In [ConnectionManager.swift](/Users/chenjiecheng/Documents/XcodeProjects/IOS_Remote_Controller/RemoteController/ConnectionManager.swift):

1. Add a compile-time or file-local flag:

```swift
private let useUdpMotionPOC = true
private let udpHost = "192.168.x.x" // ESP Serial IP
private let udpPort: UInt16 = 4210
```

2. Add a tiny UDP sender using Apple Network framework:
   - `NWConnection(host:port:using: .udp)`
   - start it once during `ConnectionManager.init()`
   - send `Data` packets with `connection.send(...)`

3. Keep current packet construction exactly where it is in `tick()`.

4. At the send point:

```swift
if useUdpMotionPOC {
    udpSender.send(packet)
} else {
    peripheral.writeValue(packet, for: char, type: .withoutResponse)
}
```

5. Add `NSLocalNetworkUsageDescription` to `Info.plist`, because iOS local UDP traffic requires local network permission.

Do not build Wi-Fi credential setup yet. For this POC, manually put the iPhone and ESP on the same Wi-Fi and hardcode the ESP IP shown in Serial.

**One Important Change**

For this POC, I would move ESP HID pacing from 60Hz to **125Hz**:

```cpp
#define HID_REPORT_INTERVAL_US 8000UL
```

The whole point of Wi-Fi/UDP is to see whether we can escape BLE’s low/uneven cadence. Testing UDP while still outputting HID at 60Hz would under-test the benefit.

**Success Criteria**

UDP is worth investing in if we see:

- ESP UDP rx during motion mostly near `60-125/s`
- HID reports during motion near `100-125/s`
- HID interval buckets mostly `<8ms` or `8-12ms`
- low `maxPending`
- rare stale drops
- cursor feels obviously closer to native than BLE

UDP is probably not worth a full rewrite if:

- UDP rx still arrives mostly in `25-50ms` chunks
- HID reports still only happen `20-40/s`
- cursor still feels similarly artificial with BLE quiet/disconnected
- iOS touch sampling remains the dominant bottleneck

**Why This Is Minimal But Valid**

This directly tests the suspected bottleneck from your logs: BLE GATT arrival cadence. It does not solve onboarding or production UX yet, but it answers whether the transport change is technically worth the next week of work.

My recommendation: implement exactly this as a hardcoded `UDP_MOTION_POC`, run it in a clean Wi-Fi environment, and compare logs/feel against Log 3.


---


I’d divide it into **two implementation steps**, not one big shot.

**Step 1: ESP UDP Receiver POC**

Add the UDP motion path to `ESP_Bridge.ino` first:

- Hardcoded Wi-Fi SSID/password placeholders.
- UDP port.
- Movement-only packet parser: `[0xB1, seq, dxLE, dyLE]`.
- Add UDP `dx/dy` into the existing `pendingDx/pendingDy`.
- Do not touch buttons/wheel from UDP.
- Keep BLE working as-is.
- Add UDP diagnostics.
- Change HID pacer to `125Hz` for the experiment.

Why first: ESP is the merge point. Once it compiles, we know the bridge can accept both streams: BLE for commands/buttons, UDP for motion.

**Step 2: iOS UDP Movement Sender POC**

Then update iOS:

- Add minimal `UDPMotionSender`.
- Hardcode ESP IP/port.
- In `ConnectionManager.tick()`, send movement-only `dx/dy` over UDP when `useUdpMotionPOC = true`.
- Keep button/keyboard/scroll packets on BLE.
- Add local network permission string.
- Add minimal diagnostics for UDP send interval/count.

Why second: iOS depends on knowing the ESP IP from Serial, and we want to keep the send-routing change very focused.

I *can* implement both in one turn, but I’d still do it internally in those two chunks and compile after each. That’s the safer shape here because the POC touches both Arduino C++ and Swift networking.