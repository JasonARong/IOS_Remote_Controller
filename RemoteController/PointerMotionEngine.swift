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
        
        let safeDt = max(dt, 1.0 / 240.0) // avoid division by zero dt, assume 240 fps at worst
        let distance = hypot(dx, dy)
        let speed = distance / CGFloat(safeDt)  // "pixels per second"
        
        let gain = motionGain(forSpeed: speed, settings: settings) // Get the gain from MotionCurves
        
        let scaledDx = dx * gain
        let scaledDy = dy * gain
        
        // Accumulate subpixel motion
        accumX += scaledDx
        accumY += scaledDy
        // Quantize to whole units to send to the ESP bridge
        let sendDx = accumX.rounded(.towardZero)
        let sendDy = accumY.rounded(.towardZero)
        
        // Keep the fractional remainder
        accumX -= sendDx
        accumY -= sendDy
        
        // Send to ConnectionManager
        if sendDx != 0 || sendDy != 0 {
            connection.accumulateDelta(dx: sendDx, dy: sendDy)
        }
    }
    
    /// Reset any accumulated state when a gesture ends.
    func reset() {
        accumX = 0
        accumY = 0
    }
}

// MARK: - Default pointer curve
extension PointerMotionEngine {
    static let defaultSettings = MotionCurveSettings(
        minSpeed: 40,  // below this: baseGain
        maxSpeed: 900, // above this: maxGain
        baseGain: 1.0, // slow movements gain
        maxGain: 2.0,  // fast flicks gain
        gamma: 1.2     // slightly soft ramp
    )
}
