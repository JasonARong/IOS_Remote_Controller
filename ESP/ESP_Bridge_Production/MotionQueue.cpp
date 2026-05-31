// MotionQueue.cpp — ISR-safe FIFO for motion subframes from UDP to HID pacer.
// Overflow drops the oldest entry so the bridge always keeps the newest motion.

#include "MotionQueue.h"

#include "Config.h"

static MotionFrame motionFrameQueue[UDP_FRAME_QUEUE_SIZE];
static volatile uint8_t motionFrameHead = 0;
static volatile uint8_t motionFrameTail = 0;
static volatile uint8_t motionFrameCount = 0;
static portMUX_TYPE motionFrameQueueMux = portMUX_INITIALIZER_UNLOCKED;

// Clears the queue (e.g. on release-all or startup).
void resetMotionFrameQueue() {
  portENTER_CRITICAL(&motionFrameQueueMux);
  motionFrameHead = 0;
  motionFrameTail = 0;
  motionFrameCount = 0;
  portEXIT_CRITICAL(&motionFrameQueueMux);
}

// Enqueue one motion subframe; on full queue, evict oldest (drop-oldest policy).
uint8_t enqueueMotionFrame(int16_t dx, int16_t dy, bool* overflowOut) {
  bool overflow = false;
  uint32_t nowUs = micros();

  portENTER_CRITICAL(&motionFrameQueueMux);
  if (motionFrameCount >= UDP_FRAME_QUEUE_SIZE) {
    // Queue full: advance head to discard oldest before writing tail.
    motionFrameHead = (motionFrameHead + 1) % UDP_FRAME_QUEUE_SIZE;
    motionFrameCount--;
    overflow = true;
  }

  motionFrameQueue[motionFrameTail] = {dx, dy, nowUs};
  motionFrameTail = (motionFrameTail + 1) % UDP_FRAME_QUEUE_SIZE;
  motionFrameCount++;
  uint8_t depth = motionFrameCount;
  portEXIT_CRITICAL(&motionFrameQueueMux);

  if (overflowOut != nullptr) *overflowOut = overflow;
  return depth;
}

// Dequeue the next frame that is still within UDP_FRAME_STALE_US of nowUs.
bool popFreshMotionFrame(MotionFrame* frameOut, uint32_t nowUs,
                         uint32_t* staleDropsOut, uint8_t* depthOut) {
  bool hasFrame = false;
  uint32_t staleDrops = 0;
  uint8_t depth = 0;

  portENTER_CRITICAL(&motionFrameQueueMux);
  while (motionFrameCount > 0) {
    MotionFrame candidate = motionFrameQueue[motionFrameHead];
    // Skip frames that sat too long — host would see a burst if we sent them now.
    if ((uint32_t)(nowUs - candidate.enqueuedUs) > UDP_FRAME_STALE_US) {
      motionFrameHead = (motionFrameHead + 1) % UDP_FRAME_QUEUE_SIZE;
      motionFrameCount--;
      staleDrops++;
      continue;
    }
    *frameOut = candidate;
    motionFrameHead = (motionFrameHead + 1) % UDP_FRAME_QUEUE_SIZE;
    motionFrameCount--;
    hasFrame = true;
    break;
  }
  depth = motionFrameCount;
  portEXIT_CRITICAL(&motionFrameQueueMux);

  if (staleDropsOut != nullptr) *staleDropsOut = staleDrops;
  if (depthOut != nullptr) *depthOut = depth;
  return hasFrame;
}
