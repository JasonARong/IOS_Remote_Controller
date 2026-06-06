# ESP Firmware Files

Status: Source-of-truth map for firmware cleanup.

Canonical production contract: `../docs/Production_Transport_Spec.md`.
Execution plan: `../docs/tasks.md`.

## File Roles

- `ESP_Bridge_Production/ESP_Bridge_Production.ino`
  - Current production firmware base.
  - Use this for Step 3 feature work.
  - Preserves the TinyUSB motion path and adds shared HID/release-all foundation.
  - The `.ino` file is startup wiring only; production behavior is split across `.h/.cpp` modules:
    - `Config`: compile-time settings and lab flags.
    - `UsbHid`: TinyUSB descriptor, initialization, and report send helpers.
    - `HidState`: shared HID state, input staging, active mode, and release-all.
    - `MotionQueue`: UDP motion frame queue.
    - `UdpMotion`: Wi-Fi UDP setup, packet parsing, and RX task.
    - `WifiTcpControl`: framed TCP control server for Wi-Fi ownership, heartbeat, status, reliable HID controls, and setup/admin placeholders.
    - `HidPacer`: timed HID report emission.
    - `Diagnostics`: counters and summary printing.
  - `tools/tcp_control_client.py` is the macOS/manual-test helper for sending raw binary TCP control frames to port `4211`.

- `ESP_Bridge_TinyUSB.ino`
  - Smooth-motion POC reference.
  - Use to compare UDP -> queue -> TinyUSB HID behavior.
  - Do not add new production features here unless intentionally replacing the production base.

- `ESP_Bridge.ino`
  - Legacy full-feature reference.
  - Useful for BLE buttons, keyboard, scroll, and old behavior.
  - Do not use as the production motion base.

- `og_ESP_Bridge.ino`
  - Original legacy reference.
  - Keep only for historical behavior comparison.

## Cleanup Rule

Production code should move toward `ESP_Bridge_Production/ESP_Bridge_Production.ino`.
Reference sketches should stay buildable when possible, but they are not the implementation contract.
