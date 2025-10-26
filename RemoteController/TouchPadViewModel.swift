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
    
    // --- Gesture state ---
    private var startPoint: CGPoint? = nil
    private var previousPoint: CGPoint? = nil
    private var startTime: Date?
    private var holdTimer: Timer?
    private var movedBeyondSlop: Bool = false
    private var isHolding: Bool = false
    
    // --- Tunables ---
    private let holdDelay: TimeInterval = 0.5
    private let moveSlopRadius: CGFloat = 12.0
    
    
    init(connection: ConnectionManager){
        self.connection = connection
    }
    
    func handleDragChanged(_ current: CGPoint) {
        // First contact
        if startTime == nil {
            mouseStatus = "First contact"
            startPoint = current
            previousPoint = current
            startTime = Date()
            movedBeyondSlop = false
            isHolding = false
            
            holdTimer?.invalidate() // Clean up any previous timer
            holdTimer = Timer.scheduledTimer(withTimeInterval: holdDelay, repeats: false){ [weak self] _ in
                guard let self = self else { return }
                
                // If still within slop and not already holding → begin hold
                if let start = self.startPoint,
                   let prev = self.previousPoint,
                   !self.movedBeyondSlop,
                   distance(from: start, to: prev) <= moveSlopRadius,
                   !self.isHolding
                {
                    mouseStatus = "Holding"
                    self.isHolding = true
                    self.connection.leftDown()
                }
            }
            
            return
        }
        
        // Movement
        if let prev = previousPoint{
            let dx = current.x - prev.x
            let dy = current.y - prev.y
            let delta = CGSize(width: dx, height: dy)
            lastDelta = delta
            
            // Update cursor locally (for testing)
            cursorPoint = CGPoint(x: cursorPoint.x + dx, y: cursorPoint.y + dy)
            
            // Send delta to ESP (stub for now)
            connection.accumulateDelta(dx: dx, dy: dy)
        }
        
        // Whether exceeded slop
        if let start = startPoint {
            if distance(from: start, to: current) > moveSlopRadius {
                movedBeyondSlop = true
                if !isHolding { // start moving before 2s, stop hold timer
                    holdTimer?.invalidate()
                    holdTimer = nil
                }
            }
        }
        
        previousPoint = current
    }
    
    func handleDragEnded() {
        mouseStatus="Released" 
        // Stop any pending hold
        holdTimer?.invalidate()
        holdTimer = nil
        
        if isHolding{
            mouseStatus="Released from holding" 
            connection.leftUp()
        }
        // Not holding: decide if it's a quick tap
        else if let start = startPoint, let prev = previousPoint,
                distance(from: start, to: prev) <= moveSlopRadius
        {
            // Stayed within slop and ended before hold fired → click
            mouseStatus = "quick clicked"
            connection.leftTap()
        }
        
        // Reset gesture state
        startPoint = nil
        previousPoint = nil
        startTime = nil
        movedBeyondSlop = false
        isHolding = false
        lastDelta = nil
    }
    
    private func distance(from a: CGPoint, to b: CGPoint) -> CGFloat {
        let dx = b.x - a.x
        let dy = b.y - a.y
        return sqrt(dx*dx + dy*dy)
    }
}
