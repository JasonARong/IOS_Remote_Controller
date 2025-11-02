//
//  TouchPadView.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/2.
//

import SwiftUI

struct TouchPadView: View {
    @StateObject private var connection: ConnectionManager
    @StateObject private var viewModel: TouchPadViewModel
    
    init (){
        let conn = ConnectionManager()
        _connection = StateObject(wrappedValue: conn)
        _viewModel = StateObject(wrappedValue: TouchPadViewModel(connection: conn))
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
            .background(Color(white: 0.98))
            
            // Decorations should NOT intercept touches:
            Rectangle()
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [12,4]))
                .allowsHitTesting(false)
            ZStack {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 40, height: 40)
                    .position(viewModel.cursorPoint)
            }.allowsHitTesting(false)
            
            
            VStack {
                Text(pointText)
                   .font(.caption)
                   .padding(8)
                   .background(.ultraThinMaterial, in: Capsule())
                   .padding(8)
                
                Text(connection.statusMessage)
                Text(viewModel.mouseStatus)
                
            }
        }
    }
    

}

#Preview {
    TouchPadView()
}
