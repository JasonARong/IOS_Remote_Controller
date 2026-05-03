//
//  PointerMotionEngine.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/11/29.
//

import Foundation
import CoreGraphics

final class PointerMotionEngine {
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
    private let rawModeGain: CGFloat = 1.15
    private let maxReportDelta: CGFloat = 32
    
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
        guard dx != 0 || dy != 0 else { return }

        let safeDt = min(max(dt, minDt), maxDt)

        let distance = hypot(dx, dy)
        let instantaneousSpeed = min(distance / CGFloat(safeDt), maxSpeedForGain)
        filteredSpeed = velocityAlpha * instantaneousSpeed + (1 - velocityAlpha) * filteredSpeed

        let gain = rawModeGain
        MovementDiagnostics.shared.recordPointerGain(speed: filteredSpeed, gain: gain, safeDt: safeDt)
        
        let scaledDx = dx * gain
        let scaledDy = dy * gain
        
        // Accumulate subpixel motion
        accumX += scaledDx
        accumY += scaledDy
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
    
    /// Reset any accumulated state when a gesture ends.
    func reset() {
        accumX = 0
        accumY = 0
        filteredSpeed = 0
    }
}

// MARK: - Default pointer curve
extension PointerMotionEngine {
    static let defaultSettings = MotionCurveSettings(
        minSpeed: 40,  // below this: baseGain
        maxSpeed: 1400, // above this: maxGain
        baseGain: 1.15, // slow movements gain
        maxGain: 1.15,  // raw-mode experiment: host OS handles acceleration
        gamma: 1.6     // soft ramp without hitting max too easily
    )
}
