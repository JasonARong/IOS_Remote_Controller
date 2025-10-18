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
            Rectangle()
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [12,4])) // draw border inside the rectangle shape
                .background(Rectangle().fill(Color(white: 0.98))) // puts another filled rectangle behind
                .overlay{
                    ZStack{
                        Circle() // Cursor
                            .fill(Color.gray)
                            .frame(width:40, height:40)
                            .position(viewModel.cursorPoint)
                    }
                }
                .gesture(
                    DragGesture(minimumDistance: 0) // Tap as drag
                        .onChanged { value in
                            viewModel.handleDragChanged(value.location)
                        }
                        .onEnded { _ in // use _ when explicitly ignore value
                            viewModel.handleDragEnded()
                        }
                )
            
            VStack {
                Text(pointText)
                   .font(.caption)
                   .padding(8)
                   .background(.ultraThinMaterial, in: Capsule())
                   .padding(8)
                
                Text(connection.statusMessage)
//                Text(connection.isConnected ? "Connected" : "Disconnected")
            }
        }
    }
    

}

#Preview {
    TouchPadView()
}
