//
//  LiveBarChart.swift
//  UITest
//
//  Created on 2025/12/16.
//

import SwiftUI

// MARK: - Colors Extension

//extension Color {
//    static let displayBlue = Color(red: 0.14, green: 0.8, blue: 1)
//    static let displayRed = Color(red: 0.95, green: 0.43, blue: 0.43)
//}

// MARK: - Packet Data Model
// Note: PacketData is now defined in DisplayModels.swift

// MARK: - Live Bar Chart

struct LiveBarChartView: View {
    let packets: [PacketData]
    let maxVisibleBars = 16
    let chartWidth: CGFloat = 126
    let barWidth: CGFloat = 6
    let chartHeight: CGFloat = 52
    let barMinHeight: CGFloat = 3
    let barMaxHeight: CGFloat = 50
    let barSpacing: CGFloat = 2
    let minMaxTotal: Int = 50
    let maxIncrement: Int = 25
    
    /// Initializer for Preview and static usage
    init(packets: [PacketData] = []) {
        self.packets = packets
    }
    
    private var visiblePackets: ArraySlice<PacketData> {
        packets.suffix(maxVisibleBars)
    }
    
    /// Calculates the dynamic max value based on packet data
    /// - Returns: The appropriate max value (minimum 50, increments by 25)
    static func calculateDynamicMax(for packets: [PacketData], maxVisibleBars: Int = 16, minMaxTotal: Int = 50, maxIncrement: Int = 25) -> Int {
        guard !packets.isEmpty else { return minMaxTotal }
        
        // Use suffix directly without creating intermediate array
        let visibleCount = min(packets.count, maxVisibleBars)
        guard visibleCount > 0 else { return minMaxTotal }
        
        // Calculate max in a single pass without creating intermediate arrays
        let startIndex = max(0, packets.count - maxVisibleBars)
        var maxTotal = 0
        for i in startIndex..<packets.count {
            let total = packets[i].total
            if total > maxTotal {
                maxTotal = total
            }
        }
        
        // Find the appropriate max level using integer division for efficiency
        var currentMax = minMaxTotal
        if maxTotal > currentMax {
            // Calculate how many increments we need
            let incrementsNeeded = (maxTotal - minMaxTotal + maxIncrement - 1) / maxIncrement
            currentMax = minMaxTotal + (incrementsNeeded * maxIncrement)
        }
        
        // Check if we can decrement: all visible bars must be below (currentMax - maxIncrement)
        let decrementThreshold = currentMax - maxIncrement
        if currentMax > minMaxTotal && decrementThreshold > 0 {
            var canDecrement = true
            for i in startIndex..<packets.count {
                if packets[i].total >= decrementThreshold {
                    canDecrement = false
                    break
                }
            }
            if canDecrement {
                currentMax -= maxIncrement
            }
        }
        
        return currentMax
    }
    
    /// Calculates the dynamic max value based on packet data
    /// - Returns: The appropriate max value (minimum 50, increments by 25)
    private func calculateDynamicMax() -> Int {
        Self.calculateDynamicMax(for: packets, maxVisibleBars: maxVisibleBars, minMaxTotal: minMaxTotal, maxIncrement: maxIncrement)
    }
    
    private var currentMax: Int {
        calculateDynamicMax()
    }
    
    private var scaleFactor: CGFloat {
        // Scale factor maps the dynamic max to the base scale (50)
        // This ensures bars are always scaled to fit the visual range
        return CGFloat(minMaxTotal) / CGFloat(currentMax)
    }
    
    private func barHeight(for value: Int) -> CGFloat {
        if value == 0 {
            return barMinHeight
        }
        // Scale the value based on current max, then map to visual height range
        let scaledValue = CGFloat(value) * scaleFactor
        // Map scaled value (0 to minMaxTotal) to height range (barMinHeight to barMaxHeight)
        let height = (scaledValue / CGFloat(minMaxTotal)) * (barMaxHeight - barMinHeight)
        // Clamp to ensure height stays within bounds (defensive programming)
        return max(barMinHeight, min(barMaxHeight, height))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background dashes
            VStack {
                Spacer()
                DashedLine(color: .white.opacity(0.2))
                    .frame(maxWidth: .infinity)
                Spacer()
                DashedLine(color: .white.opacity(0.2))
                    .frame(maxWidth: .infinity)
            }
            .frame(height: chartHeight)
            
            // Bar chart
            HStack(alignment: .bottom, spacing: barSpacing) {
                if visiblePackets.isEmpty {
                    // Empty state - maintain height with invisible spacer
                    Spacer()
                        .frame(height: barMinHeight)
                } else {
                    ForEach(visiblePackets) { packet in
                        if packet.lost > 0 {
                            // Has both sent and lost
                            VStack(spacing: 1) {
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.displayRed)
                                    .frame(width: barWidth, height: barHeight(for: packet.lost))
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.displayBlue)
                                    .frame(width: barWidth, height: barHeight(for: packet.sent))
                            }
                        } else {
                            // Only sent packets
                            RoundedRectangle(cornerRadius: 2)
                                .fill(Color.displayBlue)
                                .frame(width: barWidth, height: barHeight(for: packet.sent))
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: chartHeight, alignment: .bottom)
            .padding(.bottom, 2)
        }
        .frame(width: chartWidth, height: chartHeight)
    }
}



// MARK: - Preview

#Preview("Empty Chart") {
    LiveBarChartView(packets: [])
        .padding()
        .background(Color.black)
}

#Preview("Low Values") {
    LiveBarChartView(packets: [
        PacketData(sent: 5, lost: 0),
        PacketData(sent: 10, lost: 0),
        PacketData(sent: 3, lost: 0),
        PacketData(sent: 15, lost: 0),
        PacketData(sent: 8, lost: 0)
    ])
    .padding()
    .background(Color.black)
}

#Preview("Mixed Values") {
    LiveBarChartView(packets: [
        PacketData(sent: 20, lost: 0),
        PacketData(sent: 35, lost: 5),
        PacketData(sent: 15, lost: 0),
        PacketData(sent: 45, lost: 0),
        PacketData(sent: 30, lost: 8),
        PacketData(sent: 10, lost: 0),
        PacketData(sent: 40, lost: 0)
    ])
    .padding()
    .background(Color.black)
}

#Preview("High Values (Scaled)") {
    LiveBarChartView(packets: [
        PacketData(sent: 60, lost: 0),
        PacketData(sent: 75, lost: 10),
        PacketData(sent: 55, lost: 0),
        PacketData(sent: 80, lost: 0),
        PacketData(sent: 70, lost: 15),
        PacketData(sent: 65, lost: 0),
        PacketData(sent: 85, lost: 0),
        PacketData(sent: 50, lost: 0)
    ])
    .padding()
    .background(Color.black)
}

#Preview("Full Chart (16 Bars)") {
    LiveBarChartView(packets: [
        PacketData(sent: 3, lost: 0),
        PacketData(sent: 20, lost: 0),
        PacketData(sent: 44, lost: 0),
        PacketData(sent: 44, lost: 0),
        PacketData(sent: 3, lost: 0),
        PacketData(sent: 20, lost: 0),
        PacketData(sent: 44, lost: 0),
        PacketData(sent: 44, lost: 0),
        PacketData(sent: 3, lost: 0),
        PacketData(sent: 20, lost: 0),
        PacketData(sent: 44, lost: 0),
        PacketData(sent: 44, lost: 0),
        PacketData(sent: 51, lost: 0),
        PacketData(sent: 20, lost: 10),
        PacketData(sent: 44, lost: 3),
        PacketData(sent: 40, lost: 11)
    ])
    .padding()
    .background(Color.black)
}
