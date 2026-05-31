// UdpMotion.h — Wi-Fi STA connect and UDP listener for iOS pointer motion datagrams.
// Parsed subframes are staged via HidState::stagePointerMotion → MotionQueue.

#pragma once

#include <Arduino.h>

bool setupUdpMotion();
void startUdpRxTask();
