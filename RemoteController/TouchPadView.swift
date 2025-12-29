//
//  TouchPadView.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/2.
//

import SwiftUI

struct TouchPadView: View {
    @ObservedObject var connection: ConnectionManager
    @ObservedObject var matrixViewModel: DynamicMatrixViewModel
    @StateObject private var viewModel: TouchPadViewModel
    
    init(connection: ConnectionManager, matrixViewModel: DynamicMatrixViewModel) {
        _connection = ObservedObject(wrappedValue: connection)
        _matrixViewModel = ObservedObject(wrappedValue: matrixViewModel)
        _viewModel = StateObject(wrappedValue: TouchPadViewModel(connection: connection, matrixViewModel: matrixViewModel))
    }
    
    // Convenience init for preview/standalone use
    init() {
        let conn = ConnectionManager()
        let matrix = DynamicMatrixViewModel()
        _connection = ObservedObject(wrappedValue: conn)
        _matrixViewModel = ObservedObject(wrappedValue: matrix)
        _viewModel = StateObject(wrappedValue: TouchPadViewModel(connection: conn, matrixViewModel: matrix))
    }
    
    
    private var pointText: String {
        if let delta = viewModel.lastDelta {
            return String(format: "Δx: %.0f  Δy: %.0f", delta.width, delta.height)
        } else {
            return "Touch inside the pad"
        }
    }
    
    var body: some View {
        ZStack{
            TouchPadUIViewRepresentable(
                onTouchesChanged: { touches, event in
                    viewModel.handleTouchesChanged(touches, event: event)
                },
                onTouchesEnded: { touches, event in
                    viewModel.handleTouchesEnded(touches, event: event)
                }
            )
            
            // Decorations should NOT intercept touches:
//            Rectangle()
//                .stroke(style: StrokeStyle(lineWidth: 2, dash: [12,4]))
//                .allowsHitTesting(false)
//            ZStack {
//                Circle()
//                    .fill(Color.gray)
//                    .frame(width: 40, height: 40)
//                    .position(viewModel.cursorPoint)
//            }.allowsHitTesting(false)
//            
//            
//            VStack {
//                Text(pointText)
//                   .font(.caption)
//                   .padding(8)
//                   .background(.ultraThinMaterial, in: Capsule())
//                   .padding(8)
//                
//                Text(connection.statusMessage)
//                Text(viewModel.mouseStatus)
//                Text("Gesture: \(viewModel.gestureStatus)")
//                
//            }
        }
    }
    

}

#Preview {
    TouchPadView()
}
