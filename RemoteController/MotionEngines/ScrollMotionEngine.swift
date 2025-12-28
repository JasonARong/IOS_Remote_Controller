//
//  ScrollMotionEngine.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/11/29.
//

import Foundation
import CoreGraphics

final class ScrollMotionEngine {
    // Configurations
    private let settings: MotionCurveSettings
    private let inertiaEnabled: Bool
    
    private let decayPerSecond: CGFloat // Exponential inertia decay rate /sec (Higher = stops faster)
    private let minVelocityForInertia: CGFloat // Below this velocity, inertia stops
    private let maxVelocity: CGFloat
    
    // State
    private let connection: ConnectionManager
    private var velocity: CGFloat = 0 // scroll units per second
    private var inertiaActive: Bool = false
    private var gestureActive: Bool = false
    
    init(
        connection: ConnectionManager,
        settings: MotionCurveSettings = ScrollMotionEngine.defaultSettings,
        inertiaEnabled: Bool = true,
        decayPerSecond: CGFloat = 5.0,
        minVelocityForInertia: CGFloat = 5.0,
        maxVelocity: CGFloat = 1000.0,
    ) {
        self.connection = connection
        self.settings = settings
        self.inertiaEnabled = inertiaEnabled
        self.decayPerSecond = decayPerSecond
        self.minVelocityForInertia = minVelocityForInertia
        self.maxVelocity = maxVelocity
    }
    
    // MARK: - Gesture-driven input
    
    /// Called on each 2-finger scroll update while fingers are down.
    ///
    /// - Parameters:
    ///   - dy: Raw vertical scroll delta from the gesture (points / pixels).
    ///   - dt: Time since the previous scroll update (seconds).
    func applyGestureDelta(dy rawDy: CGFloat, dt: CFTimeInterval) {
        guard rawDy != 0 else { return }
        gestureActive = true
        inertiaActive = false   // live gesture overrides any previous inertia
        
        if !gestureActive {
            velocity = 0
        }
        
        let safeDt = max(dt, 1.0 / 240.0)
        let speed = abs(rawDy) / CGFloat(safeDt)
        
        let gain = motionGain(forSpeed: speed, settings: settings) // Get the gain from MotionCurves
        let scaledDy = rawDy * gain
        connection.scroll(deltaY: scaledDy) // Send to ConnectionManager
        
        var instVel = scaledDy / CGFloat(safeDt) // Estimated instantaneous velocity from this frame
        if instVel > maxVelocity { instVel = maxVelocity }   // Max Clamp
        if instVel < -maxVelocity { instVel = -maxVelocity } // Min Clamp
        
        // Blend into our running velocity (simple low-pass)
        let blend: CGFloat = 0.35
        velocity = velocity * (1 - blend) + instVel * blend
    }
    
    /// Called when the 2-finger scroll gesture ends (both fingers up, or you leave scroll mode).
    func gestureEnded() {
        gestureActive = false
        if inertiaEnabled && abs(velocity) >= minVelocityForInertia {
            inertiaActive = true
        } else {
            inertiaActive = false
            velocity = 0
        }
    }
    
    // MARK: - Inertia update (called from CADisplayLink / tick)
    
    /// Called every frame (e.g. from ConnectionManager.tick) to continue inertial scrolling.
    ///
    /// - Parameter dt: Time elapsed since last frame (seconds).
    func update(dt: CFTimeInterval) {
        guard inertiaEnabled, inertiaActive, dt > 0 else { return }
        
        // Exponential decay: v(t) = v0 * e^(-k * t)
        let factor = exp(-decayPerSecond * CGFloat(dt))
        velocity *= factor
        
        // Stop inertia
        if abs(velocity) < minVelocityForInertia {
            inertiaActive = false
            velocity = 0
            connection.resetScrollAccumulator()
            return
        }
        
        // Convert velocity back into a delta => scroll
        let dy = velocity * CGFloat(dt)
        if dy != 0 {
            connection.scroll(deltaY: dy)
        }
    }
    
    /// Reset all internal state (e.g. when resetting the touchpad state machine).
    func reset() {
        gestureActive = false
        inertiaActive = false
        velocity = 0
    }
    
    /// Whether there is an active inertial scroll in progress.
    var hasActiveInertia: Bool {
        return inertiaActive
    }
}



// MARK: - Default scroll curve

extension ScrollMotionEngine {
    /// Defaults tuned for “smooth but not crazy” scroll feel.
    static let defaultSettings = MotionCurveSettings(
        minSpeed: 20,    // slow finger = near baseGain
        maxSpeed: 1000,   // fast flick hits maxGain
        baseGain: 0.6,   // small, precise scrolls
        maxGain: 1,    // fast flicks much stronger
        gamma: 1.8       // slightly eased curve
    )
}
