//
//  DisplayStore.swift
//  UITest
//
//  Observable state container for DisplayView.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class DisplayStore: ObservableObject {
    @Published var title: String
    @Published var screen: DisplayScreen
    @Published var settingsOverlay: SettingsViewModel?
    @Published var settingsOverlayOpacity: Double = 0
    @Published var settingsOverlayTitle: String = "SETTINGS"
    
    /// Duration in seconds before settings overlay fades out (default: 2.0)
    var settingsFadeOutDelay: TimeInterval = 2.0
    
    private var settingsFadeOutTask: Task<Void, Never>?

    init(title: String = "STATUS") {
        self.title = title
        self.screen = .preConnection(.init(status: .disconnected, tip: .enableBluetooth, statusItems: []))
    }

    init(title: String, screen: DisplayScreen) {
        self.title = title
        self.screen = screen
    }

    func showPreConnection(_ model: PreConnectionViewModel, title: String = "STATUS") {
        self.title = title
        self.screen = .preConnection(model)
    }

    func showConnectionMonitor(_ model: ConnectionMonitorViewModel, title: String = "CONNECTION QUALITY") {
        self.title = title
        self.screen = .connectionMonitor(model)
    }


    
    /// Show settings overlay on top of current content
    func showSettingsOverlay(_ model: SettingsViewModel, title: String = "SETTINGS", fadeOutDelay: TimeInterval? = nil) {
        // Cancel any existing fade out task
        settingsFadeOutTask?.cancel()
        
        // Store overlay title separately so it doesn't affect underlying content title
        self.settingsOverlayTitle = title
        self.settingsOverlay = model
        
        // Fade in
        withAnimation(.easeInOut(duration: 0.2)) {
            self.settingsOverlayOpacity = 1.0
        }
        
        // Schedule fade out
        let delay = fadeOutDelay ?? settingsFadeOutDelay
        settingsFadeOutTask = Task { @MainActor in
            try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
            if !Task.isCancelled {
                hideSettingsOverlay()
            }
        }
    }
    
    /// Hide settings overlay
    func hideSettingsOverlay() {
        settingsFadeOutTask?.cancel()
        settingsFadeOutTask = nil
        
        withAnimation(.easeInOut(duration: 0.2)) {
            self.settingsOverlayOpacity = 0.0
        }
        
        // Remove overlay after animation completes
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            if self.settingsOverlayOpacity == 0 {
                self.settingsOverlay = nil
            }
        }
    }
}

