//
//  TouchPadViewModel.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/3.
//

import SwiftUI
import Combine
import QuartzCore

class TouchPadViewModel: ObservableObject { // use class: only 1 instance of TouchPadViewModel -> persists&updates the View
    @Published var cursorPoint: CGPoint = CGPoint(x: 100, y: 100)
    @Published var lastDelta: CGSize? = nil
    @Published var mouseStatus: String = "Released"
    @Published var gestureStatus: String = "idle"
    
    private let connection: ConnectionManager
    
    // --- Smooth move & scroll  ---
    private let pointerEngine: PointerMotionEngine
    private var lastPointerTimestamp: CFTimeInterval? = nil
    private let scrollEngine: ScrollMotionEngine
    private var lastScrollTimestamp: CFTimeInterval? = nil
    
    // --- Tunables ---
    private let holdDelay: TimeInterval = 0.5
    private let moveSlopRadius: CGFloat = 12.0
    // 2 Fingers - right click
    private let pairWindow: TimeInterval      = 0.12   // second finger must arrive within 120ms
    private let tapMaxDuration: TimeInterval  = 0.25   // total duration limit
    private let liftWindow: TimeInterval      = 0.12   // both lifts closely within 120ms
    // 2 Fingers - scroll
    private let dominanceRatio: CGFloat = 1.5
    private var suppressNextLeftClick = false
    
    
    // --- Touch tracking ---
    private var primaryTouch: UITouch? = nil
    
    private(set) var activeTouches: [UITouch : TouchInfo] = [:]
    final class TouchInfo { // Holds the touch Info for each touch
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
            
    private var twoFingerContext: TwoFingerContext? = nil
    private struct TwoFingerContext {
        let touch1: UITouch            // first finger (earlier downTime)
        let touch2: UITouch            // second finger (later downTime)
        let startedAt: CFTimeInterval
        var firstLiftAt: CFTimeInterval? = nil
        var firstLiftDeadline: CFTimeInterval? = nil
        var isTapCandidate: Bool = true
        var lastCentroid: CGPoint? = nil      // for scroll
    }
        
    private var gestureState: GestureState = GestureState.idle
    private enum GestureState {
        case idle
        case singleActive
        case twoFingerPending       // classifying: tap vs scroll
        case twoFingerScroll
    }
    
    
    init(connection: ConnectionManager){
        self.connection = connection
        self.pointerEngine = PointerMotionEngine(connection: connection)
        self.scrollEngine = ScrollMotionEngine(connection: connection, inertiaEnabled: false)
        
        connection.onTick = { [weak self] dt in
            self?.scrollEngine.update(dt: dt)
        }
    }
    
    
    // MARK: - Handle Touches Changed
    func handleTouchesChanged(_ touches: Set<UITouch>, event: UIEvent?) {
        let now = CACurrentMediaTime()
        
        // register all new touches with timestamps
        for touch in touches {
            if activeTouches[touch] == nil {
                let info = TouchInfo()
                info.downTime = now
                activeTouches[touch] = info
            }
        }
        
        let activeTouchCount = activeTouches.count
        
        switch activeTouchCount {
        case 1:
            // === One-finger mode ===
            gestureState = .singleActive // setting gesture state
            gestureStatus = "singleActive"
            handleSingleFingerChanged(touches, event: event)
        case 2:
            // === Enter or update two-finger mode ===
            handleTwoFingerChanged(now: now)
            
        default:
            break // ignore 3+ fingers
        }
    }
    
    // MARK: - One Finger Change
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
            
            // Use pointer acceleration engine
            let now = CACurrentMediaTime()
            let dt: CFTimeInterval // get delta time
            if let last = lastPointerTimestamp {
                dt = now - last
            } else { dt = 1.0 / 120.0 } // safe fallback
            lastPointerTimestamp = now
            pointerEngine.applyRawDelta(dx: dx, dy: dy, dt: dt)
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
    
    
    // MARK: - Two Fingers Change
    private func handleTwoFingerChanged(now: CFTimeInterval) {
        mouseStatus = "Handle Two fingers"
        
        // --- Ensure we have two touches ---
        let keys = Array(activeTouches.keys)
        guard keys.count == 2,
              let info1 = activeTouches[keys[0]],
              let info2 = activeTouches[keys[1]] else { return }
        
        // Reset any previous scroll inertia
//        scrollEngine.reset()
        
        // --- Initialize TwoFingerContext ---
        if twoFingerContext == nil {
            cancelAllHolds()
            let sorted = [(keys[0], info1), (keys[1], info2)].sorted {
                $0.1.downTime < $1.1.downTime // sort tocuhes based on down time (touch order)
            }
            twoFingerContext = TwoFingerContext(touch1: sorted[0].0, touch2: sorted[1].0, startedAt: now)
            
            gestureState = .twoFingerPending
            gestureStatus = "twoFingerPending"
        }
            
        guard var twoFingerCtx = twoFingerContext else { return }
        
        // --- Update 2 fingers' positions & slop ---
        for (touch, touchInfo) in activeTouches { // Loop twice for 2 fingers
            guard let view = touch.view else { continue }
            
            let currLocation = touch.location(in: view)
            
            if touchInfo.startPoint == nil { // first contact
                touchInfo.startPoint = currLocation
                touchInfo.previousPoint = currLocation
            }
            else { // update existing 2 fingers
                if let start = touchInfo.startPoint { // check slop
                    let dist = distance(from: start, to: currLocation)
                    if dist > moveSlopRadius { touchInfo.movedBeyondSlop = true } // update slop check
                }
                touchInfo.previousPoint = currLocation // update position
            }
        }
        
        // --- Update tap candidacy ---
        let i1 = activeTouches[twoFingerCtx.touch1]! // TouchInfo 1
        let i2 = activeTouches[twoFingerCtx.touch2]! // TouchInfo 2
        let withinPair = abs(i1.downTime - i2.downTime) <= pairWindow
        let withinDuration = (now - min(i1.downTime, i2.downTime)) <= tapMaxDuration
        let bothWithinSlop = (!i1.movedBeyondSlop && !i2.movedBeyondSlop)
        
        twoFingerCtx.isTapCandidate = withinPair && withinDuration && bothWithinSlop
        
        
        // --- Arm Scroll ---
        // if still 2 fingers && no longer a tap candidate => scroll
        if gestureState == .twoFingerPending && twoFingerCtx.isTapCandidate == false {
            if let c = centroid(twoFingerCtx.touch1, twoFingerCtx.touch2){
                twoFingerCtx.lastCentroid = c
                gestureState = .twoFingerScroll // update gesture to scroll
                gestureStatus = "twoFingerScroll"
            }
            twoFingerContext = twoFingerCtx // update public 2 figner context
            return
        }
        
        // --- Stream Scroll ---
        if gestureState == .twoFingerScroll {
            guard let currCentriod = centroid(twoFingerCtx.touch1, twoFingerCtx.touch2) else {
                twoFingerContext = twoFingerCtx
                return
            }
            let lastCentroid = twoFingerCtx.lastCentroid ?? currCentriod
            
            // Each finger's vertical deltas (prev->cur)
            let dy1: CGFloat = {
                guard let view = twoFingerCtx.touch1.view,
                      let prev = activeTouches[twoFingerCtx.touch1]?.previousPoint else { return 0 }
                let curr = twoFingerCtx.touch1.location(in: view)
                return curr.y - prev.y
            }()
            let dy2: CGFloat = {
                guard let view = twoFingerCtx.touch2.view,
                      let prev = activeTouches[twoFingerCtx.touch2]?.previousPoint else { return 0 }
                let curr = twoFingerCtx.touch2.location(in: view)
                return curr.y - prev.y
            }()
            
            let dominant =
                abs(dy1) > dominanceRatio * abs(dy2) ? dy1 :
                abs(dy2) > dominanceRatio * abs(dy1) ? dy2 :
                (currCentriod.y - lastCentroid.y) // centroid glide
            
            
            // Compute dt for Scroll Engine
            let now = CACurrentMediaTime()
            let dt: CFTimeInterval
            if let last = lastScrollTimestamp {
                dt = now - last
            } else { dt = 1.0 / 120.0 }
            lastScrollTimestamp = now
            
            if abs(dominant) >= 0.5 { // small jitter guard
                // 🚀 send to scroll engine (accel + inertia)
                scrollEngine.applyGestureDelta(dy: dominant, dt: dt)
//                connection.scroll(deltaY: dominant)  // flip sign here if you prefer inverted
            }
            
            twoFingerCtx.lastCentroid = currCentriod
            twoFingerContext = twoFingerCtx
            return
        }
        
        
        
        
        // --- Check if grace deadline expired (after one finger lifted) ---
        if let deadline = twoFingerCtx.firstLiftDeadline,
           now > deadline // over deadline
        {
            // leaving scroll into single finger
            scrollEngine.gestureEnded()
            lastScrollTimestamp = nil
            
            if let remaining = activeTouches.keys.first(where: {
                $0.phase != .ended && $0.phase != .cancelled // filter to find active finger
            }) {
                twoToOneFinger(remainingTouch: remaining) // one finger
            } else {
                resetToIdle() // no finger
            }
            return
        }
        
        // --- Save context back ---
        twoFingerContext = twoFingerCtx
        
    }
    
    // Helper that calculates centroid
    private func centroid(_ t1: UITouch, _ t2: UITouch) -> CGPoint? {
        guard let view1 = t1.view, let view2 = t2.view else { return nil }
        let p1 = t1.location(in: view1)
        let p2 = t2.location(in: view2)
        return CGPoint(x: (p1.x + p2.x)/2, y: (p1.y + p2.y)/2)
    }
    
    
    // MARK: - Handle Touches Ended
    
    func handleTouchesEnded(_ touches: Set<UITouch>, event: UIEvent?) {
        mouseStatus="Some touches released"
        let now = CACurrentMediaTime()
        
        // bookkeeping for each touch: stop holds + stamp upTime
        for touch in touches {
            cancelHold(touch: touch)
            activeTouches[touch]?.upTime = now
        }

        
        // How many touches are still actively down?
        let remainingActive = activeTouchCount(from: event)
        
        switch gestureState {
        case .idle:
            // Nothing to commit; just remove ended (paranoia) and keep idle.
            resetToIdle()
            return
         
        // ===== SINGLE-FINGER PIPELINE =====
        case .singleActive:
            if suppressNextLeftClick {
                suppressNextLeftClick = false   // consume the suppression
                resetToIdle()
                return
            }
            
            guard let prim = primaryTouch,
                  touches.contains(prim),
                  let info = activeTouches[prim]
            else { resetToIdle(); return }

            if info.isHolding { // Release from hold
                mouseStatus = "Left released from hold"
                connection.leftUp()
            } else if let s = info.startPoint, let p = info.previousPoint,
                      distance(from: s, to: p) <= moveSlopRadius { // quick left click
                mouseStatus = "Left tap"
                connection.leftTap()
            }
            
            resetToIdle() // no more active fingers set to idle
            return
            
        // ===== TWO-FINGER PIPELINE =====
        case .twoFingerPending, .twoFingerScroll:
            guard var twoFingerCtx = twoFingerContext else {
                resetToIdle()
                return
            }
            
            // 1 active touch left
            if remainingActive == 1 {
                // leaving scroll into single finger
                scrollEngine.gestureEnded()
                lastScrollTimestamp = nil
                
                // first finger lift
                if twoFingerCtx.firstLiftAt == nil { // update first lift time & deadline
                    twoFingerCtx.firstLiftAt = now
                    twoFingerCtx.firstLiftDeadline = now + liftWindow
                }
                
                // when not a tap candidate, transition to singleActive
                if !twoFingerCtx.isTapCandidate {
                    if let remaining = activeTouches.keys.first(where: {
                        $0.phase != .ended && $0.phase != .cancelled // filter to find active finger
                    }) {
                        twoToOneFinger(remainingTouch: remaining)
                    } else {
                        resetToIdle()
                    }
                    return
                }
                twoFingerContext = twoFingerCtx
                return
            }
            
            // 0 active touch left
            if remainingActive == 0{
                // leaving scroll
                scrollEngine.gestureEnded()
                lastScrollTimestamp = nil
                
                if let i1 = activeTouches[twoFingerCtx.touch1],
                   let i2 = activeTouches[twoFingerCtx.touch2]{
                    let liftsClose = (twoFingerCtx.firstLiftAt == nil) ||
                        ((now - (twoFingerCtx.firstLiftAt ?? now)) <= liftWindow) // two fingers lifted closely time wise
                    let withinDuration = (now - min(i1.downTime, i2.downTime)) <= tapMaxDuration // two fingers tap instead of hold
                    let bothWithinSlop = (!i1.movedBeyondSlop && !i2.movedBeyondSlop) // within slop
                    
                    if twoFingerCtx.isTapCandidate && liftsClose && withinDuration && bothWithinSlop {
                        connection.rightTap()
                        print("Right Click!!!")
                    }
                }
                resetToIdle() // no more active fingers set to idle
                return
            }
        }
    }
       
    // MARK: - Touches Ended Helpers

    // Transition from two fingers to singleActive
    private func twoToOneFinger(remainingTouch: UITouch) {
        gestureState = .singleActive // update gesture state to singleActive
        gestureStatus = "singleActive"
        twoFingerContext = nil
        suppressNextLeftClick = true // prevent unwanted left click registered from the remaining finger
        
        // keep the only remaining touch
        for (t, _) in activeTouches where t != remainingTouch {
            activeTouches.removeValue(forKey: t)
        }
        primaryTouch = remainingTouch
        
        // update remaining touch's touchInfo
        if let view = remainingTouch.view,
           let touchInfo = activeTouches[remainingTouch]{
            let currLocation = remainingTouch.location(in: view)
            touchInfo.startPoint = currLocation
            touchInfo.previousPoint = currLocation
            touchInfo.movedBeyondSlop = false
            touchInfo.isHolding = false
        }
    }
            
    private func resetToIdle() {
        // Reset touches
        twoFingerContext = nil
        primaryTouch = nil
        activeTouches.removeAll()
        
        // Reset motion engines for cursor and scroll
        pointerEngine.reset()
        lastPointerTimestamp = nil
//        scrollEngine.reset() CANNOT reset here, it ends inertia immediately
        lastScrollTimestamp = nil
        
        // Status updates
        gestureState = .idle
        gestureStatus = "idle"
        mouseStatus = "Idle"
    }
            
    
    
    // MARK: - Hold Timer Helpers
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
    
    // MARK: - Utilities Helpers
    private func activeTouchCount(from event: UIEvent?) -> Int {
        guard let all = event?.allTouches else { return 0 }
        return all.filter { touchEvent in
            touchEvent.phase != .ended && touchEvent.phase != .cancelled
        }.count
    }
    
    private func distance(from a: CGPoint, to b: CGPoint) -> CGFloat {
        let dx = b.x - a.x
        let dy = b.y - a.y
        return sqrt(dx*dx + dy*dy)
    }
    

}
