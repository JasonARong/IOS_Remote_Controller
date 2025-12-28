//
//  CustomCircleButton.swift
//  UITest
//
//  Created on 2025/12/27.
//

import SwiftUI

struct CustomCircleButton: View {
    let systemImageName: String
    let isActive: Bool
    let action: () -> Void
    
    init(systemImageName: String, isActive: Bool = false, action: @escaping () -> Void) {
        self.systemImageName = systemImageName
        self.isActive = isActive
        self.action = action
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.black)
                .strokeBorder(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .borderGradientDark, location: 0),
                            .init(color: .borderGradientLight, location: 1)
                        ]),
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 1, y: 1)
                    ),
                    lineWidth: 1
                )
                .frame(width: 42, height: 42)
        
            Button(action: action) {
                Image(systemName: systemImageName)
                    .foregroundColor(isActive ? Color.buttonGreen : .white)
                    .shadow(color: isActive ? Color.buttonGreen : .white, radius: 8, x: 0, y: 0)
            }
            .buttonStyle(CircleButtonStyle())
        }
    }
}

#Preview {
    HStack(spacing: 20) {
        CustomCircleButton(systemImageName: "keyboard", isActive: false) {
            print("Inactive button tapped")
        }
        
        CustomCircleButton(systemImageName: "keyboard", isActive: true) {
            print("Active button tapped")
        }
    }
    .padding()
    .background(Color.black)
}

