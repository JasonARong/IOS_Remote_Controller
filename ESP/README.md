# ESP Firmware Files

Status: Source-of-truth map for firmware cleanup.

Canonical production contract: `../docs/Production_Transport_Spec.md`.
Execution plan: `../docs/tasks.md`.

## File Roles

- `ESP_Bridge_Production/ESP_Bridge_Production.ino`
  - Current production firmware base.
  - Use this for Step 3 feature work.
  - Preserves the TinyUSB motion path and adds shared HID/release-all foundation.

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
