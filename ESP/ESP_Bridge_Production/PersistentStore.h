// PersistentStore.h — NVS-backed Wi-Fi profile and pairing identity storage.

#pragma once

#include <Arduino.h>

#define PERSISTENT_MAX_WIFI_PROFILES 5
#define PERSISTENT_MAX_SSID_LENGTH 32
#define PERSISTENT_MAX_WIFI_PASSWORD_LENGTH 64
#define PERSISTENT_MAX_DEVICE_ID_LENGTH 31
#define PERSISTENT_MAX_PAIRING_SECRET_LENGTH 64
#define PERSISTENT_MAX_PHONE_ID_LENGTH 64

struct StoredWifiProfile {
  char ssid[PERSISTENT_MAX_SSID_LENGTH + 1] = {0};
  char password[PERSISTENT_MAX_WIFI_PASSWORD_LENGTH + 1] = {0};
};

void setupPersistentStore();
bool getPersistentDeviceId(char* out, size_t capacity);

uint8_t getStoredWifiProfileCount();
bool getStoredWifiProfile(uint8_t index, StoredWifiProfile* out);
bool saveStoredWifiProfile(const char* ssid, const char* password);
bool forgetStoredWifiProfile(const char* ssid);
void clearStoredWifiProfiles();

bool hasStoredPairingIdentity();
bool saveStoredPairingIdentity(uint32_t phoneIdHash, const char* phoneId,
                               const char* pairingSecret);
bool validateStoredPairingProof(uint32_t phoneIdHash, const uint8_t* proof,
                                uint8_t proofLength);
void clearStoredPairingIdentity();
