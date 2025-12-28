//
//  ContentView.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/2.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    @StateObject private var connection: ConnectionManager
    @StateObject private var keyboardViewModel: KeyboardViewModel
    
    init() {
        let conn = ConnectionManager()
        _connection = StateObject(wrappedValue: conn)
        _keyboardViewModel = StateObject(wrappedValue: KeyboardViewModel(connection: conn))
    }
    
    var body: some View {
        VStack {
            Text("Click \(count)")
            
            Button("Increment"){
                count += 1
                print("count: \(count)")
            }
            .buttonStyle(.bordered)
            
            TouchPadView(connection: connection)
            
            KeyboardView(viewModel: keyboardViewModel)
                .frame(height: 300)
                .background(Color.black)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
