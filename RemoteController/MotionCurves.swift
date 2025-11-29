//
//  MotionCurves.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/11/29.
//

import Foundation
import CoreGraphics

/// Tunable parameters for a generic motion acceleration curve.
struct MotionCurveSettings {
    let minSpeed: CGFloat // Below this speed, gain => baseGain
    let maxSpeed: CGFloat // Above this speed, gain => maxGain
    
    let baseGain: CGFloat // Baseline gain for slow speed
    let maxGain: CGFloat  // Upper gain cap
    
    /// Curve shape: 1 = linear; >1 = softer at low speed, stronger at high speed.
    let gamma: CGFloat
    
    init(minSpeed: CGFloat, maxSpeed: CGFloat, baseGain: CGFloat, maxGain: CGFloat, gamma: CGFloat) {
        self.minSpeed = minSpeed
        self.maxSpeed = maxSpeed
        self.baseGain = baseGain
        self.maxGain = maxGain
        self.gamma = gamma
    }
}

private func clamped(_ value: CGFloat, _ min: CGFloat, _ max: CGFloat) -> CGFloat {
    if value > max { return max }
    if value < min { return min }
    return value
}

/// Compute an acceleration gain factor given a speed and curve settings
func motionGain(forSpeed speed: CGFloat, settings: MotionCurveSettings) -> CGFloat {
    // Guard against degenerate ranges
    let minS = max(0, settings.minSpeed)
    let maxS = max(minS + 0.0001, settings.maxSpeed)
    
    // Normalize speed, such that 0 ≤ t ≤ 1
    let tRaw = (abs(speed) - minS) / (maxS - minS)
    let t = clamped(tRaw, 0, 1)
    
    if t == 0 { return settings.baseGain }
    
    // Shape the curve with gamma (t^gamma)
    let shaped = pow(t, max(settings.gamma, 0.0001))
    
    // Interpolate gain between base and max
    // returns Gain multiplier
    return settings.baseGain + shaped * (settings.maxGain - settings.baseGain)
}
