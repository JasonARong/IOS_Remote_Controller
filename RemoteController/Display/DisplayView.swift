//
//  DisplayView.swift
//  UITest
//
//  Created by 陈皆成 on 2025/12/25.
//

import SwiftUI

struct DisplayView: View {
    @ObservedObject var store: DisplayStore
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Main content
            VStack (alignment: .leading, spacing: 0) {
                Text(store.title)
                    .font(.custom("Pixelify Sans", size: 13))
                    .foregroundColor(.white)
                
                content
            }
            .padding(EdgeInsets(top: 14, leading: 10, bottom: 0, trailing: 10))
            .frame(width: 204, height: 140, alignment: .topLeading)
            .background(DisplayCardBackground())
            .clipped()
            
            // Settings overlay
            if let settingsModel = store.settingsOverlay {
                VStack (alignment: .leading, spacing: 0) {
                    Text(store.settingsOverlayTitle)
                        .font(.custom("Pixelify Sans", size: 13))
                        .foregroundColor(.white)
                    
                    SettingsView(model: settingsModel)
                }
                .padding(EdgeInsets(top: 14, leading: 10, bottom: 0, trailing: 10))
                .frame(width: 204, height: 140, alignment: .topLeading)
                .background(DisplayCardBackground())
                .clipped()
                .opacity(store.settingsOverlayOpacity)
            }
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch store.screen {
        case .preConnection(let model):
            PreConnectionView(model: model)
        case .connectionMonitor(let model):
            ConnectionMonitorView(model: model)
//        case .settings:
//            Text("SettingsView")
//                .font(.system(size: 24))
//                .foregroundColor(.white)
//                .opacity(0.6)
        }
    }
}

#Preview("DisplayView - Interactive PreConnection Flow") {
    struct Demo: View {
        @StateObject private var store = DisplayStore()
        @State private var eventIndex: Int = 0
        @State private var isAdvancing: Bool = false
        @State private var model: PreConnectionViewModel = .init(status: .disconnected, tip: .enableBluetooth, statusItems: [])

        private struct DemoEvent {
            var status: PreConnectionStatus?
            var tip: PreConnectionTip??
            var newItem: StatusItem?
        }

        private let events: [DemoEvent] = [
            .init(status: .disconnected, tip: .some(.enableBluetooth), newItem: .init(text: "Bluetooth is OFF", type: .info)),
            .init(status: .disconnected, tip: .some(.authorizeBluetooth), newItem: .init(text: "Bluetooth is Unauthorized", type: .info)),
            .init(status: .searching, tip: .some(.connectDongle), newItem: .init(text: "Bluetooth is ON", type: .success)),
            .init(status: .connecting, tip: .some(nil), newItem: .init(text: "Found ESP Dongle", type: .success)),
            .init(status: .connected, tip: .some(nil), newItem: .init(text: "Connected to ESP", type: .success)),
            .init(status: .connecting, tip: .some(nil), newItem: .init(text: "Connection Error", type: .error)),
        ]

        var body: some View {
            VStack(spacing: 16) {
                DisplayView(store: store)

                HStack(spacing: 10) {
                    Button("Reset") { reset() }
                    Button("Next") { next() }
                        .disabled(isAdvancing || eventIndex >= events.count)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(Color.black)
            .onAppear { reset() }
        }

        private func reset() {
            eventIndex = 0
            isAdvancing = false
            model = .init(status: .disconnected, tip: .enableBluetooth, statusItems: [])
            store.showPreConnection(model)
        }

        private func next() {
            guard !isAdvancing, eventIndex < events.count else { return }
            isAdvancing = true
            let event = events[eventIndex]
            eventIndex += 1

            if let status = event.status { model.status = status }
            if let tipWrapper = event.tip { model.tip = tipWrapper }
            if let item = event.newItem { model.statusItems.insert(item, at: 0) }
            store.showPreConnection(model)

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.65) {
                self.isAdvancing = false
            }
        }
    }

    return Demo()
}
