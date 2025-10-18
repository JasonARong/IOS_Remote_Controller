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
    private var pendingPackets = [Data]()
    
    // MARK: State published to UI (optional for debugging)
    @Published var isConnected = false
    @Published var statusMessage = "Initializing Bluetooth..."
    
    // MARK: UUIDs must match ESP side
    private var serviceUUID = CBUUID(string: "00001234-0000-1000-8000-00805f9b34fb") // “Remote Mouse” service
    private var characteristicUUID = CBUUID(string: "0000abcd-0000-1000-8000-00805f9b34fb") // data endpoint for dx/dy deltas
    
    // For smooth cursor movement
    private var accumulatedDX: CGFloat = 0
    private var accumulatedDY: CGFloat = 0
    private var displayLink: CADisplayLink?
    private let targetFPS: Int = 60
    
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
            displayLink.preferredFrameRateRange = CAFrameRateRange(minimum: 60, maximum: 120, preferred: Float(targetFPS))
        } else {
            displayLink.preferredFramesPerSecond = targetFPS >= 120 ? 120 : 60
        }
        displayLink.add(to: .main, forMode: .common) // .main run loop with .common mode
        self.displayLink = displayLink
    }
    
    private func stopDisplayLink() {
        displayLink?.invalidate()
        displayLink = nil
    }
    
    @objc private func tick(){
        // Grab and reset accumulators
        let dx = accumulatedDX * 1.25
        let dy = accumulatedDY * 1.25
        if dx==0 && dy==0 { return }
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
        } else {
            pendingPackets.append(packet) // enqueue when back-pressured
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
        // Scan for Peripherals(devices) based on their advertised service
        print("Start Scanning")
        centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
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
        centralManager.connect(peripheral, options: nil) // connect with the physical device
    }
    
    // Connection succeeded
    func centralManager(
        _ central: CBCentralManager,
        didConnect peripheral: CBPeripheral
    ){
        print("✅ Connected to \(peripheral.name ?? "ESP")")
        statusMessage = "Connected! Trying To Find Service..."
        isConnected = true
        // Reset any queued state on fresh connection
        pendingPackets.removeAll()
        writeCharacteristic = nil
        
        peripheral.discoverServices([serviceUUID]) // find service that matches UUID
    }
    
    // Connection failed
    func centralManager(
        _ central: CBCentralManager,
        didFailToConnect peripheral: CBPeripheral,
        error: Error?
    ){
        statusMessage = "Fail to connect: \(error?.localizedDescription ?? "Unknown")"
        print("❌ Connection failed: \(error?.localizedDescription ?? "unknown")")
    }
    
    // Handle disconnect and clear state
    func centralManager(
        _ central: CBCentralManager,
        didDisconnectPeripheral peripheral: CBPeripheral,
        error: Error?
    ){
        statusMessage = "Disconnected ( \(error?.localizedDescription ?? "no error") )"
        print("Disconnected ( \(error?.localizedDescription ?? "no error") )")
        isConnected = false
        writeCharacteristic = nil
        self.peripheral = nil
        pendingPackets.removeAll()
        
        startScan()
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
            return
        }
        for service in peripheral.services ?? []{
            print("🧩 Found service: \(service.uuid)")
            if service.uuid == serviceUUID {
                peripheral.discoverCharacteristics([characteristicUUID], for: service) // Find characteristic that matches UUID
            }
        }
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
        // characteristic is found
        for char in service.characteristics ?? [] {
            print("📡 Found characteristic: \(char.uuid)")
            if (char.uuid == characteristicUUID){
                writeCharacteristic = char // setting writeCharacteristic
                statusMessage = "Ready to send data"
                print("✅ Write characteristic ready (props: \(char.properties))")
            }
        }
    }
    
    
    
    func peripheralIsReady(toSendWriteWithoutResponse peripheral: CBPeripheral) {
        guard let char = writeCharacteristic else { return }
        while peripheral.canSendWriteWithoutResponse && !pendingPackets.isEmpty {
            let packet = pendingPackets.removeFirst()
            peripheral.writeValue(packet, for: char, type: .withoutResponse)
            print("🔵 Sent to ESP from pending Packets")
        }
    }
    
    
    func sendClick() {
        print("Sending click")
    }
}
