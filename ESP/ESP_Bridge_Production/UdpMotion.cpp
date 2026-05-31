// UdpMotion.cpp — receive UDP motion packets on core 0, validate layout, enqueue deltas.
// Packet layout: [marker][reserved][frameCount] then frameCount × (dx, dy) int16 LE.

#include "UdpMotion.h"

#include <WiFi.h>
#include <WiFiUdp.h>
#include <esp_wifi.h>

#include "Config.h"
#include "Diagnostics.h"
#include "HidState.h"

static WiFiUDP udpMotion;
static TaskHandle_t udpRxTaskHandle = nullptr;

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
  uint8_t packet[3 + UDP_SUBFRAMES_PER_PACKET * 4];

  while (true) {
    int packetSize = udpMotion.parsePacket();
    if (packetSize <= 0) return;

    diag.udpRawPackets++;

    int readLen = udpMotion.read(packet, sizeof(packet));
    if (readLen <= 0) {
      diag.udpMalformed++;
      continue;
    }

    if (packet[0] != UDP_MOTION_PACKET_MARKER) {
      diag.udpMalformed++;
      continue;
    }

    // Minimum datagram: header (3) + one subframe (4).
    if (packetSize < 7 || readLen < 7) {
      diag.udpMalformed++;
      continue;
    }

    uint8_t frameCount = packet[2];
    size_t expectedLen = 3 + ((size_t)frameCount * 4);
    if (frameCount == 0 ||
        frameCount > UDP_SUBFRAMES_PER_PACKET ||
        (size_t)packetSize != expectedLen ||
        (size_t)readLen != expectedLen) {
      diag.udpMalformed++;
      continue;
    }

    diag.udpDatagrams++;
    diag.udpSubframes += frameCount;

    for (uint8_t i = 0; i < frameCount; i++) {
      size_t offset = 3 + ((size_t)i * 4);
      int16_t dx = (int16_t)(packet[offset]     | (packet[offset + 1] << 8));
      int16_t dy = (int16_t)(packet[offset + 2] | (packet[offset + 3] << 8));
      bool overflow = false;
      uint8_t depth = stagePointerMotion(dx, dy, &overflow);
      if (overflow) diag.udpQueueOverflow++;
      if (depth > diag.udpQueueDepthMax) diag.udpQueueDepthMax = depth;
    }
  }
}

static void udpRxTask(void* /*parameter*/) {
  Serial.println("🚦 udp-rx task running on core 0");
  while (true) {
    diag.udpRxIters++;
    pollUdpMotionPackets();
    vTaskDelay(pdMS_TO_TICKS(1));
  }
}

// High-priority RX on core 0; HID pacer stays on core 1.
void startUdpRxTask() {
  if (udpRxTaskHandle != nullptr) return;
  BaseType_t created = xTaskCreatePinnedToCore(
    udpRxTask,
    "udp-rx",
    4096,
    nullptr,
    4,
    &udpRxTaskHandle,
    0
  );
  if (created != pdPASS) {
    udpRxTaskHandle = nullptr;
    Serial.println("⚠️ Failed to create udp-rx task; UDP motion will be inactive.");
  }
}
