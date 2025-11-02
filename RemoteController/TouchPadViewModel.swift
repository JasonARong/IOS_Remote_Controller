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
    // 2 Fingers
    private let pairWindow: TimeInterval      = 0.12   // second finger must arrive within 120ms
    private let tapMaxDuration: TimeInterval  = 0.25   // total duration limit
    private let liftWindow: TimeInterval      = 0.12   // both lifts within 120ms
    private let twoFingerSlop: CGFloat        = 12.0   // movement tolerance per finger (or centroid)
    
    
    // --- Touch tracking ---
    private(set) var activeTouches: [UITouch : TouchInfo] = [:]
    private var primaryTouch: UITouch? = nil
    // 2 Fingers
    private var secondaryTouch: UITouch? = nil
    private var gestureState: GestureState = GestureState.idle
    private var pairStartTime: TimeInterval = 0
    private var firstLiftTime: TimeInterval? = nil
    
    
    private enum GestureState {
        case idle
        case singleActive
        case twoFingerPending       // classifying: tap vs scroll (scroll later)
        case twoFingerTapCandidate  // both within slop + within windows
        case twoFingerScroll
    }
    
    init(connection: ConnectionManager){
        self.connection = connection
    }
    
    
    // MARK: - Handle Touches Changed
    
    func handleTouchesChanged(_ touches: Set<UITouch>, event: UIEvent?) {
        // register all new touches with timestamps
        let now = CACurrentMediaTime()
        
        for touch in touches {
            if activeTouches[touch] == nil {
                let info = TouchInfo()
                info.downTime = now
                activeTouches[touch] = info
            }
        }
        
        let activeTouchCount = activeTouchCount(from: event)
        
        switch activeTouchCount {
        case 1:
            gestureState = .singleActive
            handleSingleFingerChanged(touches, event: event)
        case 2:
            // First time we see 2 fingers
            // → cancel single-finger holds and enter 2-finger pipeline
            if gestureState == .singleActive || gestureState == .idle {
                cancelAllHolds() // cancel single-finger holds
                gestureState = .twoFingerPending
                
                // lock primary/secondary, keep ordering stable
                // Sort touches based on their down time
                let sortedTouches = activeTouches.sorted { $0.value.downTime < $1.value.downTime }
                primaryTouch = sortedTouches.first?.key
                secondaryTouch = sortedTouches.dropFirst().first?.key
                pairStartTime = now
            }
            handleTwoFingerChanged(touches, event: event)
            
        default:
            break // ignore 3+ fingers
        }
    }
    
    
    // MARK: - Handle Touches Ended
    
    func handleTouchesEnded(_ touches: Set<UITouch>, event: UIEvent?) {
        mouseStatus="Some touches released"
        let now = CACurrentMediaTime()
        
        // 1) Per-touch bookkeeping: stop holds + stamp upTime
        for touch in touches {
            cancelHold(touch: touch)
            activeTouches[touch]?.upTime = now
        }

        
        // 2) How many touches are still actively down?
        let remainingActive = activeTouchCount(from: event)
        
        switch gestureState {
        case .idle:
            // Nothing to commit; just remove ended (paranoia) and keep idle.
            removeEndedTouches(touches)
            rearmStateAfterRemoval()
            return
         
        // ===== SINGLE-FINGER PIPELINE =====
        case .singleActive:
            commitSingleFingerIfNeeded(endedTouches: touches)
            
            removeEndedTouches(touches)
            rearmStateAfterRemoval()
            return
            
        // ===== TWO-FINGER PIPELINE =====
        case .twoFingerPending, .twoFingerTapCandidate, .twoFingerScroll:
            if remainingActive >= 2 { return }
            if remainingActive == 1 {
                if firstLiftTime == nil {
                    firstLiftTime = now // First lift during a two-finger gesture.
                }
                return
            }
            // remainingActive == 0, time to decide and clean up.
            commitTwoFingerIfNeededAndReset(now: now)
            return
        }
    }
       
    // MARK: - Touches Ended Helpers
    private func commitSingleFingerIfNeeded(endedTouches: Set<UITouch>) {
        guard let prim = primaryTouch,
              endedTouches.contains(prim),
              let info = activeTouches[prim]
        else { return }

        if info.isHolding {
            mouseStatus = "Left released from hold"
            connection.leftUp()
        } else if let s = info.startPoint, let p = info.previousPoint,
                  distance(from: s, to: p) <= moveSlopRadius {
            mouseStatus = "Left tap"
            connection.leftTap()
        }
    }
    
    // Decide two-finger right-click (if qualified), then cleanly reset everything
    private func commitTwoFingerIfNeededAndReset(now: TimeInterval) {
        defer { resetToIdle() } // Always leave two-finger pipeline fully reset

        guard let t1 = primaryTouch, let t2 = secondaryTouch,
              let i1 = activeTouches[t1], let i2 = activeTouches[t2]
        else { return }

        // Windows & constraints
        let liftsClose: Bool = {
            guard let first = firstLiftTime else { return true } // both ended together
            return (now - first) <= liftWindow
        }()

        let withinPair = abs(i1.downTime - i2.downTime) <= pairWindow
        let withinTapDuration = (now - min(i1.downTime, i2.downTime)) <= tapMaxDuration
        let bothWithinSlop = (i1.movedBeyondSlop == false) && (i2.movedBeyondSlop == false)

        if (gestureState == .twoFingerTapCandidate || gestureState == .twoFingerPending),
           liftsClose, withinPair, withinTapDuration, bothWithinSlop {
            // TODO: connection.rightTap()   // ✅ two-finger tap → right-click
            print("Right clicked!!!!")
        }

        // (If you later add two-finger scroll, you can branch here when state == .twoFingerScroll)
    }
    
    
    // Remove ended touches from the dictionary
    private func removeEndedTouches(_ touches: Set<UITouch>) {
        for t in touches {
            activeTouches.removeValue(forKey: t)
        }
    }
    
    private func rearmStateAfterRemoval() {
        let count = activeTouches.count
        if count == 0 {
            resetToIdle()
        } else if count == 1 {
            gestureState = .singleActive
            // pick/repair primaryTouch from the only remaining key:
            if primaryTouch == nil {
                primaryTouch = activeTouches.keys.first
            }
        } else {
            if gestureState == .idle { gestureState = .twoFingerPending }
        }
    }
    
    private func resetToIdle() {
        gestureState = .idle
        firstLiftTime = nil
        primaryTouch = nil
        secondaryTouch = nil
        activeTouches.removeAll()
        mouseStatus = "Idle"
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
        guard let t1 = primaryTouch, let t2 = secondaryTouch,
              let i1 = activeTouches[t1], let i2 = activeTouches[t2] else { return } // touchInfo i1 and i2
        
        let now = CACurrentMediaTime()
        
        // Update points & per-finger slop for both t1 and t2
        for touch in [t1, t2] {
            guard let view = touch.view,
                  let touchInfo = activeTouches[touch] else { continue }
            
            let current = touch.location(in: view)
            if touchInfo.startPoint == nil { // first contact
                touchInfo.startPoint = current
                touchInfo.previousPoint = current
            } else {
                touchInfo.previousPoint = current
            }
            touchInfo.lastMoveTime = now
            
            if let s = touchInfo.startPoint,
               distance(from: s, to: current) > twoFingerSlop {
                touchInfo.movedBeyondSlop = true
            }
        }
        
        // Windows / constraints for two-finger tap candidate
        let withinPair = abs(i1.downTime - i2.downTime) <= pairWindow // down around the same time
        let withinTapDuration = (now - min(i1.downTime, i2.downTime)) <= tapMaxDuration // quick tap
        let bothWithinSlop = (i1.movedBeyondSlop == false) && (i2.movedBeyondSlop == false)
        
        if withinPair && withinTapDuration && bothWithinSlop {
            gestureState = .twoFingerTapCandidate
        } else {
            // Movement/time exceeded → not a tap anymore.
            // (We’ll route to scroll later; for now just stay pending.)
            gestureState = .twoFingerPending
        }
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
    final class TouchInfo {
        var startPoint: CGPoint? = nil
        var previousPoint: CGPoint? = nil
        var holdTimer: Timer?
        var movedBeyondSlop: Bool = false
        var isHolding: Bool = false
        
        // 2 fingers: timestamps for pairing / tap windows
        var downTime: TimeInterval = 0
        var lastMoveTime: TimeInterval = 0
        var upTime: TimeInterval = 0
    }
}
