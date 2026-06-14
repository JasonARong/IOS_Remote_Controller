// UdpMotion.cpp — receive gated UDP motion packets on core 0 and enqueue deltas.
// Packet layout: marker, version, sessionId, udpToken, packetSeq, inputEpoch,
// frameCount, then one (dx, dy) int16 LE frame.

#include "UdpMotion.h"

#include <WiFi.h>
#include <WiFiUdp.h>
#include <esp_wifi.h>

#include "Config.h"
#include "Diagnostics.h"
#include "HidState.h"
#include "OwnerSession.h"
#include "PersistentStore.h"

static WiFiUDP udpMotion;
static TaskHandle_t udpRxTaskHandle = nullptr;
static bool udpMotionListening = false;

static uint16_t readLe16(const uint8_t* bytes) {
  return (uint16_t)bytes[0] | ((uint16_t)bytes[1] << 8);
}

static uint32_t readLe32(const uint8_t* bytes) {
  return (uint32_t)bytes[0] |
         ((uint32_t)bytes[1] << 8) |
         ((uint32_t)bytes[2] << 16) |
         ((uint32_t)bytes[3] << 24);
}

static bool connectWifiCredential(const char* ssid, const char* password) {
  if (ssid == nullptr || ssid[0] == '\0') return false;

  WiFi.begin(ssid, password == nullptr ? "" : password);

  Serial.printf("📡 Connecting to Wi-Fi SSID: %s", ssid);
  uint32_t startMs = millis();
  while (WiFi.status() != WL_CONNECTED && (millis() - startMs) < 10000) {
    delay(250);
    Serial.print(".");
  }
  Serial.println();

  return WiFi.status() == WL_CONNECTED;
}

static bool connectStoredWifiProfiles() {
  uint8_t count = getStoredWifiProfileCount();
  for (uint8_t i = 0; i < count; i++) {
    StoredWifiProfile profile;
    if (!getStoredWifiProfile(i, &profile)) continue;
    if (connectWifiCredential(profile.ssid, profile.password)) return true;
    WiFi.disconnect(true);
    delay(100);
  }
  return false;
}

bool ensureUdpMotionListening() {
  if (udpMotionListening) return true;
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("⚠️ Wi-Fi connection failed; UDP motion inactive.");
    return false;
  }

  if (udpMotion.begin(UDP_MOTION_PORT) == 1) {
    udpMotionListening = true;
    Serial.printf("✅ UDP motion listening on %s:%u\n",
                  WiFi.localIP().toString().c_str(),
                  (unsigned int)UDP_MOTION_PORT);
    return true;
  }
  Serial.println("⚠️ UDP motion listener failed to start.");
  return false;
}

bool isUdpMotionListening() {
  return udpMotionListening;
}

static void prepareWifiStation() {
  WiFi.mode(WIFI_STA);
  WiFi.setSleep(false);
  esp_wifi_set_ps(WIFI_PS_NONE);
}

// Connect to stored Wi-Fi or WIFI_SSID fallback and bind UDP_MOTION_PORT.
bool setupUdpMotion() {
  Serial.println("🔧 Initializing UDP motion...");
  prepareWifiStation();

  if (!connectStoredWifiProfiles()) {
    if (strlen(WIFI_SSID) == 0) {
      Serial.println("⚠️ No stored Wi-Fi profiles and WIFI_SSID empty; UDP motion disabled.");
      return false;
    }
    if (!connectWifiCredential(WIFI_SSID, WIFI_PASSWORD)) {
      Serial.println("⚠️ Wi-Fi connection failed; UDP motion inactive.");
      return false;
    }
  }

  return ensureUdpMotionListening();
}

bool connectWifiForProvisioning(const char* ssid, const char* password,
                                bool saveProfile) {
  prepareWifiStation();
  udpMotion.stop();
  udpMotionListening = false;
  WiFi.disconnect(true);
  delay(100);
  if (!connectWifiCredential(ssid, password)) return false;
  if (saveProfile && !saveStoredWifiProfile(ssid, password)) return false;
  return ensureUdpMotionListening();
}

// Drain all pending datagrams in one call (invoked from udp-rx task each iteration).
static void pollUdpMotionPackets() {
  uint8_t packet[UDP_MOTION_PACKET_LENGTH];

  while (true) {
    int packetSize = udpMotion.parsePacket();
    if (packetSize <= 0) return;

    diag.udpRawPackets++;

    int readLen = udpMotion.read(packet, sizeof(packet));
    if (readLen <= 0) {
      diag.udpMalformed++;
      continue;
    }

    if (packetSize != UDP_MOTION_PACKET_LENGTH ||
        readLen != UDP_MOTION_PACKET_LENGTH ||
        packet[0] != UDP_MOTION_PACKET_MARKER ||
        packet[1] != UDP_MOTION_PACKET_VERSION ||
        packet[16] != UDP_MOTION_FRAME_COUNT) {
      diag.udpMalformed++;
      continue;
    }

    uint32_t sessionId = readLe32(&packet[2]);
    uint32_t udpToken = readLe32(&packet[6]);
    uint16_t packetSeq = readLe16(&packet[10]);
    uint32_t inputEpoch = readLe32(&packet[12]);
    uint32_t remoteIpv4 = (uint32_t)udpMotion.remoteIP();

    (void)packetSeq;
    if (!acceptWifiUdpMotionForOwner(sessionId, udpToken, inputEpoch,
                                     remoteIpv4, millis())) {
      diag.udpGateRejected++;
      continue;
    }

    diag.udpDatagrams++;
    diag.udpSubframes++;

    int16_t dx = (int16_t)readLe16(&packet[17]);
    int16_t dy = (int16_t)readLe16(&packet[19]);
    bool overflow = false;
    uint8_t depth = stagePointerMotion(dx, dy, &overflow);
    if (overflow) diag.udpQueueOverflow++;
    if (depth > diag.udpQueueDepthMax) diag.udpQueueDepthMax = depth;
  }
}

static void udpRxTask(void* /*parameter*/) {
  Serial.println("🚦 udp-rx task running on core 0");
  while (true) {
    diag.udpRxIters++;
    pollUdpMotionPackets();
    vTaskDelay(pdMS_TO_TICKS(UDP_RX_TASK_INTERVAL_MS));
  }
}

// High-priority RX on core 0; HID pacer stays on core 1.
void startUdpRxTask() {
#if !UDP_RX_TASK_ENABLED
  Serial.println("🧪 udp-rx task disabled by UDP_RX_TASK_ENABLED=0 for TCP isolation test");
  return;
#endif
  if (udpRxTaskHandle != nullptr) return;
  BaseType_t created = xTaskCreatePinnedToCore(
    udpRxTask,
    "udp-rx",
    4096,
    nullptr,
    UDP_RX_TASK_PRIORITY,
    &udpRxTaskHandle,
    0
  );
  if (created != pdPASS) {
    udpRxTaskHandle = nullptr;
    Serial.println("⚠️ Failed to create udp-rx task; UDP motion will be inactive.");
  }
}
