//
//  PointerMotionEngine.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/11/29.
//

import Foundation
import CoreGraphics

final class PointerMotionEngine {
    /// Resolution multiplier shared by both the UDP sender and the ESP HID
    /// pacer. Multiplying motion before quantization eliminates the
    /// "round-to-zero" gap on slow drags so the iOS subframe stream stays
    /// uniform; ESP_Bridge.ino divides by POINTER_SCALE (with fractional
    /// remainder) at HID emit time so host-perceived sensitivity is unchanged.
    /// Must equal POINTER_SCALE in the active ESP firmware sketch
    /// (ESP_Bridge.ino or ESP_Bridge_TinyUSB.ino).
    static let pointerScale: CGFloat = 8

    private let connection: ConnectionManager
    private let settings: MotionCurveSettings
    
    // Subpixel accumulators so tiny movements aren't lost
    private var accumX: CGFloat = 0
    private var accumY: CGFloat = 0
    private var filteredSpeed: CGFloat = 0

    private let minDt: CFTimeInterval = 1.0 / 90.0
    private let maxDt: CFTimeInterval = 1.0 / 30.0
    private let velocityAlpha: CGFloat = 0.35
    private let maxSpeedForGain: CGFloat = 1800
    // Capped against the new ESP-side scaled-units cap (127). Outputs from
    // scaledRawDelta are pre-multiplied by pointerScale, so this is also
    // the per-call cap in scaled units.
    private let maxReportDelta: CGFloat = 127
    
    init (
        connection: ConnectionManager,
        settings: MotionCurveSettings = PointerMotionEngine.defaultSettings
    ) {
        self.connection = connection
        self.settings = settings
    }
    
    /// Apply raw pointer delta from the touchpad, with a time delta for speed-based acceleration.
    ///
    /// - Parameters:
    ///   - dx: Raw horizontal delta from touch (in points / pixels).
    ///   - dy: Raw vertical delta from touch.
    ///   - dt: Time since last pointer update (seconds). Use a small fallback if unknown.
    func applyRawDelta(dx: CGFloat, dy: CGFloat, dt: CFTimeInterval) {
        guard let scaledDelta = scaledRawDelta(dx: dx, dy: dy, dt: dt) else { return }
        
        // Accumulate subpixel motion
        accumX += scaledDelta.dx
        accumY += scaledDelta.dy
        // Quantize to whole units to send to the ESP bridge
        // Use standard rounding instead of towardZero to preserve small movements
        let sendDx = max(-maxReportDelta, min(maxReportDelta, accumX.rounded()))
        let sendDy = max(-maxReportDelta, min(maxReportDelta, accumY.rounded()))
        
        // Keep the fractional remainder
        accumX -= sendDx
        accumY -= sendDy
        
        // Send to ConnectionManager
        if sendDx != 0 || sendDy != 0 {
            MovementDiagnostics.shared.recordPointerEmit(dx: sendDx, dy: sendDy)
            connection.accumulateDelta(dx: sendDx, dy: sendDy) // Send to ConnectionManager
        }
    }

    func scaledRawDelta(dx: CGFloat, dy: CGFloat, dt: CFTimeInterval) -> CGVector? {
        guard dx != 0 || dy != 0 else { return nil }

        let safeDt = min(max(dt, minDt), maxDt)
        let distance = hypot(dx, dy)
        let instantaneousSpeed = min(distance / CGFloat(safeDt), maxSpeedForGain)
        filteredSpeed = velocityAlpha * instantaneousSpeed + (1 - velocityAlpha) * filteredSpeed

        // Velocity-based gain: precise at slow drags (baseGain), accelerated at
        // fast flicks (maxGain). This compensates for the lost macOS-side
        // pointer acceleration caused by switching from chunky 30 Hz HID
        // reports to smooth ~200 Hz reports -- macOS's accel curve underweights
        // small per-report deltas, so we restore the lost gain ourselves.
        let gain = motionGain(forSpeed: filteredSpeed, settings: settings)
        MovementDiagnostics.shared.recordPointerGain(speed: filteredSpeed, gain: gain, safeDt: safeDt)

        // Multiply by pointerScale so downstream UDP quantization keeps
        // sub-pixel motion. ESP applies the inverse divide before the HID
        // report leaves the pacer.
        let scale = gain * PointerMotionEngine.pointerScale
        return CGVector(dx: dx * scale, dy: dy * scale)
    }
    
    /// Reset any accumulated state when a gesture ends.
    func reset() {
        accumX = 0
        accumY = 0
        filteredSpeed = 0
    }
}

// MARK: - Default pointer curve
extension PointerMotionEngine {
    // Conservative starting gains. With the smooth-pipeline fixes (one
    // subframe per UDP packet + one frame per ESP pacer tick) macOS
    // pointer acceleration alone underweights our small per-report deltas;
    // these values restore most of the lost speed without going overboard.
    // Tune iteratively from logs: increase maxGain for faster flicks,
    // increase baseGain for slow-drag sensitivity.
    static let defaultSettings = MotionCurveSettings(
        minSpeed: 40,   // below this: pure baseGain (precise pointing)
        maxSpeed: 1400, // above this: pure maxGain (cross-screen flicks)
        baseGain: 2.2,  // slow drags slightly amplified vs. raw 1:1
        maxGain: 6.2,   // fast drags get the host-OS-style acceleration
        gamma: 0.9      // soft ramp -- low/mid speeds stay close to base
    )
}
