//
//  CustomSlider.swift
//  UITest
//
//  Created on 2025/12/16.
//

import SwiftUI

// MARK: - Custom Slider

struct CustomSlider: View {
    @Binding var value: Int // 0-4 for 5 stops
    let trackWidth: CGFloat = 5
    let trackHeight: CGFloat = 128
    let thumbSize: CGFloat = 24
    let borderWidth: CGFloat = 1
    let offset: CGFloat = 4
    let numberOfStops = 5
    
    /// Initializer for Preview and static usage
    init(value: Int = 0) {
        self._value = Binding.constant(value)
    }
    
    /// Initializer with binding for Dynamic updates
    init(value: Binding<Int>) {
        self._value = value
    }
    
    private var thumbYPosition: CGFloat {
        let minY = offset
        let maxY = trackHeight - offset
        let range = maxY - minY
        let step = range / CGFloat(numberOfStops - 1) // 120 / 4 = 30
        return minY + step * CGFloat(value) // Position for current value
    }
    
    var body: some View {
        ZStack {
            // Markings on sides
            Image("Markings")
                .offset(x: -10)
            
            Image("Markings")
                .scaleEffect(x: -1, y: 1)
                .offset(x: 10)
            
            // Track
            RoundedRectangle(cornerRadius: 3)
                .fill(Color.displayBackgroundBlack)
                .strokeBorder(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .borderGradientDark, location: 0),
                            .init(color: .borderGradientLight, location: 1)
                        ]),
                        startPoint: UnitPoint(x: 0, y: 1),
                        endPoint: UnitPoint(x: 1, y: 1)
                    ),
                    lineWidth: borderWidth
                )
                .frame(width: trackWidth, height: trackHeight)
            
            // Thumb
            Circle()
                .strokeBorder(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .borderGradientLight, location: 0),
                            .init(color: .borderGradientDark, location: 1)
                        ]),
                        startPoint: UnitPoint(x: 0, y: 0),
                        endPoint: UnitPoint(x: 1, y: 1)
                    ),
                    lineWidth: borderWidth
                )
                .background(
                    Circle()
                        .fill(Color.buttonGray)
                        .shadow(color: .black, radius: 1, x: 1, y: 2.5)
                )
                .frame(width: thumbSize, height: thumbSize)
                .offset(y: thumbYPosition - trackHeight / 2)
            
            // Invisible drag area covering the entire track
            Rectangle()
                .fill(Color.clear)
                .frame(width: max(trackWidth, thumbSize + 10), height: trackHeight)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { gesture in
                            // Convert gesture location to track coordinate space (0 to trackHeight)
                            let gestureY = gesture.location.y
                            
                            // Clamp to track bounds
                            let minY = offset
                            let maxY = trackHeight - offset
                            let clampedY = max(minY, min(maxY, gestureY))
                            
                            // Calculate which stop is closest
                            let range = maxY - minY
                            let step = range / CGFloat(numberOfStops - 1)
                            let normalizedPosition = (clampedY - minY) / step // convert to stop index (0–4).
                            let newValue = Int(round(normalizedPosition))
                            
                            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.8)) {
                                value = max(0, min(numberOfStops - 1, newValue))
                            }
                        }
                )
        }
        .frame(width: trackWidth + 20, height: trackHeight)
    }
}

// MARK: - Preview

#Preview("Stop 0 (Top)") {
    CustomSlider(value: 0)
        .padding()
        .background(Color.black)
}

#Preview("Stop 1") {
    CustomSlider(value: 1)
        .padding()
        .background(Color.black)
}

#Preview("Stop 2 (Middle)") {
    CustomSlider(value: 2)
        .padding()
        .background(Color.black)
}

#Preview("Stop 3") {
    CustomSlider(value: 3)
        .padding()
        .background(Color.black)
}

#Preview("Stop 4 (Bottom)") {
    CustomSlider(value: 4)
        .padding()
        .background(Color.black)
}

#Preview("Interactive") {
    struct InteractivePreview: View {
        @State private var sliderValue: Int = 2
        
        var body: some View {
            VStack(spacing: 20) {
                Text("Value: \(sliderValue)")
                    .foregroundColor(.white)
                    .font(.headline)
                
                CustomSlider(value: $sliderValue)
            }
            .padding()
            .background(Color.black)
        }
    }
    
    return InteractivePreview()
}
