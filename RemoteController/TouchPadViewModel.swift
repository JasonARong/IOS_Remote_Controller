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
    
    private var previousPoint: CGPoint? = nil
    private let connection: ConnectionManager
    
    init(connection: ConnectionManager){
        self.connection = connection
    }
    
    func handleDragChanged(_ currentLocation: CGPoint) {
        if let prev = previousPoint{
            let dx = currentLocation.x - prev.x
            let dy = currentLocation.y - prev.y
            let delta = CGSize(width: dx, height: dy)
            lastDelta = delta
            
            // Update cursor locally (for testing)
            cursorPoint = CGPoint(x: cursorPoint.x + dx, y: cursorPoint.y + dy)
            
            // Send delta to ESP (stub for now)
            connection.accumulateDelta(dx: dx, dy: dy)
        }
        
        previousPoint = currentLocation
    }
    
    func handleDragEnded() {
        previousPoint = nil
    }
}
