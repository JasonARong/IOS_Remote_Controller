// Config.h — compile-time constants for Wi-Fi, UDP motion, HID pacing, and USB.
// Values here must stay aligned with the iOS RemoteController sender (see POINTER_SCALE).

#pragma once

#include <Arduino.h>

/************** CONFIG **************/
#define WIFI_SSID                 "SMARTPOOL-10G"
#define WIFI_PASSWORD             "13661663267"

#define UDP_MOTION_PORT           4210
#define UDP_MOTION_PACKET_MARKER  0xB3
#define UDP_MOTION_PACKET_VERSION 1
#define UDP_MOTION_FRAME_COUNT    1
#define UDP_MOTION_PACKET_LENGTH  21

#define UDP_FRAME_QUEUE_SIZE      32
#define UDP_FRAME_STALE_US        48000UL

// UDP RX task knobs. Keep enabled for normal production validation.
#define UDP_RX_TASK_ENABLED       1
#define UDP_RX_TASK_INTERVAL_MS   1
#define UDP_RX_TASK_PRIORITY      4

// HID pacer cadence. With bInterval=1 (1000 Hz host polling) we can pump
// at 2 ms (500 Hz) and the host will pick up every report on the next IN
// poll. Going below 2 ms gains nothing because we'd be writing into a
// queue the host already drains every ms.
#define HID_PACER_INTERVAL_MS     2
#define HID_PACER_INTERVAL_US     (HID_PACER_INTERVAL_MS * 1000UL)

// Per-report HID delta clamp after POINTER_SCALE division. This is the host
// visible movement cap for one USB mouse report.
#define MAX_HID_DELTA_PER_REPORT  127

// Inverse of iOS-side pointerScale so we recover host-perceived velocity.
// MUST equal RemoteController/MotionEngines/PointerMotionEngine.swift
// `pointerScale`. Don't change unilaterally.
#define POINTER_SCALE             8

// Wait this many ms for USB enumeration before continuing setup. We do NOT
// block forever -- if the cable is power-only or the host is slow, we still
// want Wi-Fi/UDP to come up so the diagnostic line tells us what failed.
#define USB_MOUNT_TIMEOUT_MS      3000

#define DIAGNOSTICS_INTERVAL_MS   5000

// Long bring-up timeout keeps manual BLE/nRF testing practical. Final tuning
// can lower this once iOS sends automatic owner heartbeats.
#define OWNER_HEARTBEAT_TIMEOUT_MS 600000
#define OWNER_SESSION_INITIAL_EPOCH 1

#define TCP_CONTROL_PORT          4211
#define TCP_CONTROL_MAGIC         0x5243
#define TCP_CONTROL_FRAME_VERSION 1
#define TCP_CONTROL_PROTOCOL_VERSION 1
#define TCP_CONTROL_MAX_PAYLOAD_LENGTH 1024
#define TCP_CONTROL_FIRMWARE_VERSION "esp-production-3.8"
#define TCP_CONTROL_IDLE_TIMEOUT_MS 600000
#define TCP_CONTROL_HELLO_TIMEOUT_MS 1500

#define REMOTE_CAP_BLE_CONTROL_V1        0x00000001UL
#define REMOTE_CAP_BLE_LEGACY_INPUT      0x00000002UL
#define REMOTE_CAP_WIFI_TCP_CONTROL_V1   0x00000004UL
#define REMOTE_CAP_WIFI_UDP_MOTION_V1    0x00000008UL
#define REMOTE_CAP_TINYUSB_HIGH_RATE_HID 0x00000010UL
#define REMOTE_CAP_OWNER_SESSION         0x00000020UL
#define REMOTE_CAP_RELEASE_ALL           0x00000040UL
#define REMOTE_CAP_OWNER_HEARTBEAT       0x00000080UL
#define REMOTE_CAP_BLE_WIFI_PROVISIONING 0x00000100UL
#define REMOTE_CAP_BONJOUR_DISCOVERY     0x00000200UL
#define REMOTE_CAP_MOUSE_BUTTONS         0x00000400UL
#define REMOTE_CAP_WHEEL_INPUT           0x00000800UL
#define REMOTE_CAP_KEYBOARD_INPUT        0x00001000UL
#define REMOTE_CAP_SAVED_WIFI_PROFILES   0x00002000UL

#define TCP_CONTROL_CAPABILITIES  (REMOTE_CAP_BLE_CONTROL_V1 | \
                                   REMOTE_CAP_BLE_LEGACY_INPUT | \
                                   REMOTE_CAP_WIFI_TCP_CONTROL_V1 | \
                                   REMOTE_CAP_WIFI_UDP_MOTION_V1 | \
                                   REMOTE_CAP_TINYUSB_HIGH_RATE_HID | \
                                   REMOTE_CAP_OWNER_SESSION | \
                                   REMOTE_CAP_RELEASE_ALL | \
                                   REMOTE_CAP_OWNER_HEARTBEAT | \
                                   REMOTE_CAP_BLE_WIFI_PROVISIONING | \
                                   REMOTE_CAP_MOUSE_BUTTONS | \
                                   REMOTE_CAP_WHEEL_INPUT | \
                                   REMOTE_CAP_KEYBOARD_INPUT | \
                                   REMOTE_CAP_SAVED_WIFI_PROFILES)

#define BLE_DEVICE_NAME           "ESP_MouseBridge"
#define BLE_SERVICE_UUID          "00001234-0000-1000-8000-00805f9b34fb"
#define BLE_RX_CHARACTERISTIC_UUID "0000abcd-0000-1000-8000-00805f9b34fb"
#define BLE_TX_CHARACTERISTIC_UUID "0000abce-0000-1000-8000-00805f9b34fb"
#define BLE_CONTROL_MARKER        0xF2
#define BLE_DEBUG_MOUSE_MARKER    0xA1
#define BLE_KEY_COMBO_MARKER      0xF1
#define BLE_CONTROL_FRAME_VERSION 1
#define BLE_CONTROL_MAX_PAYLOAD_LENGTH 180

// Optional local test knobs. Keep disabled in the normal production base.
#define HID_LOCAL_GENERATOR_TEST  0
#define HID_RELEASE_SELF_TEST     0

#define MOUSE_REPORT_ID           1
#define KEYBOARD_REPORT_ID        2
