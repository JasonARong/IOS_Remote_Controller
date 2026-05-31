// MotionQueue.h — thread-safe ring buffer between UDP ingress and the HID pacer.
// Frames carry raw pointer deltas plus enqueue time for stale-frame dropping.

#pragma once

#include <Arduino.h>

// One pointer delta waiting to be consumed by the HID pacer task.
struct MotionFrame {
  int16_t dx;
  int16_t dy;
  uint32_t enqueuedUs;
};

void resetMotionFrameQueue();
// Returns queue depth after enqueue; sets overflowOut when the oldest frame was dropped.
uint8_t enqueueMotionFrame(int16_t dx, int16_t dy, bool* overflowOut);
// Pops the oldest non-stale frame; drops older frames past UDP_FRAME_STALE_US.
bool popFreshMotionFrame(MotionFrame* frameOut, uint32_t nowUs,
                         uint32_t* staleDropsOut, uint8_t* depthOut);
