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
    private var writeCharacteristic: CBCharacteristic? /// represent a specific data channel on the Bluetooth device
//    private var pendingPackets = [Data]()
    
    // MARK: State published to UI (optional for debugging)
    @Published var isConnected = false
    @Published var statusMessage = "Initializing Bluetooth..."
    @Published var packetsDropped: Int = 0
    
    // MARK: UUIDs must match ESP side
    private var serviceUUID = CBUUID(string: "00001234-0000-1000-8000-00805f9b34fb") // “Remote Mouse” service
    private var characteristicUUID = CBUUID(string: "0000abcd-0000-1000-8000-00805f9b34fb") // data endpoint for dx/dy deltas
    
    // For smooth cursor movement
    private var accumulatedDX: CGFloat = 0
    private var accumulatedDY: CGFloat = 0
    private var displayLink: CADisplayLink?
    private let targetFPS: Int = 45
    
    // Statistics
    private var packetsSent: Int = 0
    private var lastStatsTime: Date = Date()
    
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
    
    // MARK: - Display link pacing
    private func startDisplayLink() {
        let displayLink = CADisplayLink(target: self, selector: #selector(tick))
        if #available(iOS 15.0, *){ // Prefer targetFPS (60 or 120); system will choose best within this range
            displayLink.preferredFrameRateRange = CAFrameRateRange(minimum: 30, maximum: 60, preferred: Float(targetFPS))
        } else {
            displayLink.preferredFramesPerSecond = targetFPS
        }
        displayLink.add(to: .main, forMode: .common) // .main run loop with .common mode
        self.displayLink = displayLink
    }
    
    private func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc private func tick(){
        guard accumulatedDX != 0 || accumulatedDY != 0 else { return }
        
        let dx = accumulatedDX
        let dy = accumulatedDY
        
        accumulatedDX = 0
        accumulatedDY = 0
        
        // ESP require number in raw bytes (0x00, 0xFF, etc.)
        /// turn floating-point deltas into 16-bit integers (2 bytes)
        let dxClamped = max(-32767, min(32767, dx))
        let dyClamped = max(-32767, min(32767, dy))
        let dxInt16 = Int16(dxClamped)
        let dyInt16 = Int16(dyClamped)
        
        // Build packet
        // Packet structure: [dx_low, dx_high, dy_low, dy_high]
        var packet = Data() // Data(): raw bytes container.
        /// little-endian byte order: least significant byte first, ESP32 uses this order
        withUnsafeBytes(of: dxInt16.littleEndian) { bytes in /// bytes: pointer to the memory containing dxInt16
            packet.append(contentsOf: bytes) /// withUnsafeBytes accesses the raw bytes in actual memory via pointer
        }
        withUnsafeBytes(of: dyInt16.littleEndian) { bytes in
            packet.append(contentsOf: bytes)
        }
        
        
        guard let peripheral = peripheral,
              let char = writeCharacteristic else {
            print("⚪️ Stub: would send dx=\(dxInt16), dy=\(dyInt16)")
            return
        }
        
        if peripheral.canSendWriteWithoutResponse {
            peripheral.writeValue(packet, for: char, type: .withoutResponse) // send data to the writeCharacteristic endpoint
            print("🔵 Sent to ESP: dx=\(dxInt16), dy=\(dyInt16)")
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
    
    // MARK: - Public API (OG: Send data)
    func sendDelta(dx: CGFloat, dy: CGFloat) {
        accumulatedDX += dx
        accumulatedDY += dy
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
        //print("AdvertisementData: \(advertisementData)")
        statusMessage = "Connecting to \(peripheral.name ?? "ESP")..."
        self.peripheral = peripheral // setting peripheral
        self.peripheral?.delegate = self
        
        centralManager.stopScan()
        // Set connection options for low latency
        let options: [String: Any] = [
            CBConnectPeripheralOptionNotifyOnConnectionKey: true,
            CBConnectPeripheralOptionNotifyOnDisconnectionKey: true,
            CBConnectPeripheralOptionNotifyOnNotificationKey: true
        ]
        centralManager.connect(peripheral, options: options) // connect with the physical device
    }
    
    // Connection succeeded
    func centralManager(
        _ central: CBCentralManager,
        didConnect peripheral: CBPeripheral
    ){
        print("✅ Connected to \(peripheral.name ?? "ESP")")
        statusMessage = "Connected! Trying To Find Service..."
        isConnected = true
        writeCharacteristic = nil
        packetsDropped = 0
        packetsSent = 0
        lastStatsTime = Date()
        
        //peripheral.discoverServices([serviceUUID]) // find service that matches UUID
        
        // Delay service discovery
        // iOS needs time to complete MTU negotiation and connection setup
        // Immediate service discovery can cause "device not connected" error
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
        
        statusMessage = "Connection failed: \(error?.localizedDescription ?? "Unknown")"
        print("❌ Failed to connect: \(error?.localizedDescription ?? "unknown")")
        print("   Error domain: \(errorDomain), code: \(errorCode)")
        
        self.peripheral = nil

        // Wait 2 seconds before retrying - iOS requirement
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
        writeCharacteristic = nil
        self.peripheral = nil
        
        // CRITICAL FIX #10: Delay before reconnecting
        // CoreBluetooth needs time to clean up (Apple Forums recommendation: 20ms minimum)
        // We use 1 second to be safe
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
                    writeCharacteristic = char // setting writeCharacteristic
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
