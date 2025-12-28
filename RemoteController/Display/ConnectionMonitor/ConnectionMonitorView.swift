//
//  ConnectionMonitorView.swift
//  UITest
//
//  Created by 陈皆成 on 2025/12/27.
//

import SwiftUI

struct ConnectionMonitorView: View {
    let model: ConnectionMonitorViewModel
    
    init(model: ConnectionMonitorViewModel) {
        self.model = model
    }
    
    var body: some View {
        VStack (spacing: 0) {
            // Packet Loss Info Overview
            HStack(alignment: .bottom) {
                // Packet Loss percentage
                HStack(alignment: .lastTextBaseline, spacing: 2) {
                    Text(String(format: "%02d", model.packetLossPercentage))
                        .font(.custom("Jersey 15", size: 40))
                        .foregroundColor(.white)
                    Image("permille")
                        .padding(.trailing, 4)
                        .offset(y:4)
                    
                    Text("PACKET\nLOSS")
                        .font(.custom("Jersey 15", size: 14))
                        .foregroundColor(.white)
                        .opacity(0.6)
                }

                Spacer()
                
                // Tag can be switched between green stable and red unstable
                HStack (spacing: 2) {
                    if model.isStable {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 8, weight: .medium))
                            .foregroundColor(Color.displayGreen)
                        
                        Text("STABLE")
                            .font(.custom("Jersey 20", size: 12))
                            .foregroundColor(Color.displayGreen)
                    } else {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 8, weight: .medium))
                            .foregroundColor(Color.displayRed)
                        
                        Text("UNSTABLE")
                            .font(.custom("Jersey 20", size: 12))
                            .foregroundColor(Color.displayRed)
                    }
                }
                .padding(.vertical, 2)
                .padding(.horizontal, 4)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(model.isStable ? Color.displayGreen : Color.displayRed, lineWidth: 1.5)
                )
                .padding(.bottom, 9)
            }
            .padding(.bottom, 3)
            
            DashedLine(color: .white.opacity(0.4))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 0)
            
            // Packet Data Live Bar Chart
            HStack {
                VStack (alignment: .leading) {
                    HStack (spacing: 2){
                        Text("\(dynamicMax)")
                            .font(.custom("Jersey 20", size: 12))
                            .foregroundColor(.white)
                        Text("PKT/5s")
                            .font(.custom("Jersey 20", size: 12))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    HStack (spacing: 2){
                        Text("SENT")
                            .font(.custom("Jersey 20", size: 14))
                            .foregroundColor(.white)
                            .opacity(0.6)
                        RoundedRectangle(cornerRadius: 1)
                            .fill(Color.displayBlue)
                            .frame(width: 6, height: 6)
                    }
                    HStack (spacing: 3){
                        Text("LOST")
                            .font(.custom("Jersey 20", size: 14))
                            .foregroundColor(.white)
                            .opacity(0.6)
                        RoundedRectangle(cornerRadius: 1)
                            .fill(Color.displayRed)
                            .frame(width: 6, height: 6)
                    }
                    
                }
                
                Spacer()
                
                
                // LiveBarChart
                LiveBarChartView(packets: model.packets)
            }
            .padding(.bottom, 12)
            
            
        }
    }
    
    private var dynamicMax: Int {
        LiveBarChartView.calculateDynamicMax(for: model.packets)
    }
}

#Preview {
    VStack (alignment: .leading, spacing: 0) {
        Text("CONNECTION QUALITY")
            .font(.custom("Pixelify Sans", size: 13))
            .foregroundColor(.white)
        
        ConnectionMonitorView(model: .init(
            packetLossPercentage: 2,
            isStable: true,
            packets: [
                PacketData(sent: 20, lost: 0),
                PacketData(sent: 35, lost: 5),
                PacketData(sent: 15, lost: 0),
                PacketData(sent: 45, lost: 0),
                PacketData(sent: 30, lost: 8),
                PacketData(sent: 10, lost: 0),
                PacketData(sent: 40, lost: 0),
                PacketData(sent: 0, lost: 0),
                PacketData(sent: 0, lost: 0),
                PacketData(sent: 0, lost: 0),
                PacketData(sent: 0, lost: 0),
            ]
        ))
    }
    .padding(EdgeInsets(top: 14, leading: 10, bottom: 0, trailing: 10))
    .frame(width: 204, height: 140, alignment: .topLeading)
    .background(DisplayCardBackground())
    .clipped()
}
