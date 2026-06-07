// PersistentStore.cpp — small Preferences/NVS persistence boundary.

#include "PersistentStore.h"

#include <Preferences.h>

static const char* STORE_NAMESPACE = "rcstore";
static const char* KEY_DEVICE_ID = "device_id";
static const char* KEY_WIFI_COUNT = "wifi_count";
static const char* KEY_PAIR_HASH = "pair_hash";
static const char* KEY_PAIR_PHONE = "pair_phone";
static const char* KEY_PAIR_SECRET = "pair_secret";

static bool copyCString(char* out, size_t capacity, const String& value) {
  if (out == nullptr || capacity == 0) return false;
  size_t copyLen = value.length();
  if (copyLen >= capacity) copyLen = capacity - 1;
  memcpy(out, value.c_str(), copyLen);
  out[copyLen] = '\0';
  return true;
}

static bool boundedText(const char* value, size_t maxLen) {
  if (value == nullptr || value[0] == '\0') return false;
  return strnlen(value, maxLen + 1) <= maxLen;
}

static String ssidKey(uint8_t index) {
  return String("ssid") + String(index);
}

static String passwordKey(uint8_t index) {
  return String("pass") + String(index);
}

static uint8_t readWifiCount(Preferences& prefs) {
  uint8_t count = prefs.getUChar(KEY_WIFI_COUNT, 0);
  if (count > PERSISTENT_MAX_WIFI_PROFILES) count = PERSISTENT_MAX_WIFI_PROFILES;
  return count;
}

static void writeWifiSlot(Preferences& prefs, uint8_t index,
                          const StoredWifiProfile& profile) {
  String ssid = ssidKey(index);
  String password = passwordKey(index);
  prefs.putString(ssid.c_str(), profile.ssid);
  prefs.putString(password.c_str(), profile.password);
}

static void clearWifiSlot(Preferences& prefs, uint8_t index) {
  String ssid = ssidKey(index);
  String password = passwordKey(index);
  prefs.remove(ssid.c_str());
  prefs.remove(password.c_str());
}

static void ensureDeviceId(Preferences& prefs) {
  if (prefs.isKey(KEY_DEVICE_ID)) return;

  uint64_t mac = ESP.getEfuseMac();
  uint32_t macHigh = (uint32_t)(mac >> 32);
  uint32_t macLow = (uint32_t)(mac & 0xffffffffUL);
  char generated[PERSISTENT_MAX_DEVICE_ID_LENGTH + 1];
  snprintf(generated, sizeof(generated), "ESP3-%04lX%08lX",
           (unsigned long)macHigh,
           (unsigned long)macLow);
  prefs.putString(KEY_DEVICE_ID, generated);
}

void setupPersistentStore() {
  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, false)) {
    Serial.println("⚠️ PersistentStore unavailable; using runtime defaults.");
    return;
  }
  ensureDeviceId(prefs);
  prefs.end();
}

bool getPersistentDeviceId(char* out, size_t capacity) {
  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, true)) return false;
  String value = prefs.getString(KEY_DEVICE_ID, "ESP3");
  prefs.end();
  return copyCString(out, capacity, value);
}

uint8_t getStoredWifiProfileCount() {
  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, true)) return 0;
  uint8_t count = readWifiCount(prefs);
  prefs.end();
  return count;
}

bool getStoredWifiProfile(uint8_t index, StoredWifiProfile* out) {
  if (out == nullptr || index >= PERSISTENT_MAX_WIFI_PROFILES) return false;

  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, true)) return false;
  uint8_t count = readWifiCount(prefs);
  if (index >= count) {
    prefs.end();
    return false;
  }

  String ssid = prefs.getString(ssidKey(index).c_str(), "");
  String password = prefs.getString(passwordKey(index).c_str(), "");
  prefs.end();

  if (ssid.length() == 0) return false;
  copyCString(out->ssid, sizeof(out->ssid), ssid);
  copyCString(out->password, sizeof(out->password), password);
  return true;
}

bool saveStoredWifiProfile(const char* ssid, const char* password) {
  if (!boundedText(ssid, PERSISTENT_MAX_SSID_LENGTH) ||
      password == nullptr ||
      strnlen(password, PERSISTENT_MAX_WIFI_PASSWORD_LENGTH + 1) >
          PERSISTENT_MAX_WIFI_PASSWORD_LENGTH) {
    return false;
  }

  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, false)) return false;

  uint8_t count = readWifiCount(prefs);
  uint8_t target = count;
  for (uint8_t i = 0; i < count; i++) {
    String existing = prefs.getString(ssidKey(i).c_str(), "");
    if (existing == ssid) {
      target = i;
      break;
    }
  }

  if (target == count) {
    if (count >= PERSISTENT_MAX_WIFI_PROFILES) {
      prefs.end();
      return false;
    }
    count++;
  }

  StoredWifiProfile profile;
  snprintf(profile.ssid, sizeof(profile.ssid), "%s", ssid);
  snprintf(profile.password, sizeof(profile.password), "%s", password);
  writeWifiSlot(prefs, target, profile);
  prefs.putUChar(KEY_WIFI_COUNT, count);
  prefs.end();
  return true;
}

bool forgetStoredWifiProfile(const char* ssid) {
  if (!boundedText(ssid, PERSISTENT_MAX_SSID_LENGTH)) return false;

  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, false)) return false;

  uint8_t count = readWifiCount(prefs);
  StoredWifiProfile profiles[PERSISTENT_MAX_WIFI_PROFILES];
  uint8_t kept = 0;
  bool removed = false;

  for (uint8_t i = 0; i < count; i++) {
    String existingSsid = prefs.getString(ssidKey(i).c_str(), "");
    String existingPassword = prefs.getString(passwordKey(i).c_str(), "");
    if (existingSsid == ssid) {
      removed = true;
      continue;
    }
    if (existingSsid.length() == 0 || kept >= PERSISTENT_MAX_WIFI_PROFILES) continue;
    copyCString(profiles[kept].ssid, sizeof(profiles[kept].ssid), existingSsid);
    copyCString(profiles[kept].password, sizeof(profiles[kept].password), existingPassword);
    kept++;
  }

  if (removed) {
    for (uint8_t i = 0; i < PERSISTENT_MAX_WIFI_PROFILES; i++) clearWifiSlot(prefs, i);
    for (uint8_t i = 0; i < kept; i++) writeWifiSlot(prefs, i, profiles[i]);
    prefs.putUChar(KEY_WIFI_COUNT, kept);
  }

  prefs.end();
  return removed;
}

void clearStoredWifiProfiles() {
  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, false)) return;
  for (uint8_t i = 0; i < PERSISTENT_MAX_WIFI_PROFILES; i++) clearWifiSlot(prefs, i);
  prefs.putUChar(KEY_WIFI_COUNT, 0);
  prefs.end();
}

bool hasStoredPairingIdentity() {
  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, true)) return false;
  bool hasPairing = prefs.isKey(KEY_PAIR_HASH) && prefs.isKey(KEY_PAIR_SECRET);
  prefs.end();
  return hasPairing;
}

bool saveStoredPairingIdentity(uint32_t phoneIdHash, const char* phoneId,
                               const char* pairingSecret) {
  if (phoneIdHash == 0 ||
      !boundedText(phoneId, PERSISTENT_MAX_PHONE_ID_LENGTH) ||
      !boundedText(pairingSecret, PERSISTENT_MAX_PAIRING_SECRET_LENGTH)) {
    return false;
  }

  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, false)) return false;
  prefs.putUInt(KEY_PAIR_HASH, phoneIdHash);
  prefs.putString(KEY_PAIR_PHONE, phoneId);
  prefs.putString(KEY_PAIR_SECRET, pairingSecret);
  prefs.end();
  return true;
}

bool validateStoredPairingProof(uint32_t phoneIdHash, const uint8_t* proof,
                                uint8_t proofLength) {
  if (!hasStoredPairingIdentity()) return true;
  if (phoneIdHash == 0 || proof == nullptr ||
      proofLength == 0 ||
      proofLength > PERSISTENT_MAX_PAIRING_SECRET_LENGTH) {
    return false;
  }

  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, true)) return false;
  uint32_t storedHash = prefs.getUInt(KEY_PAIR_HASH, 0);
  String storedSecret = prefs.getString(KEY_PAIR_SECRET, "");
  prefs.end();

  if (storedHash != phoneIdHash || storedSecret.length() != proofLength) return false;
  return memcmp(storedSecret.c_str(), proof, proofLength) == 0;
}

void clearStoredPairingIdentity() {
  Preferences prefs;
  if (!prefs.begin(STORE_NAMESPACE, false)) return;
  prefs.remove(KEY_PAIR_HASH);
  prefs.remove(KEY_PAIR_PHONE);
  prefs.remove(KEY_PAIR_SECRET);
  prefs.end();
}
