//
//  RuntimeConfig.swift
//  RemoteController
//
//  Central place for lab/runtime toggles while production transport is still
//  being built. Defaults match the current accepted performance baseline.
//

import Foundation

enum AppRuntimeConfig {
    static let useWifiUdpMotion = true

    enum WifiMotion {
        // Lab-only until Bonjour/discovery replaces hardcoded IPs.
        static let host = "192.168.18.104"
        static let port: UInt16 = 4210
        static let packetMarker: UInt8 = 0xB2
        static let schedulingMode: UDPMotionSender.SchedulingMode = .accumulator125Hz
        static let pointerDtMode: PointerMotionEngine.DtMode = .clamped90Hz
    }

    enum DisplayLink {
        static let pauseWhenIdle = true
        static let targetFPS = 60
    }

    enum DynamicMatrix {
        static let enableRandomAnimation = false
    }

    enum PointerPath {
        static let smoothingMode: PointerPathSmoothingMode = .oneEuroLight
    }
}

enum RuntimeDiagnostics {
    // Keep these false unless actively collecting logs.
    static let movementPipeline = false
    static let transportStateLogs = false
    static let periodicBlePacketStats = false
}
