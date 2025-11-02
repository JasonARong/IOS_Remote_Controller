//
//  TouchPadViewModel.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/3.
//

import SwiftUI
import Combine

class TouchPadViewModel: ObservableObject { // use class: only 1 instance of TouchPadViewModel -> persists&updates the View
    @Published var cursorPoint: CGPoint = CGPoint(x: 100, y: 100)
    @Published var lastDelta: CGSize? = nil
    @Published var mouseStatus: String = "Released"
    
    private let connection: ConnectionManager
    
    // --- Tunables ---
    private let holdDelay: TimeInterval = 0.5
    private let moveSlopRadius: CGFloat = 12.0
    
    // --- Touch tracking ---
    private(set) var activeTouches: [UITouch : touchInfo] = [:]
    private var primaryTouch: UITouch? = nil
    private var currentTouchMode: TouchMode = TouchMode.none
    
    enum TouchMode {
        case none
        case single
        case multi
    }
    
    init(connection: ConnectionManager){
        self.connection = connection
    }
    
    
    // MARK: - Handle Touches Changed
    
    func handleTouchesChanged(_ touches: Set<UITouch>, event: UIEvent?) {
        // register all new touches
        for touch in touches where activeTouches[touch] == nil {
            activeTouches[touch] = touchInfo()
        }
        
        let activeTouchCount = activeTouchCount(from: event)
        
        switch activeTouchCount {
        case 1:
            currentTouchMode = .single
            handleSingleFingerChanged(touches, event: event)
        case 2:
            // single → multi
            if currentTouchMode != .multi {
                cancelAllHolds()
                currentTouchMode = .multi
            }
        default:
            break // ignore 3+ fingers
        }
    }
    
    
    // MARK: - Handle Touches Ended
    
    func handleTouchesEnded(_ touches: Set<UITouch>, event: UIEvent?) {
        mouseStatus="Some touches released"
        
        // Cancel hold timers for these ended touches
        for touch in touches {
            cancelHold(touch: touch)
        }
        
        
        // If a primary finger was lifted, decide what gesture to commit
        if let primTouch = primaryTouch,
           touches.contains(primTouch),
           let touchInfo = activeTouches[primTouch],
           currentTouchMode == .single {
            
            // Holding
            if touchInfo.isHolding{
                mouseStatus="One touch released from holding"
                connection.leftUp()
            }
            
            // Not holding: decide if it's a quick tap, based on movement
            else if let start = touchInfo.startPoint,
                    let prev = touchInfo.previousPoint,
                    distance(from: start, to: prev) <= moveSlopRadius
            {
                // Stayed within slop and ended before hold fired → click
                mouseStatus = "One quick clicked"
                connection.leftTap()
            }
            
        }
        
        // Remove the ended touches from activeTouches dictionary
        for touch in touches {
            activeTouches.removeValue(forKey: touch)
        }
        
        // Update state after removal
        let remainingTouchesCount = activeTouches.count
        if remainingTouchesCount == 0 {
            // Reset everything
            primaryTouch = nil
            currentTouchMode = .none
            mouseStatus = "All Released"
        }
        else if remainingTouchesCount == 1 {
            currentTouchMode = .single
        }
              
    }
        
    
    // MARK: - One Finger
    func handleSingleFingerChanged(_ touches: Set<UITouch>, event: UIEvent?) {
        
        guard let touch = touches.first,
              let view = touch.view,
              let touchInfo = activeTouches[touch] else { return }
        
        primaryTouch = touch
        let current = touch.location(in: view)
        
        // --- First contact ---
        if touchInfo.startPoint == nil {
            touchInfo.startPoint = current
            touchInfo.previousPoint = current
            touchInfo.movedBeyondSlop = false
            touchInfo.isHolding = false
            
            startHoldTimer(for: touch)
            mouseStatus = "One touch First contact"
            
            return
        }
        
        // --- Movement ---
        if let prev = touchInfo.previousPoint {
            let dx = current.x - prev.x
            let dy = current.y - prev.y
            let delta = CGSize(width: dx, height: dy)
            lastDelta = delta
            
            // Update cursor locally (for testing)
            cursorPoint = CGPoint(x: cursorPoint.x + dx, y: cursorPoint.y + dy)
            
            // Send delta to ESP (stub for now)
            connection.accumulateDelta(dx: dx, dy: dy)
        }
        
        // --- Whether exceeded slop ---
        if let start = touchInfo.startPoint {
            if distance(from: start, to: current) > moveSlopRadius {
                touchInfo.movedBeyondSlop = true
                if !touchInfo.isHolding { // start moving before holdDelay => mouse movement, stop hold timer
                    cancelHold(touch: touch)
                }
            }
        }
        
        touchInfo.previousPoint = current
    }
    
    
    // MARK: - Two Fingers (placeholder for now)
    private func handleTwoFingerChanged(_ touches: Set<UITouch>, event: UIEvent?) {
        mouseStatus = "Two fingers detected"
        // TODO: next step — distinguish two-finger tap vs scroll
    }
    
    
    // MARK: - Hold / Utilities Helpers
    private func startHoldTimer(for touch: UITouch) {
        guard let touchInfo = activeTouches[touch] else { return }
        
        touchInfo.holdTimer?.invalidate()
        touchInfo.holdTimer =
        Timer.scheduledTimer(withTimeInterval: holdDelay, repeats: false){ [weak self] _ in
            guard let self = self,
                  let currentTouchInfo = self.activeTouches[touch],  // ← Get current state
                  let start = currentTouchInfo.startPoint,
                  let prev = currentTouchInfo.previousPoint,
                  !currentTouchInfo.movedBeyondSlop,
                  self.distance(from: start, to: prev) <= self.moveSlopRadius,
                  !currentTouchInfo.isHolding
            else { return }
                                    
            currentTouchInfo.isHolding = true
            self.connection.leftDown()
            self.mouseStatus = "One touch Holding"
        }
    }
    
    private func activeTouchCount(from event: UIEvent?) -> Int {
        guard let all = event?.allTouches else { return 0 }
        return all.filter { touchEvent in
            touchEvent.phase != .ended && touchEvent.phase != .cancelled
        }.count
    }
    
    private func cancelHold(touch: UITouch) {
        guard let touchInfo = activeTouches[touch] else { return }
        touchInfo.holdTimer?.invalidate()
        touchInfo.holdTimer = nil
    }
    
    private func cancelAllHolds(){
        for (touch,_) in activeTouches {
            cancelHold(touch: touch)
        }
    }
    
    private func distance(from a: CGPoint, to b: CGPoint) -> CGFloat {
        let dx = b.x - a.x
        let dy = b.y - a.y
        return sqrt(dx*dx + dy*dy)
    }
    
    
    // MARK: - TouchInfo Class
    // Holds the touch Info for each touch
    final class touchInfo {
        var startPoint: CGPoint? = nil
        var previousPoint: CGPoint? = nil
        var holdTimer: Timer?
        var movedBeyondSlop: Bool = false
        var isHolding: Bool = false
    }
}
