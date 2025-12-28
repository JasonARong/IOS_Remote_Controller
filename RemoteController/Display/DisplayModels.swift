//
//  DisplayModels.swift
//  UITest
//
//  Data-only models for DisplayView and its child views.
//

import Foundation

// MARK: - Status Item

struct StatusItem: Identifiable, Equatable {
    enum StatusType: Equatable {
        case success
        case info
        case error
    }

    let id: UUID
    let text: String
    let type: StatusType

    init(id: UUID = UUID(), text: String, type: StatusType) {
        self.id = id
        self.text = text
        self.type = type
    }
}

// MARK: - PreConnection

enum PreConnectionStatus: String, CaseIterable, Equatable {
    case disconnected = "DISCONNECTED"
    case searching = "SEARCHING..."
    case connecting = "CONNECTING..."
    case connected = "CONNECTED"
}

enum PreConnectionTip: Equatable {
    case enableBluetooth
    case authorizeBluetooth
    case unsupportedBluetooth
    case connectDongle

    var text: String {
        switch self {
        case .enableBluetooth:
            return "Enable Bluetooth in your iPhone’s Settings"
        case .authorizeBluetooth:
            return "Authorized Bluetooth in your iPhone’s Settings"
        case .unsupportedBluetooth:
            return "Your iPhone does not support Bluetooth"
        case .connectDongle:
            return "Connect your ESP Dongle to the device you want to control"
        }
    }
}

struct PreConnectionViewModel: Equatable {
    var status: PreConnectionStatus
    var tip: PreConnectionTip?
    /// Newest-first for “stacking on top”.
    var statusItems: [StatusItem]

    init(status: PreConnectionStatus, tip: PreConnectionTip? = nil, statusItems: [StatusItem]) {
        self.status = status
        self.tip = tip
        self.statusItems = statusItems
    }
}

// MARK: - Connection Monitor

struct PacketData: Identifiable, Equatable {
    let id: UUID
    let sent: Int
    let lost: Int
    
    var total: Int {
        sent + lost
    }
    
    init(id: UUID = UUID(), sent: Int, lost: Int) {
        self.id = id
        self.sent = sent
        self.lost = lost
    }
}

struct ConnectionMonitorViewModel: Equatable {
    /// Packet loss per mille (0-999, where 1000‰ = 100%)
    var packetLossPercentage: Int
    /// Connection stability status
    var isStable: Bool
    /// Packet data for live bar chart (newest-first)
    var packets: [PacketData]
    
    init(packetLossPercentage: Int = 0, isStable: Bool = true, packets: [PacketData] = []) {
        self.packetLossPercentage = max(0, min(999, packetLossPercentage))
        self.isStable = isStable
        self.packets = packets
    }
}

// MARK: - Settings

enum SettingsViewType: Equatable {
    case keyboardOnOff
    // Add other settings view types in the future
}

struct KeyboardOnOffViewModel: Equatable {
    var isKeyboardOn: Bool
    
    init(isKeyboardOn: Bool = false) {
        self.isKeyboardOn = isKeyboardOn
    }
}

struct SettingsViewModel: Equatable {
    var viewType: SettingsViewType
    var keyboardOnOff: KeyboardOnOffViewModel
    
    init(viewType: SettingsViewType = .keyboardOnOff, keyboardOnOff: KeyboardOnOffViewModel = .init()) {
        self.viewType = viewType
        self.keyboardOnOff = keyboardOnOff
    }
}

// MARK: - Display container

enum DisplayScreen: Equatable {
    case preConnection(PreConnectionViewModel)
    case connectionMonitor(ConnectionMonitorViewModel)
    
    var isPreConnection: Bool {
        if case .preConnection = self {
            return true
        }
        return false
    }
}

