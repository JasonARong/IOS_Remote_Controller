//
//  ConnectionManager.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/3.
//

import Foundation
import CoreBluetooth
import Combine
import QuartzCore
import UIKit

/// Abstracts communication to ESP (BLE/Wi-Fi/USB).
/// Inherits NSObject: required for Bluetooth delegate callbacks
/// Conforms ObservableObject: allows SwiftUI views to observe changes
/// Conforms CBCentralManagerDelegate, CBPeripheralDelegate: receives Bluetooth events  & implement callbacks
class ConnectionManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    // MARK: BLE handles
    private var centralManager: CBCentralManager! /// manages Bluetooth devices connections
    private var peripheral: CBPeripheral? /// Connected Bluetooth devices
    private var writeBleCharacteristic: CBCharacteristic? /// represent a specific data channel on the Bluetooth device
    
    // MARK: State published to UI (optional for debugging)
    @Published var isConnected = false
    @Published var statusMessage = "Initializing Bluetooth..."
    @Published var packetsDropped: Int = 0
    @Published var preConnectionModel: PreConnectionViewModel = PreConnectionViewModel(
        status: .disconnected,
        tip: nil,
        statusItems: []
    )
    @Published var connectionMonitorModel: ConnectionMonitorViewModel = ConnectionMonitorViewModel()
    
    // MARK: UUIDs must match ESP side
    private var serviceUUID = CBUUID(string: "00001234-0000-1000-8000-00805f9b34fb")
    private var characteristicUUID = CBUUID(string: "0000abcd-0000-1000-8000-00805f9b34fb")

    // MARK: Wi-Fi UDP motion
    private let useWifiUdpMotion = AppRuntimeConfig.useWifiUdpMotion
    let udpPointerDtMode: PointerMotionEngine.DtMode = AppRuntimeConfig.WifiMotion.pointerDtMode
    private var udpMotionSender: UDPMotionSender?

    // Smooth cursor and scroll
    private var displayLink: CADisplayLink? /// use displayLink to send packets at an constant rate
    private let pauseDisplayLinkWhenIdle = AppRuntimeConfig.DisplayLink.pauseWhenIdle
    private let targetFPS: Int = AppRuntimeConfig.DisplayLink.targetFPS /// Sending packets' rate
    private var lastTickTimestamp: CFTimeInterval? = nil
    var onTick: ((CFTimeInterval) -> Void)? // Callback so ScrollMotionEngine can run per-frame logic.
    
    // Cursor movement
    private var accumulatedDX: CGFloat = 0
    private var accumulatedDY: CGFloat = 0
    #if DEBUG
    private var debugMouseSequence: UInt8 = 0
    #endif
    
    // Mouse Buttons (left & right)
    private var buttonsState: UInt8 = 0 // [0b00000000] bit0 = left btn, bit1 = right btn
    private var buttonDirty: Bool = false // Mark state changes => require data to be sent
    private var leftHeld: Bool = false
    
    // Scroll (mouse wheel)
    private var wheelDelta: Int8 = 0
    private var accumulatedWheel: CGFloat = 0
    private let wheelPixelsPerTick: CGFloat = 0.05 // Tunable (6~12)
    private let scrollSensitivity: CGFloat = 0.005   // 0.2–0.5 recommended
    private let scrollHaptic = UISelectionFeedbackGenerator() // Haptic feedback for scroll tick
    
    // Statistics
    private var packetsSent: Int = 0
    private var lastStatsTime: Date = Date()
    
    
    
    // Two Finger gestures
    enum SystemCommand { // should stay consistant with TwoFingerCommand
        case none
        case swipeLeft
        case swipeRight
        case swipeUp
        case swipeDown
    }
    
    // MARK: - Profile
    
    struct InputMappingProfile {
        let name: String
        let bindings: [SystemCommand: [LogicalKey]]
    }
    
    /// The currently active mapping profile
    private var currentProfile: InputMappingProfile
    
    /// Default macOS-style mapping:
    private let macDefaultProfile = InputMappingProfile(
        name: "macOS Default",
        bindings: [
            .swipeLeft:  [.control, .arrowRight],
            .swipeRight: [.control, .arrowLeft],
            .swipeUp:    [.control, .arrowUp],
            .swipeDown:  [.control, .arrowDown]
        ]
    )
    
    
    // MARK: init & deinit
    override init() { /// override initializer of NSObject
        self.currentProfile = macDefaultProfile /// use mac profile as an default
        super.init()
        
        /// delegate: self ( this class will receive Bluetooth callbacks ) ( require self to be delegate type)
        /// queue: nil ( callbacks run on the main thread )
        centralManager = CBCentralManager(delegate: self, queue: nil)
        if useWifiUdpMotion {
            udpMotionSender = UDPMotionSender(
                host: AppRuntimeConfig.WifiMotion.host,
                port: AppRuntimeConfig.WifiMotion.port,
                packetMarker: AppRuntimeConfig.WifiMotion.packetMarker,
                schedulingMode: AppRuntimeConfig.WifiMotion.schedulingMode
            )
        }
        startDisplayLink()
    }
    
    deinit {
        stopDisplayLink()
        udpMotionSender?.cancel()
    }
    
    
    // MARK: - Send to ESP
    // Display link pacing based on targetFPS
    private func startDisplayLink() {
        lastTickTimestamp = nil
        
        let displayLink = CADisplayLink(target: self, selector: #selector(tick))
        if #available(iOS 15.0, *){ // System will choose within preferred targetFPS (60 or 120)
            displayLink.preferredFrameRateRange = CAFrameRateRange(minimum: 30, maximum: Float(targetFPS), preferred: Float(targetFPS))
        } else {
            displayLink.preferredFramesPerSecond = targetFPS
        }
        displayLink.isPaused = pauseDisplayLinkWhenIdle
        displayLink.add(to: .main, forMode: .common) // ".main" run loop with ".common" mode
        self.displayLink = displayLink
    }
    
    private func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }

    func wakeDisplayLinkForInput() {
        guard pauseDisplayLinkWhenIdle else { return }
        lastTickTimestamp = nil
        displayLink?.isPaused = false
    }

    private func pauseDisplayLinkIfIdle() {
        guard pauseDisplayLinkWhenIdle else { return }
        guard buttonDirty == false,
              wheelDelta == 0,
              accumulatedDX == 0,
              accumulatedDY == 0 else { return }
        lastTickTimestamp = nil
        displayLink?.isPaused = true
    }
    
    @objc private func tick(){
        // --- Compute dt and notify scroll engine ---
        let now = CACurrentMediaTime()
        let dt: CFTimeInterval
        if let last = lastTickTimestamp {
            dt = now - last
        } else {
            dt = 1.0 / CFTimeInterval(targetFPS)   // safe fallback
        }
        lastTickTimestamp = now
        MovementDiagnostics.shared.recordBleTickInterval(dt)
        onTick?(dt)
        
        // Collect packet stats every 2 seconds (even if no packets sent)
        if RuntimeDiagnostics.periodicBlePacketStats,
           let _ = peripheral, let _ = writeBleCharacteristic {
            let statsNow = Date()
            if statsNow.timeIntervalSince(lastStatsTime) >= 2.0 {
                print("📊 Sent \(packetsSent) packets in 2s, dropped: \(packetsDropped)")
                
                // Create PacketData from current stats and queue for update
                let packetData = PacketData(sent: packetsSent, lost: packetsDropped)
                updateConnectionMonitor(with: packetData)
                
                // Reset counters for next interval
                packetsSent = 0
                packetsDropped = 0
                lastStatsTime = statsNow
            }
        }
        
        let hasMoved = (accumulatedDX != 0 || accumulatedDY != 0)
        let hasWheel = (wheelDelta != 0)
        let shouldSendBleMouse = buttonDirty || hasWheel || (!useWifiUdpMotion && hasMoved)
        if useWifiUdpMotion && hasMoved && !shouldSendBleMouse {
            accumulatedDX = 0
            accumulatedDY = 0
        }
        guard shouldSendBleMouse else {
            pauseDisplayLinkIfIdle()
            return
        }
        
        // Movement
        let dx = accumulatedDX
        let dy = accumulatedDY
        accumulatedDX = 0
        accumulatedDY = 0
        // ESP require number in raw bytes
        /// Turn floating-point deltas into 16-bit integers (e.g. 0x1234) (2 bytes)
        let dxClamped = max(-32767, min(32767, dx))
        let dyClamped = max(-32767, min(32767, dy))
        let dxInt16 = Int16(dxClamped)
        let dyInt16 = Int16(dyClamped)
        
        // Scroll Wheel
        let wheelDeltaUInt8 = UInt8(bitPattern: wheelDelta)
        wheelDelta = 0

        MovementDiagnostics.shared.recordBleAttempt()
        let bleDxInt16: Int16 = useWifiUdpMotion ? 0 : dxInt16
        let bleDyInt16: Int16 = useWifiUdpMotion ? 0 : dyInt16
        
        // Build packet
        // Release packet: [buttons, Scroll, dxLE(1), dxLE(2), dyLE(1), dyLE(2)] → 6 bytes
        // Debug packet: [0xA1, seq, buttons, Scroll, dxLE(1), dxLE(2), dyLE(1), dyLE(2)] → 8 bytes
        var packet = Data(capacity: 8)
        #if DEBUG
        debugMouseSequence &+= 1
        packet.append(0xA1)
        packet.append(debugMouseSequence)
        #endif
        packet.append(buttonsState) // Left & Right button
        packet.append(wheelDeltaUInt8) // Scroll wheel
        
        /// little-endian byte order: least significant byte first, ESP32 uses this order
        withUnsafeBytes(of: bleDxInt16.littleEndian) { bytes in /// bytes: pointer to the memory containing dxInt16
            packet.append(contentsOf: bytes) /// withUnsafeBytes accesses the raw bytes in actual memory via pointer
        }
        withUnsafeBytes(of: bleDyInt16.littleEndian) { bytes in
            packet.append(contentsOf: bytes)
        }
        
        
        guard let peripheral = peripheral,
              let char = writeBleCharacteristic else {
//            print("⚪️ Stub: would send dx=\(dxInt16), dy=\(dyInt16)")
            if bleDxInt16 != 0 || bleDyInt16 != 0 {
                MovementDiagnostics.shared.recordMovementDropped(reason: .disconnected, dx: CGFloat(bleDxInt16), dy: CGFloat(bleDyInt16))
            }
            pauseDisplayLinkIfIdle()
            return
        }
        
        if peripheral.canSendWriteWithoutResponse {
            peripheral.writeValue(packet, for: char, type: .withoutResponse) // send data to the writeCharacteristic endpoint
//            print("🔵 Sent to ESP: dx=\(dxInt16), dy=\(dyInt16), button=\(buttonsState), wheel=\(wheelDelta)")
            buttonDirty = false
            packetsSent += 1
            MovementDiagnostics.shared.recordBleSent(dx: bleDxInt16, dy: bleDyInt16)
        } else {
            packetsDropped += 1
            MovementDiagnostics.shared.recordBleBlocked()
            if bleDxInt16 != 0 || bleDyInt16 != 0 {
                MovementDiagnostics.shared.recordMovementDropped(reason: .bleBlocked, dx: CGFloat(bleDxInt16), dy: CGFloat(bleDyInt16))
            }
        }
        pauseDisplayLinkIfIdle()
    }

    // MARK: - PreConnection Model Updates
    
    private func updatePreConnectionModel(
        status: PreConnectionStatus,
        tip: PreConnectionTip? = nil,
        addStatusItem: StatusItem? = nil,
        replaceStatusItems: [StatusItem]? = nil
    ) {
        var newItems = replaceStatusItems ?? preConnectionModel.statusItems
        
        if let newItem = addStatusItem {
            // Add new item at the beginning (newest-first)
            newItems.insert(newItem, at: 0)
        }
        
        preConnectionModel = PreConnectionViewModel(
            status: status,
            tip: tip,
            statusItems: newItems
        )
    }
    
    // MARK: - ConnectionMonitor Model Updates
    
    private func updateConnectionMonitor(with newPacketData: PacketData) {
        // Add new packet data at the beginning (newest-first)
        var updatedPackets = connectionMonitorModel.packets
        
        // Keep only 16 items (matching maxVisibleBars in LiveBarChartView)
        // Remove the oldest (last) item first if at capacity to avoid array growth
        if updatedPackets.count >= 16 {
            updatedPackets.removeLast()
        }
        
        // Insert new item at the beginning
        updatedPackets.insert(newPacketData, at: 0)
        
        // Calculate total sent and lost across all packets
        var totalSent = 0
        var totalLost = 0
        for packet in updatedPackets {
            totalSent += packet.sent
            totalLost += packet.lost
        }
        let totalPackets = totalSent + totalLost
        
        // Calculate packet loss per mille (0-999, where 1000‰ = 100%)
        let packetLossPerMille: Int
        if totalPackets > 0 {
            let perMille = Double(totalLost) / Double(totalPackets) * 1000.0
            packetLossPerMille = min(999, max(0, Int(perMille.rounded())))
        } else {
            packetLossPerMille = 0
        }
        
        // Determine stability: unstable if packet loss > 10% (100 per mille)
        let isStable = packetLossPerMille <= 100
        
        connectionMonitorModel = ConnectionMonitorViewModel(
            packetLossPercentage: packetLossPerMille,
            isStable: isStable,
            packets: updatedPackets
        )
    }
    
    // MARK: - Public API

    var isWifiUdpMotionEnabled: Bool {
        useWifiUdpMotion
    }
    
    // Movement
    func accumulateDelta(dx: CGFloat, dy: CGFloat) {
        accumulatedDX += dx
        accumulatedDY += dy
        if !useWifiUdpMotion {
            wakeDisplayLinkForInput()
        }
    }

    func enqueueUdpPointerMotion(dx: CGFloat, dy: CGFloat, timestamp: CFTimeInterval) {
        guard useWifiUdpMotion else { return }
        udpMotionSender?.enqueueMotion(dx: dx, dy: dy, timestamp: timestamp)
    }

    func endUdpMotionStream() {
        guard useWifiUdpMotion else { return }
        udpMotionSender?.endMotionStream()
    }
    
    // Scroll wheel
    func scroll(deltaY: CGFloat) {
        let scaledDeltaY = deltaY * scrollSensitivity
        accumulatedWheel += scaledDeltaY
        
        var didTick = false
        
        // large enough accumulatedWheel triggers ticks -> scroll
        while accumulatedWheel >= wheelPixelsPerTick { // scrolling down (positive direction)
            if wheelDelta < Int8.max {
                wheelDelta &+= 1 // Increment wheelDelta if it is not maxed out
            }
            accumulatedWheel -= wheelPixelsPerTick
            didTick = true
        }
        while accumulatedWheel <= -wheelPixelsPerTick {
            if wheelDelta > Int8.min {
                wheelDelta &-= 1
            }
            accumulatedWheel += wheelPixelsPerTick
            didTick = true
        }
        
        if didTick {
            // One haptic per "frame" where we emitted at least one tick
            scrollHaptic.selectionChanged()
            scrollHaptic.prepare()     // prepare for the next one
            wakeDisplayLinkForInput()
        }
    }
    func resetScrollAccumulator() {
        accumulatedWheel = 0
        wheelDelta = 0
    }
    
    // Left mouse button
    func leftDown() {
        // If left button is not currently pressed
        if (buttonsState & 0x01) == 0 {
            buttonsState |= 0x01 // buttonsState(0x00) | 0x01 = 1
            buttonDirty = true
            leftHeld = true
            wakeDisplayLinkForInput()
        }
    }
    func leftUp() {
        // If left button is currently pressed
        if (buttonsState & 0x01) != 0 {
            buttonsState &= ~UInt8(0x01) // buttonsState(0b00000001) & 0b11111110 = 0
            buttonDirty = true
            leftHeld = false
            wakeDisplayLinkForInput()
        }
    }
    func leftTap() {
        leftDown()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) { [weak self] in
            guard let self = self else { return }
            leftUp()
        }
        print("left clicked and sent")
    }
    
    // Right mouse button
    func rightDown() {
        if (buttonsState & 0x02 ) == 0 { // if right is pressed
            buttonsState |= 0x02 // buttonsState(0b0000000) | 0b0000010 = 2
            buttonDirty = true
            wakeDisplayLinkForInput()
        }
    }
    func rightUp() {
        if (buttonsState & 0x02) != 0 { // if right is not pressed
            buttonsState &= ~UInt8(0x02) // buttonsState(0b0000010) & 0b11111101 = 0
            buttonDirty = true
            wakeDisplayLinkForInput()
        }
    }
    func rightTap() {
        rightDown()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) { [weak self] in
            guard let self = self else { return }
            rightUp()
        }
    }

    // Two finger gesture commands
    func sendSystemCommand(_ command: SystemCommand) {
        // Look up mapping in current profile
        guard let combo = currentProfile.bindings[command], !combo.isEmpty else {
            print("ℹ️ No mapping for \(command) in profile \(currentProfile.name)")
            return
        }
        
        // Enforce upper limit of 3 key combo
        let limitedCombo = Array(combo.prefix(3))
        
        // If not actually connected yet, just log and bail
        guard let peripheral = peripheral,
              let char = writeBleCharacteristic else {
            print("⚪️ Stub: would send system command \(command)")
            return
        }
        
        // Protocol proposal:
        // [0] = 0xF1 → "keyboard combo"
        // [1] = N    → number of keys (1–3)
        // [2...]     → LogicalKey.rawValue for each key
        var packet = Data()
        packet.append(0xF1)
        packet.append(UInt8(limitedCombo.count))
        limitedCombo.forEach { key in
            packet.append(key.rawValue)
        }

        if peripheral.canSendWriteWithoutResponse {
            peripheral.writeValue(packet, for: char, type: .withoutResponse)
            print("🟣 Sent keyboard combo for \(command): \(limitedCombo)")
            packetsSent += 1
        } else {
            print("🟡 BLE buffer full, dropped combo for \(command)")
            packetsDropped += 1
        }
    }
    
    // Keyboard key combo commands
    func sendKeyCombo(_ combo: [LogicalKey]) {
        guard !combo.isEmpty else { return }
        
        // Enforce upper limit of 3 key combo
        let limitedCombo = Array(combo.prefix(3))
        
        // If not actually connected yet, just log and bail
        guard let peripheral = peripheral,
              let char = writeBleCharacteristic else {
            print("⚪️ Stub: would send key combo: \(limitedCombo)")
            return
        }
        
        // Protocol: same as sendSystemCommand
        // [0] = 0xF1 → "keyboard combo"
        // [1] = N    → number of keys (1–3)
        // [2...]     → LogicalKey.rawValue for each key
        var packet = Data()
        packet.append(0xF1)
        packet.append(UInt8(limitedCombo.count))
        limitedCombo.forEach { key in
            packet.append(key.rawValue)
        }

        if peripheral.canSendWriteWithoutResponse {
            peripheral.writeValue(packet, for: char, type: .withoutResponse)
            print("⌨️ Sent key combo: \(limitedCombo)")
            packetsSent += 1
        } else {
            print("🟡 BLE buffer full, dropped key combo")
            packetsDropped += 1
        }
    }
    
    
    // MARK: CBCentralManagerDelegate
    /// ISO automatically call this Delegate method when phone's Bluetooth state changes
    /// Conforms to CBCentralManagerDelegate protocol
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state { // check curr bluetooth state
        case .poweredOn:
            print("✅ Bluetooth is ON – ready to scan")
            statusMessage = "Bluetooth is ON, scanning ESP..."
            updatePreConnectionModel(
                status: .searching,
                tip: .connectDongle,
                addStatusItem: StatusItem(text: "Bluetooth is ON", type: .success)
            )
            startScan()
        case .poweredOff:
            print("❌ Bluetooth is OFF")
            statusMessage = "Bluetooth is OFF"
            updatePreConnectionModel(
                status: .disconnected,
                tip: .enableBluetooth,
                replaceStatusItems: [StatusItem(text: "Bluetooth is OFF", type: .info)]
            )
        case .unauthorized:
            print("🚫 Bluetooth unauthorized")
            statusMessage = "Bluetooth unauthorized — enable in Settings"
            updatePreConnectionModel(
                status: .disconnected,
                tip: .authorizeBluetooth,
                replaceStatusItems: [StatusItem(text: "Bluetooth Unauthorized", type: .info)]
            )
        case .resetting:
            print("♻️ Bluetooth resetting…")
            statusMessage = "Bluetooth resetting…"
            updatePreConnectionModel(
                status: .disconnected,
                tip: nil,
                replaceStatusItems: [StatusItem(text: "Bluetooth Resetting", type: .info)]
            )
        case .unsupported:
            print("❌ Bluetooth unsupported")
            statusMessage = "Your phone does not support bluetooth"
            updatePreConnectionModel(
                status: .disconnected,
                tip: .unsupportedBluetooth,
                replaceStatusItems: [StatusItem(text: "Bluetooth Unsupported", type: .error)]
            )
        case .unknown:
            fallthrough
        @unknown default:
            print("ℹ️ Bluetooth state: \(central.state.rawValue)")
            updatePreConnectionModel(
                status: .disconnected,
                tip: nil,
                replaceStatusItems: [StatusItem(text: "Bluetooth Unknown State", type: .info)]
            )
        }
    }
    
    private func startScan(){
        guard centralManager.state == .poweredOn else {
            print("⚠️ Cannot scan - Bluetooth not powered on")
            return
        }
        // Scan for Peripherals(devices) based on their advertised service
        print("Start Scanning")
        // Update status to searching when starting scan (include after failed connection)
        if preConnectionModel.status != .searching {
            updatePreConnectionModel(status: .searching)
        }
        centralManager.scanForPeripherals(
            withServices: [serviceUUID],
            options: [CBCentralManagerScanOptionAllowDuplicatesKey: false]
        )
    }
    
    // Discover a peripheral during scanning & ask to connect
    func centralManager(
        _ central: CBCentralManager,
        didDiscover peripheral: CBPeripheral,
        advertisementData: [String : Any],
        rssi RSSI: NSNumber // signal strength
    ){
        print("🔍 Found peripheral: \(peripheral.name ?? "Unknown")")
        statusMessage = "Connecting to \(peripheral.name ?? "ESP")..."
        self.peripheral = peripheral // setting peripheral
        self.peripheral?.delegate = self
        
        centralManager.stopScan()
        
        updatePreConnectionModel(
            status: .connecting,
            tip: nil,
            addStatusItem: StatusItem(text: "Found USB Dongle", type: .success)
        )
        
        let options: [String: Any] = [ // Enable connection notifications
            CBConnectPeripheralOptionNotifyOnConnectionKey: true,
            CBConnectPeripheralOptionNotifyOnDisconnectionKey: true,
            CBConnectPeripheralOptionNotifyOnNotificationKey: true
        ]
        centralManager.connect(peripheral, options: options) // connect to the physical device
    }
    
    // Connection successful
    func centralManager(
        _ central: CBCentralManager,
        didConnect peripheral: CBPeripheral
    ){
        print("✅ Connected to \(peripheral.name ?? "ESP")")
        statusMessage = "Connected! Trying To Find Service..."
        isConnected = true
        writeBleCharacteristic = nil
        packetsDropped = 0
        packetsSent = 0
        lastStatsTime = Date()
        
        // Reset ConnectionMonitor when connecting
        connectionMonitorModel = ConnectionMonitorViewModel()
        
        // Status remains .connecting while discovering services/characteristics
        // No status item added here - service discovery will handle it
        
        // Delay service discovery
        // iOS needs time to complete MTU negotiation and connection setup
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { [weak self] in
            guard let self = self,
                  self.peripheral?.state == .connected else {
                print("⚠️ Lost connection before service discovery")
                self?.updatePreConnectionModel(
                    status: .disconnected,
                    tip: nil,
                    addStatusItem: StatusItem(text: "Lost Connection", type: .error)
                )
                return
            }
            print("🔍 Starting service discovery...")
            peripheral.discoverServices([self.serviceUUID])
        }
    }
    
    // Connection failed
    func centralManager(
        _ central: CBCentralManager,
        didFailToConnect peripheral: CBPeripheral,
        error: Error?
    ){
        let errorCode = (error as NSError?)?.code ?? -1
        let errorDomain = (error as NSError?)?.domain ?? "Unknown"
        print("❌ Failed to connect: \(error?.localizedDescription ?? "unknown")")
        print("   Error domain: \(errorDomain), code: \(errorCode)")
        statusMessage = "Connection failed: \(error?.localizedDescription ?? "Unknown")"
        
        updatePreConnectionModel(
            status: .disconnected,
            tip: nil,
            addStatusItem: StatusItem(text: "Connection Failed", type: .error)
        )
        
        self.peripheral = nil

        // Delay 2s before retrying - iOS requirement
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            print("🔄 Retrying scan after connection failure...")
            self.startScan()
        }
    }
    
    // Handle disconnect and clear state
    func centralManager(
        _ central: CBCentralManager,
        didDisconnectPeripheral peripheral: CBPeripheral,
        error: Error?
    ) {
        let errorCode = (error as NSError?)?.code ?? -1
        let errorDomain = (error as NSError?)?.domain ?? "Unknown"
        
        statusMessage = "Disconnected: \(error?.localizedDescription ?? "No error")"
        print("🔌 Disconnected - domain: \(errorDomain), code: \(errorCode)")
        print("   Description: \(error?.localizedDescription ?? "no error")")
        
        isConnected = false
        writeBleCharacteristic = nil
        self.peripheral = nil
        
        // Reset ConnectionMonitor on disconnect
        connectionMonitorModel = ConnectionMonitorViewModel()
        
        // Update model - will transition back to searching when scan restarts
        updatePreConnectionModel(
            status: .disconnected,
            tip: nil,
            addStatusItem: StatusItem(text: "Disconnected", type: .info)
        )
        
        // Delay 1s before reconnecting
        // CoreBluetooth needs time to clean up (20ms minimum)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            print("🔄 Restarting scan after disconnect...")
            self.startScan()
        }
    }
    
    
    // MARK: - CBPeripheralDelegate
    // Services discovered → peripheral has a list of CBService objects
    // Discover characteristics from the CBService objects list
    func peripheral(
        _ peripheral: CBPeripheral,
        didDiscoverServices error: Error?
    ){
        guard error == nil else{
            print("❌ Service discovery error: \(error!)")
            statusMessage = "Service discovery failed"
            updatePreConnectionModel(
                status: .disconnected,
                tip: nil,
                addStatusItem: StatusItem(text: "Service Discovery Failed", type: .error)
            )
            centralManager.cancelPeripheralConnection(peripheral)
            return
        }
        
        guard let services = peripheral.services else {
            print("⚠️ No services found")
            updatePreConnectionModel(
                status: .disconnected,
                tip: nil,
                addStatusItem: StatusItem(text: "No Services Found", type: .error)
            )
            return
        }
        
        for service in services {
            print("🧩 Found service: \(service.uuid)")
            if service.uuid == serviceUUID {
                peripheral.discoverCharacteristics([characteristicUUID], for: service) // Find characteristic that matches UUID
                return
            }
        }
        
        print("⚠️ Target service not found")
        updatePreConnectionModel(
            status: .disconnected,
            tip: nil,
            addStatusItem: StatusItem(text: "Target Service Not Found", type: .error)
        )
    }
    
    func peripheral(
        _ peripheral: CBPeripheral,
        didDiscoverCharacteristicsFor service: CBService,
        error: Error?
    ){
        guard error == nil else {
            print("❌ Characteristic discovery error: \(error!)")
            updatePreConnectionModel(
                status: .disconnected,
                tip: nil,
                addStatusItem: StatusItem(text: "Characteristic Discovery Failed", type: .error)
            )
            return
        }
        
        guard let characteristics = service.characteristics else {
            print("⚠️ No characteristics found")
            updatePreConnectionModel(
                status: .disconnected,
                tip: nil,
                addStatusItem: StatusItem(text: "No Characteristics Found", type: .error)
            )
            return
        }
        
        // characteristic is found
        for char in characteristics {
            print("📡 Found characteristic: \(char.uuid)")
            if (char.uuid == characteristicUUID){
                // Ckeck write properties support writeWithoutResponse
                if char.properties.contains(.writeWithoutResponse){
                    writeBleCharacteristic = char // setting writeCharacteristic
                    statusMessage = "Ready to send data"
                    print("✅ Write characteristic ready (props: \(char.properties))")
                    updatePreConnectionModel(
                        status: .connected,
                        tip: nil,
                        addStatusItem: StatusItem(text: "Connection Successful", type: .success)
                    )
                } else {
                    print("❌ Characteristic doesn't support writeWithoutResponse")
                    statusMessage = "Wrong characteristic properties"
                    updatePreConnectionModel(
                        status: .disconnected,
                        tip: nil,
                        addStatusItem: StatusItem(text: "Wrong Characteristic Properties", type: .error)
                    )
                }
            }
        }
    }
    
    
    
    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
//        print("🟢 Buffer ready")
        MovementDiagnostics.shared.recordBleReadyCallback()
    }
    
    
    func sendClick() {
        print("Sending click")
    }
}
