// UdpMotion.h — Wi-Fi STA connect and UDP listener for iOS pointer motion datagrams.
// Parsed subframes are staged via HidState::stagePointerMotion → MotionQueue.

#pragma once

#include <Arduino.h>

bool setupUdpMotion();
bool connectWifiForProvisioning(const char* ssid, const char* password,
                                bool saveProfile);
bool ensureUdpMotionListening();
bool isUdpMotionListening();
void startUdpRxTask();
