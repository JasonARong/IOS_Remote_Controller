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

static WiFiUDP udpMotion;
static TaskHandle_t udpRxTaskHandle = nullptr;

static uint16_t readLe16(const uint8_t* bytes) {
  return (uint16_t)bytes[0] | ((uint16_t)bytes[1] << 8);
}

static uint32_t readLe32(const uint8_t* bytes) {
  return (uint32_t)bytes[0] |
         ((uint32_t)bytes[1] << 8) |
         ((uint32_t)bytes[2] << 16) |
         ((uint32_t)bytes[3] << 24);
}

// Connect to WIFI_SSID and bind UDP_MOTION_PORT; returns false if Wi-Fi or bind fails.
bool setupUdpMotion() {
  Serial.println("🔧 Initializing UDP motion...");
  if (strlen(WIFI_SSID) == 0) {
    Serial.println("⚠️ WIFI_SSID empty; UDP motion disabled.");
    return false;
  }

  WiFi.mode(WIFI_STA);
  WiFi.setSleep(false);
  esp_wifi_set_ps(WIFI_PS_NONE);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);

  Serial.printf("📡 Connecting to Wi-Fi SSID: %s", WIFI_SSID);
  uint32_t startMs = millis();
  while (WiFi.status() != WL_CONNECTED && (millis() - startMs) < 10000) {
    delay(250);
    Serial.print(".");
  }
  Serial.println();

  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("⚠️ Wi-Fi connection failed; UDP motion inactive.");
    return false;
  }

  if (udpMotion.begin(UDP_MOTION_PORT) == 1) {
    Serial.printf("✅ UDP motion listening on %s:%u\n",
                  WiFi.localIP().toString().c_str(),
                  (unsigned int)UDP_MOTION_PORT);
    return true;
  }
  Serial.println("⚠️ UDP motion listener failed to start.");
  return false;
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
