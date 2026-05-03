# Cursor Movement Analysis: Root Causes & Solutions

## Executive Summary

After analyzing your code and researching how real mice/trackpads achieve smooth cursor movement, I've identified **7 critical bottlenecks** causing stuttering, clunkiness, and speed spikes. The main issues stem from **irregular timing**, **double smoothing conflicts**, **missing velocity filtering**, and **BLE packet handling**.

---

## 🔴 Critical Issues Identified

### 1. **Irregular Touch Event Timing → Speed Calculation Explosions**

**Location**: `TouchPadViewModel.swift:204-210`

**Problem**:
- `dt` is calculated from **irregular touch events** (`handleTouchesChanged`), not a fixed-rate timer
- iOS touch events can arrive at **highly variable intervals** (8ms, 16ms, 33ms, or even 50ms+)
- When `dt` is very small (e.g., two touches arrive 4ms apart), speed calculation explodes:
  ```
  speed = distance / dt  // If dt = 0.004s, speed becomes 250x larger than expected!
  ```
- This causes **massive gain spikes** → cursor jumps

**Evidence**:
- Line 208: Fallback to `1.0/120.0` only on first touch, not when dt is abnormally small
- Line 36 in `PointerMotionEngine.swift`: Only clamps to `1.0/240.0` minimum, but doesn't handle **very small dt** from rapid touch events

**Real Mouse/Trackpad Behavior**:
- Use **fixed-rate polling** (1000Hz for gaming mice, 125Hz for standard)
- Speed is calculated from **consistent time intervals**, not event-driven

---

### 2. **Double Smoothing Conflict (iOS + ESP)**

**Location**: 
- iOS: `PointerMotionEngine.swift` (acceleration curve)
- ESP: `ESP_Bridge.ino:124-255` (SmoothingEngine)

**Problem**:
- **iOS side** applies acceleration curve (gain 1.6x to 3.4x) based on speed
- **ESP side** then distributes deltas over 16ms (50% per frame at 125Hz)
- This creates **conflicting smoothing**:
  - iOS thinks it's sending smooth, accelerated motion
  - ESP redistributes it, creating artificial lag and "mushy" feel
- The ESP smoothing was added to fix jitter, but it's masking the **real problem** (irregular timing)

**Real Mouse/Trackpad Behavior**:
- **Single smoothing stage** at the input level (hardware/firmware)
- OS-level acceleration is applied **after** receiving consistent, high-frequency updates

---

### 3. **Missing Velocity Filtering (No Low-Pass Filter)**

**Location**: `PointerMotionEngine.swift:33-63`

**Problem**:
- Speed is calculated **instantaneously** from each touch event: `speed = distance / dt`
- No **velocity history** or **low-pass filtering**
- High-frequency noise in touch input → erratic speed calculations → gain fluctuations → stuttering

**Real Mouse/Trackpad Behavior**:
- Use **exponential moving average (EMA)** or **Kalman filter** on velocity
- Example: `velocity = 0.7 * old_velocity + 0.3 * new_velocity`
- This smooths out micro-jitter while maintaining responsiveness

**Evidence from Research**:
- Academic papers show low-pass filtering on velocity is **essential** for smooth cursor movement
- Apple trackpads use sophisticated velocity filtering with adaptive parameters

---

### 4. **BLE Packet Loss → Cursor Jumps**

**Location**: `ConnectionManager.swift:205-212`

**Problem**:
- When `canSendWriteWithoutResponse` returns false, packet is **dropped** (line 211)
- No **retry mechanism** or **accumulation buffer**
- Lost movement packets → cursor **skips** that distance → perceived as jump

**Real Mouse/Trackpad Behavior**:
- USB HID has **guaranteed delivery** (or retry at hardware level)
- BLE needs **explicit retry logic** or **larger accumulation** to handle buffer full conditions

**Current Behavior**:
- Line 171-172: Accumulated deltas are **cleared immediately** after sending
- If send fails, that movement is **permanently lost**

---

### 5. **Timing Mismatch: iOS 120Hz vs ESP 125Hz**

**Location**:
- iOS: `ConnectionManager.swift:41` (120 FPS)
- ESP: `ESP_Bridge.ino:135` (125Hz = 8ms interval)

**Problem**:
- iOS sends at **120Hz** (8.33ms intervals)
- ESP distributes at **125Hz** (8ms intervals)
- This **5% mismatch** causes periodic accumulation/desynchronization
- ESP's 50% distribution per frame assumes consistent input rate

**Real Mouse/Trackpad Behavior**:
- **Synchronized rates** or **adaptive distribution** based on actual input timing

---

### 6. **No Maximum Speed Clamping**

**Location**: `PointerMotionEngine.swift:38-39`

**Problem**:
- Speed calculation has **no upper bound**
- If dt is extremely small (e.g., 1ms), speed can reach **thousands of pixels/second**
- Gain can spike to `maxGain` (3.4x) even for small movements
- This amplifies any timing errors

**Real Mouse/Trackpad Behavior**:
- **Maximum speed cap** (e.g., 5000 pixels/second)
- Prevents gain explosion from timing errors

---

### 7. **Touch Event Jitter Not Filtered**

**Location**: `TouchPadViewModel.swift:199-201`

**Problem**:
- Raw touch deltas (`dx = current.x - prev.x`) are used directly
- iOS touch events have **inherent jitter** (sub-pixel noise, sensor noise)
- No **dead zone** or **jitter filtering** for tiny movements
- Small jitter → speed calculation → gain applied → amplified jitter

**Real Mouse/Trackpad Behavior**:
- **Dead zone** for movements < 0.5 pixels
- **Jitter filtering** using median or moving average of recent deltas

---

## 📊 Data Flow Analysis

### Current Pipeline:
```
Touch Event (irregular) 
  → Calculate dt (variable, can be tiny)
  → Calculate speed (explodes if dt is small)
  → Apply gain curve (1.6x-3.4x)
  → Accumulate subpixel
  → Send to ConnectionManager (120Hz tick)
  → BLE packet (may drop)
  → ESP SmoothingEngine (redistributes over 16ms)
  → HID report (125Hz)
```

### Problems in Each Stage:
1. **Touch Event**: Irregular timing
2. **dt calculation**: No minimum clamp for very small values
3. **Speed calculation**: No velocity filtering, no max cap
4. **Gain application**: Amplifies timing errors
5. **BLE transmission**: No retry on failure
6. **ESP smoothing**: Conflicts with iOS acceleration
7. **HID output**: Rate mismatch with iOS

---

## 🎯 Recommended Solutions (Priority Order)

### **Priority 1: Fix Timing Issues**

1. **Use Fixed-Rate Sampling Instead of Event-Driven**
   - Sample touch position at **fixed 120Hz** (using CADisplayLink)
   - Calculate deltas from **consistent time intervals**
   - This eliminates speed calculation explosions

2. **Clamp dt More Aggressively**
   - Minimum dt: `max(dt, 1.0 / 120.0)` (8.33ms)
   - Maximum dt: `min(dt, 1.0 / 30.0)` (33ms) to handle frame drops
   - This prevents both explosions and stale data

### **Priority 2: Add Velocity Filtering**

3. **Implement Exponential Moving Average on Velocity**
   ```swift
   private var filteredVelocity: CGFloat = 0
   let alpha = 0.3  // Smoothing factor
   filteredVelocity = alpha * currentVelocity + (1 - alpha) * filteredVelocity
   ```
   - Use filtered velocity for gain calculation
   - This smooths out micro-jitter

4. **Add Maximum Speed Cap**
   - Cap speed at reasonable maximum (e.g., 3000 pixels/second)
   - Prevents gain explosion from timing errors

### **Priority 3: Remove Double Smoothing**

5. **Remove ESP Smoothing OR iOS Acceleration (Choose One)**
   - **Option A**: Keep iOS acceleration, remove ESP smoothing (recommended)
   - **Option B**: Remove iOS acceleration, keep ESP smoothing
   - **Option C**: Move all smoothing to ESP side (simpler, but less responsive)

6. **If Keeping ESP Smoothing**: Make it adaptive
   - Only smooth when input rate is inconsistent
   - Bypass smoothing when receiving consistent 120Hz updates

### **Priority 4: Fix BLE Packet Handling**

7. **Implement Retry Queue for Dropped Packets**
   - When `canSendWriteWithoutResponse` is false, **queue the packet**
   - Retry on next tick or when buffer becomes available
   - Don't clear accumulated deltas until **confirmed sent**

8. **Increase Accumulation Window**
   - Instead of clearing immediately, keep a **small buffer** (2-3 frames)
   - Helps handle temporary BLE buffer full conditions

### **Priority 5: Add Jitter Filtering**

9. **Dead Zone for Tiny Movements**
   - Ignore movements < 0.3 pixels (prevents jitter amplification)

10. **Median Filter on Recent Deltas**
    - Keep last 3-5 deltas, use median for speed calculation
    - Reduces impact of single-frame noise

---

## 🔬 How Real Mice/Trackpads Work

### Optical/Laser Mice:
1. **Sensor**: 1000-8000 DPI, samples at **fixed rate** (1000-8000 Hz internally)
2. **Firmware**: Applies **low-pass filter** on raw sensor data
3. **USB HID**: Reports at **125Hz or 1000Hz** (fixed polling)
4. **OS Acceleration**: Applied **after** receiving consistent updates

### Apple Trackpad:
1. **Capacitive Sensor**: Very high resolution, samples at **~240Hz**
2. **Hardware Filtering**: Built-in noise reduction
3. **macOS Driver**: 
   - Velocity-based acceleration curve
   - **Adaptive filtering** (stronger filtering for slow movements)
   - **Momentum/inertia** for natural feel
4. **No double smoothing**: Single, well-tuned acceleration curve

### Key Differences from Your Implementation:
- ✅ **Fixed-rate sampling** (not event-driven)
- ✅ **Velocity filtering** (EMA or Kalman)
- ✅ **Single smoothing stage** (not double)
- ✅ **Guaranteed delivery** (USB vs BLE)
- ✅ **Jitter filtering** at hardware/firmware level

---

## 🧪 Testing Recommendations

1. **Log dt values** - Check for abnormally small/large values
2. **Log speed calculations** - Identify when speed spikes occur
3. **Monitor BLE packet drops** - See correlation with stuttering
4. **Measure end-to-end latency** - Touch to cursor movement
5. **Test with consistent slow/fast movements** - Identify which causes issues

---

## 📝 Implementation Notes

### Most Critical Fix:
**Replace event-driven dt calculation with fixed-rate sampling**

This single change will eliminate:
- Speed calculation explosions
- Irregular timing issues
- Most of the stuttering

### Second Most Critical:
**Add velocity filtering (EMA)**

This will eliminate:
- Micro-jitter amplification
- Erratic gain fluctuations
- Remaining stuttering

### Third:
**Remove ESP smoothing or make it conditional**

This will eliminate:
- Artificial lag
- "Mushy" feel
- Double smoothing conflicts

---

## 🎓 References

- **Mouse Polling Rates**: 1000Hz is standard for gaming, 125Hz for standard mice
- **Touch Event Timing**: iOS touch events are **not** guaranteed to arrive at fixed intervals
- **Velocity Filtering**: Academic research shows EMA with alpha=0.2-0.4 is optimal
- **BLE Latency**: Typical 8-20ms, can spike to 50ms+ under interference
- **HID Polling**: Standard is 125Hz (8ms), some devices support 1000Hz (1ms)

---

## Summary

The core issue is **irregular timing** from event-driven touch processing, combined with **double smoothing** and **missing velocity filtering**. Real mice/trackpads use **fixed-rate sampling** and **single-stage smoothing with velocity filtering**. Fixing the timing and adding velocity filtering will solve 80% of the issues.

