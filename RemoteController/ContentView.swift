//
//  ContentView.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/2.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("Click \(count)")
            
            Button("Increment"){
                count += 1
                print("count: \(count)")
            }
            .buttonStyle(.bordered)
            
            TouchPadView() 
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
