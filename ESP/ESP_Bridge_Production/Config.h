// Config.h — compile-time constants for Wi-Fi, UDP motion, HID pacing, and USB.
// Values here must stay aligned with the iOS RemoteController sender (see POINTER_SCALE).

#pragma once

#include <Arduino.h>

/************** CONFIG **************/
#define WIFI_SSID                 "LOSUS WIFI_0122"
#define WIFI_PASSWORD             "66668888"

#define UDP_MOTION_PORT           4210
#define UDP_MOTION_PACKET_MARKER  0xB2
// Max subframes per UDP datagram. Must be >= UDPMotionSender.maxSubframesPerDatagram.
// Current iOS sender ships one subframe per datagram. The receiver accepts
// more so old lab senders and future batching tests remain parseable.
#define UDP_SUBFRAMES_PER_PACKET  8

#define UDP_FRAME_QUEUE_SIZE      32
#define UDP_FRAME_STALE_US        48000UL

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

#define DIAGNOSTICS_INTERVAL_MS   1000

#define OWNER_HEARTBEAT_TIMEOUT_MS 1500
#define OWNER_SESSION_INITIAL_EPOCH 1

#define TCP_CONTROL_PORT          4211
#define TCP_CONTROL_MAGIC         0x5243
#define TCP_CONTROL_FRAME_VERSION 1
#define TCP_CONTROL_PROTOCOL_VERSION 1
#define TCP_CONTROL_MAX_PAYLOAD_LENGTH 1024
#define TCP_CONTROL_FIRMWARE_VERSION "esp-production-3.5"

#define TCP_CAP_WIFI_CONTROL      0x00000001UL
#define TCP_CAP_UDP_MOTION        0x00000002UL
#define TCP_CAP_MOUSE_BUTTONS     0x00000004UL
#define TCP_CAP_WHEEL             0x00000008UL
#define TCP_CAP_KEYBOARD          0x00000010UL
#define TCP_CAP_RELEASE_ALL       0x00000020UL
#define TCP_CAP_STATUS            0x00000040UL
#define TCP_CAP_SETUP_ADMIN       0x00000080UL
#define TCP_CONTROL_CAPABILITIES  (TCP_CAP_WIFI_CONTROL | TCP_CAP_UDP_MOTION | \
                                   TCP_CAP_MOUSE_BUTTONS | TCP_CAP_WHEEL | \
                                   TCP_CAP_KEYBOARD | TCP_CAP_RELEASE_ALL | \
                                   TCP_CAP_STATUS | TCP_CAP_SETUP_ADMIN)

// Optional local test knobs. Keep disabled in the normal production base.
#define HID_LOCAL_GENERATOR_TEST  0
#define HID_RELEASE_SELF_TEST     0

#define MOUSE_REPORT_ID           1
#define KEYBOARD_REPORT_ID        2
