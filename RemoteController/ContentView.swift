//
//  ContentView.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/2.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var connection: ConnectionManager
    @StateObject private var displayStore = DisplayStore()
    @StateObject private var keyboardViewModel: KeyboardViewModel
        
    @State private var isKeyboardOn: Bool = false
    @State private var previousConnectionStatus: PreConnectionStatus = .disconnected
    @State private var connectionMonitorTransitionTask: Task<Void, Never>?
    
    @State private var currStatusText: String = "Disconnected"
    @State private var isUICollapsed: Bool = false
    
    init() {
        let conn = ConnectionManager()
        _connection = StateObject(wrappedValue: conn)
        _keyboardViewModel = StateObject(wrappedValue: KeyboardViewModel(connection: conn))
    }
    
    var body: some View {
        ZStack {
            // MARK: - TOUCH PAD
            TouchPadView(connection: connection)
           
            VStack {
                // MARK: - TOP UI MODULE
                ZStack {
                    // Background
                    // Gradient
                    RoundedRectangle(cornerRadius: 0)
                        .fill(LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(red: 0.125, green: 0.125, blue: 0.125), location: 0),
                                .init(color: Color(red: 0.106, green: 0.106, blue: 0.106), location: 1)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ))
                    // texture
                    RoundedRectangle(cornerRadius: 0)
                        .fill(ImagePaint(
                            image: Image("textureBackground"),
                            scale: 0.25
                        ))
                        .ignoresSafeArea()
                        .blendMode(.overlay)
                    
                    
                    // MARK: - TOP UI CONTENT
                    VStack (spacing: 0){
                        Spacer()
                        HStack (alignment: .bottom) {
                            VStack {
                                HStack {
                                    // Decoration - Indicator Light
                                    ZStack {
                                        Circle()
                                            .fill(Color.displayBackgroundBlack)
                                            .strokeBorder(LinearGradient(
                                                gradient: Gradient(stops: [
                                                    .init(color: Color.borderGradientDark, location: 0),
                                                    .init(color: Color.borderGradientLight, location: 1)]),
                                                startPoint: UnitPoint(x: 0, y: 0),
                                                endPoint: UnitPoint(x: 1, y: 1)), lineWidth: 0.5)
                                            .frame(width: 7, height: 7)
                                            .shadow(color: Color.shadowGreen, radius:7, x:0, y:0)
                                        
                                        Circle()
                                            .fill(Color(#colorLiteral(red: 0.4844153821468353, green: 0.754563570022583, blue: 0.2778315246105194, alpha: 1)))
                                            .frame(width: 5.3, height: 5.3)
                                            .shadow(color: Color.shadowGreen, radius:2, x:0, y:0)
                                    }
                                    
                                    Text("MAX_RELAY")
                                        .font(.custom("SixtyfourEvenly-Regular", size: 9))
                                        .foregroundColor(Color.printGray)
                                        .opacity(1)
                                    Spacer()
                                    
                                    // Decoration - Vent
                                    Image("Vent")
                                }
                                .padding(.bottom, 1)
                                
                                
                                // MARK: - Display View
                                DisplayView(store: displayStore)
                                
                                
                            }
                            .frame(width:204)
                            .padding(.trailing, 24)
                            
                            
                            VStack{
                                Text("scroll")
                                    .font(.custom("Instrument Sans", size: 10))
                                    .foregroundColor(Color.printGray)
                                    .offset(x: -2)
                                    .padding(.bottom, 10)
                                
                                CustomSlider(value: 2)
                                    .padding(.bottom, 4)
                            }
                            .padding(.trailing, 14)
                            
                            VStack{
                                Text("cursor")
                                    .font(.custom("Instrument Sans", size: 10))
                                    .foregroundColor(Color.printGray)
                                    .offset(x: -2)
                                    .padding(.bottom, 10)
                                CustomSlider(value: 2)
                                    .padding(.bottom, 4)
                            }
                        }
                        .padding(.bottom, 14)
                        .opacity(isUICollapsed ? 0 : 1)
                        
                        
                        

                        
                        
                        
                        // Grip Zone
                        VStack {
                            // MARK:  - TOP UI BTNs
                            HStack (spacing: 16) {
                                CustomCircleButton(systemImageName: "line.3.horizontal.circle", isActive: false){}
                                    .opacity(0.5)
                                    .disabled(true)
                                
                                // Secondary Display
                                VStack (alignment: .center, spacing: 0) {
                                    if isUICollapsed {
                                        Text(currStatusText)
                                            .font(.custom("Pixelify Sans", size: 16))
                                            .foregroundColor(currStatusText.uppercased() == "CONNECTED" ? .displayGreen : .white)
                                            .id(currStatusText)
                                            .transition(.opacity.combined(with: .scale(scale: 0.95)))
                                            
                                    } else {
                                        Text("ദ്ദി(  ˵ •̀ ᴗ - ˵  ) ✧")
                                            .font(.custom("Pixelify Sans", size: 17))
                                            .foregroundColor(.white)
                                            
                                    }
                                }
                                .padding(8)
                                .frame(width: 144, height: 38)
                                .background(DisplayCardBackground())
                                .clipped()
                                .padding(.leading, 8)
                                
                                CustomCircleButton(systemImageName: "arrow.up.and.down", isActive: false){}
                                    .opacity(0.5)
                                    .disabled(true)
                                // Keyboard toggle button
                                CustomCircleButton(
                                    systemImageName: "keyboard",
                                    isActive: isKeyboardOn
                                ) {
                                    toggleKeyboard()
                                }
                            }
                            .frame(maxWidth: 330)
                            .padding(.bottom, 4)
                            
                            
                            Image("GripDots")
                                .opacity(0.4)
                                .padding(.bottom, 12)
                            
                        }
                        .frame (minHeight: 40)
                        .gesture(
                            DragGesture(minimumDistance: 15)
                                .onEnded { value in
                                    let verticalMovement = value.translation.height
                                    // Swipe up (negative translation) -> collapse
                                    if verticalMovement < -50 && !isUICollapsed {
                                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                            isUICollapsed = true
                                        }
                                    }
                                    // Swipe down (positive translation) -> expand
                                    else if verticalMovement > 50 && isUICollapsed {
                                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                                            isUICollapsed = false
                                        }
                                    }
                                }
                        )
                        
                        
                    }
                    .padding(.top, 40)
                }
                .compositingGroup()
                .clipShape(RoundedRectangle(cornerRadius: 47))
                .overlay(
                    RoundedRectangle(cornerRadius: 47)
                        .stroke(Color.black.opacity(0.9), lineWidth: 6)
                        .blur(radius: 4)
                        .clipShape(RoundedRectangle(cornerRadius: 47))
                )
                .frame(maxWidth: .infinity, maxHeight: 310)
                .offset(y: isUICollapsed ? -180 : 0)
                .drawingGroup()
                .shadow(color: .black, radius: 15, x: 0, y: 2)
                
                Spacer()
                
                // MARK: - KEYBOARD
                if isKeyboardOn {
                    ZStack {
                        // Background
                        // Gradient
                        RoundedRectangle(cornerRadius: 0)
                            .fill(LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(red: 0.125, green: 0.125, blue: 0.125), location: 0),
                                    .init(color: Color(red: 0.106, green: 0.106, blue: 0.106), location: 1)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                        
                        // Texture
                        RoundedRectangle(cornerRadius: 0)
                            .fill(ImagePaint(
                                image: Image("textureBackground"),
                                scale: 0.25
                            ))
                            .ignoresSafeArea()
                            .blendMode(.overlay)
                        
                        VStack {
                            KeyboardView(viewModel: keyboardViewModel)
                                .id("keyboard") // Stable identity to prevent unnecessary re-renders
                                .padding(.bottom, 40)
                                .padding(.horizontal, 4)
                        }
                    }
                    .compositingGroup()
                    .frame(maxWidth: .infinity, maxHeight: 320)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black.opacity(0.9), lineWidth: 6)
                            .blur(radius: 4)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    )
                    .drawingGroup()
                    .shadow(color: .black, radius: 15, x: 0, y: 2)
                    .transition(.asymmetric( // keyboard transition animation
                        insertion: .move(edge: .bottom).combined(with: .opacity),
                        removal: .move(edge: .bottom).combined(with: .opacity)
                    ))
                }
                
                
                
                
            }
            
        }
        .ignoresSafeArea()
        // Connection status changed -> Display Transition
        .onChange(of: connection.preConnectionModel.status) { oldStatus, newStatus in
            handleConnectionStatusChange(from: oldStatus, to: newStatus)
            
            withAnimation(.easeInOut(duration: 0.3)) {
                switch connection.preConnectionModel.status{
                case .connected: currStatusText = "CONNECTED"
                case .connecting: currStatusText = "CONNECTING..."
                case .disconnected: currStatusText = "DISCONNECT"
                case .searching: currStatusText = "SEARCHING..."
                }
            }
        }
        // Currently showing PreConnectionView
        .onChange(of: connection.preConnectionModel) { _, newModel in
            // Prevents overwriting ConnectionMonitorView during transitions
            if displayStore.screen.isPreConnection {
                displayStore.showPreConnection(newModel)
            }
        }
        // Currently showing ConnectionMonitorView
        .onChange(of: connection.connectionMonitorModel) { _, newModel in
            if case .connectionMonitor = displayStore.screen {
                displayStore.showConnectionMonitor(newModel)
            }
        }
        .onAppear {
            // Initialize display with current connection state
            previousConnectionStatus = connection.preConnectionModel.status
            if connection.preConnectionModel.status == .connected {
                // If already connected, transition after delay
                scheduleConnectionMonitorTransition()
            } else {
                displayStore.showPreConnection(connection.preConnectionModel)
            }
        }
    }
    
    
    // MARK: Helper Functions
    
    private func handleConnectionStatusChange(from oldStatus: PreConnectionStatus, to newStatus: PreConnectionStatus) {
        // Cancel any pending transition task
        connectionMonitorTransitionTask?.cancel()
        connectionMonitorTransitionTask = nil
        
        // If status changed from disconnected to connected
        // schedule transition to ConnectionMonitor after 2s
        if newStatus == .connected && oldStatus != .connected {
            scheduleConnectionMonitorTransition()
        }
        // If status changed from connected to disconnected
        // immediately show PreConnectionView
        else if oldStatus == .connected && newStatus != .connected {
            displayStore.showPreConnection(connection.preConnectionModel)
        }
        
        previousConnectionStatus = newStatus
    }
    
    private func scheduleConnectionMonitorTransition() {
        connectionMonitorTransitionTask?.cancel()
        connectionMonitorTransitionTask = Task { @MainActor in
            // Wait 2 seconds
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            
            // Check if still connected and task wasn't cancelled
            guard !Task.isCancelled,
                  connection.preConnectionModel.status == .connected else {
                return
            }
            
            // Transition to ConnectionMonitor with current model
            displayStore.showConnectionMonitor(connection.connectionMonitorModel)
        }
    }
    
    private func toggleKeyboard() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            isKeyboardOn.toggle()
        }
        
        // Show settings overlay with keyboard on/off view
        let settingsModel = SettingsViewModel(
            viewType: .keyboardOnOff,
            keyboardOnOff: KeyboardOnOffViewModel(isKeyboardOn: isKeyboardOn)
        )
        displayStore.showSettingsOverlay(settingsModel, title: "SETTINGS", fadeOutDelay: 2.0)
    }
}

#Preview {
    ContentView()
}
