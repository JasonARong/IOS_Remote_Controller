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
    
    // MARK: UUIDs must match ESP side
    private var serviceUUID = CBUUID(string: "00001234-0000-1000-8000-00805f9b34fb")
    private var characteristicUUID = CBUUID(string: "0000abcd-0000-1000-8000-00805f9b34fb")
    
    // For smooth cursor movement
    private var accumulatedDX: CGFloat = 0
    private var accumulatedDY: CGFloat = 0
    private var displayLink: CADisplayLink? /// use displayLink to send packets at an constant rate
    private let targetFPS: Int = 45 /// Sending packets' rate
    
    // Mouse Button
    private var buttonsState: UInt8 = 0 // [0b00000000] bit0 = left btn, bit1 = right btn
    private var buttonDirty: Bool = false // Mark state changes => require data to be sent
    private var leftHeld: Bool = false
    
    // Statistics
    private var packetsSent: Int = 0
    private var lastStatsTime: Date = Date()
    
    
    // MARK: init & deinit
    override init() { /// override initializer of NSObject
        super.init()
        /// delegate: self ( this class will receive Bluetooth callbacks ) ( require self to be delegate type)
        /// queue: nil ( callbacks run on the main thread )
        centralManager = CBCentralManager(delegate: self, queue: nil)
        startDisplayLink()
    }
    
    deinit {
        stopDisplayLink()
    }
    
    
    // MARK: - Send to ESP
    // Display link pacing
    private func startDisplayLink() {
        let displayLink = CADisplayLink(target: self, selector: #selector(tick))
        if #available(iOS 15.0, *){ // System will choose within preferred targetFPS (60 or 120)
            displayLink.preferredFrameRateRange = CAFrameRateRange(minimum: 30, maximum: 60, preferred: Float(targetFPS))
        } else {
            displayLink.preferredFramesPerSecond = targetFPS
        }
        displayLink.add(to: .main, forMode: .common) // ".main" run loop with ".common" mode
        self.displayLink = displayLink
    }
    
    private func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc private func tick(){
        let hasMoved = (accumulatedDX != 0 || accumulatedDY != 0)
        let shouldSend = leftHeld || buttonDirty || hasMoved
        guard shouldSend else { return }
        
        let dx = accumulatedDX * 1.25
        let dy = accumulatedDY * 1.25
        
        accumulatedDX = 0
        accumulatedDY = 0
        
        // ESP require number in raw bytes
        /// Turn floating-point deltas into 16-bit integers (e.g. 0x1234) (2 bytes)
        let dxClamped = max(-32767, min(32767, dx))
        let dyClamped = max(-32767, min(32767, dy))
        let dxInt16 = Int16(dxClamped)
        let dyInt16 = Int16(dyClamped)
        
        // Build packet
        // Packet structure: [buttons, reserved, dxLE(2), dyLE(2)] → 6 bytes
        var packet = Data([buttonsState,0x00]) // Data(): raw bytes container.
        /// little-endian byte order: least significant byte first, ESP32 uses this order
        withUnsafeBytes(of: dxInt16.littleEndian) { bytes in /// bytes: pointer to the memory containing dxInt16
            packet.append(contentsOf: bytes) /// withUnsafeBytes accesses the raw bytes in actual memory via pointer
        }
        withUnsafeBytes(of: dyInt16.littleEndian) { bytes in
            packet.append(contentsOf: bytes)
        }
        
        
        guard let peripheral = peripheral,
              let char = writeBleCharacteristic else {
//            print("⚪️ Stub: would send dx=\(dxInt16), dy=\(dyInt16)")
            return
        }
        
        if peripheral.canSendWriteWithoutResponse {
            peripheral.writeValue(packet, for: char, type: .withoutResponse) // send data to the writeCharacteristic endpoint
            print("🔵 Sent to ESP: dx=\(dxInt16), dy=\(dyInt16), button=\(buttonsState)")
            buttonDirty = false
            packetsSent += 1
            
            // Print packet stats every 4 seconds
            let now = Date()
            if now.timeIntervalSince(lastStatsTime) > 4.0 {
                print("📊 Sent \(packetsSent) packets in 4s, dropped: \(packetsDropped)")
                packetsSent = 0
                packetsDropped = 0
                lastStatsTime = now
            }
        } else {
            packetsDropped += 1
        }
    }
    
    
    
    // MARK: - Public API
    func accumulateDelta(dx: CGFloat, dy: CGFloat) {
        accumulatedDX += dx
        accumulatedDY += dy
    }
    
    // Left mouse button
    func leftDown() {
        // If left button is not currently pressed
        if (buttonsState & 0x01) == 0 {
            buttonsState |= 0x01 // buttonsState(0x00) | 0x01 = 1
            buttonDirty = true
            leftHeld = true
        }
    }
    func leftUp() {
        // If left button is currently pressed
        if (buttonsState & 0x01) != 0 {
            buttonsState &= ~UInt8(0x01) // buttonsState(0b00000001) & 0b11111110 = 0
            buttonDirty = true
            leftHeld = false
        }
    }
    func leftTap() {
        leftDown()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) { [weak self] in
            guard let self = self else { return }
            leftUp()
        }
    }
    
    // Right mouse button
    func rightDown() {
        if (buttonsState & 0x02 ) == 0 { // if right is pressed
            buttonsState |= 0x02 // buttonsState(0b0000000) | 0b0000010 = 2
            buttonDirty = true
        }
    }
    func rightUp() {
        if (buttonsState & 0x02) != 0 { // if right is not pressed
            buttonsState &= ~UInt8(0x02) // buttonsState(0b0000010) & 0b11111101 = 0
            buttonDirty = true
        }
    }
    func rightTap() {
        rightDown()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.04) { [weak self] in
            guard let self = self else { return }
            rightUp()
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
            startScan()
        case .poweredOff:
            print("❌ Bluetooth is OFF")
            statusMessage = "Bluetooth is OFF"
        case .unauthorized:
            print("🚫 Bluetooth unauthorized")
            statusMessage = "Bluetooth unauthorized — enable in Settings"
        case .resetting:
            print("♻️ Bluetooth resetting…")
            statusMessage = "Bluetooth resetting…"
        case .unsupported:
            print("❌ Bluetooth unsupported")
            statusMessage = "Your phone does not support bluetooth"
        case .unknown:
            fallthrough
        @unknown default:
            print("ℹ️ Bluetooth state: \(central.state.rawValue)")
        }
    }
    
    private func startScan(){
        guard centralManager.state == .poweredOn else {
            print("⚠️ Cannot scan - Bluetooth not powered on")
            return
        }
        // Scan for Peripherals(devices) based on their advertised service
        print("Start Scanning")
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
        
        // Delay service discovery
        // iOS needs time to complete MTU negotiation and connection setup
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { [weak self] in
            guard let self = self,
                  self.peripheral?.state == .connected else {
                print("⚠️ Lost connection before service discovery")
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
            centralManager.cancelPeripheralConnection(peripheral)
            return
        }
        
        guard let services = peripheral.services else {
            print("⚠️ No services found")
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
    }
    
    func peripheral(
        _ peripheral: CBPeripheral,
        didDiscoverCharacteristicsFor service: CBService,
        error: Error?
    ){
        guard error == nil else {
            print("❌ Characteristic discovery error: \(error!)")
            return
        }
        
        guard let characteristics = service.characteristics else {
            print("⚠️ No characteristics found")
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
                } else {
                    print("❌ Characteristic doesn't support writeWithoutResponse")
                    statusMessage = "Wrong characteristic properties"
                }
            }
        }
    }
    
    
    
    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
        print("🟢 Buffer ready")
    }
    
    
    func sendClick() {
        print("Sending click")
    }
}
