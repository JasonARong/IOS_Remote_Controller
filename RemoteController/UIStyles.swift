//
//  DisplayStyles.swift
//  UITest
//
//  Shared colors and styling primitives.
//

import SwiftUI

// MARK: - Colors

extension Color {
    static let displayBackgroundBlack = Color(red: 0.075, green: 0.075, blue: 0.075)
    static let borderGradientDark = Color(red: 0.14, green: 0.14, blue: 0.14)
    static let borderGradientLight = Color(red: 0.280, green: 0.280, blue: 0.280)
    static let printGray = Color(red: 0.63, green: 0.63, blue: 0.63, opacity: 0.7)
    static let buttonGray = Color(red: 0.21, green: 0.21, blue: 0.21)
    static let buttonGreen = Color(red: 0.588, green: 0.843, blue: 0.392)
    static let shadowGreen = Color(red: 0.588, green: 0.843, blue: 0.392, opacity: 0.8)
    static let displayBlue = Color(red: 0.14, green: 0.8, blue: 1)
    static let displayRed = Color(red: 0.95, green: 0.43, blue: 0.43)
    static let displayGreen = Color(red: 0.5, green: 0.86, blue: 0.38)
    
    // Dynamic Matrix
    static let circleWhite = Color(red: 1.0, green: 1.0, blue: 1.0)
    static let circleHighlightGreen = Color(red: 0.498, green: 0.867, blue: 0.376)
    static let backgroundBlack = Color.black
    static let touchIndicatorWhite = Color.white.opacity(0.7)
    static let textWhitePrimary = Color.white.opacity(0.85)
    static let textWhiteSecondary = Color.white.opacity(0.65)
    static let buttonBlue = Color.blue
}

// MARK: - Inner shadow

struct InnerShadow: ViewModifier {
    var radius: CGFloat = 4
    var color: Color = .black.opacity(1)
    var lineWidth: CGFloat = 5

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(color, lineWidth: lineWidth)
                    .blur(radius: radius)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            )
            .drawingGroup()
    }
}

extension View {
    func innerShadow(radius: CGFloat = 4, color: Color = .black.opacity(0.9), lineWidth: CGFloat = 2) -> some View {
        modifier(InnerShadow(radius: radius, color: color, lineWidth: lineWidth))
    }
}

// MARK: - Display card background

struct DisplayCardBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color.displayBackgroundBlack)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .borderGradientDark, location: 0),
                                .init(color: .borderGradientLight, location: 1),
                            ]),
                            startPoint: .topLeading,
                            endPoint: UnitPoint(x: 0.8, y: 0.8)
                        ),
                        lineWidth: 1.5
                    )
            )
            .innerShadow(radius: 4, color: .black.opacity(1), lineWidth: 3)
    }
}

// MARK: - Dashed line (1x1 squares)

struct DashedLine: View {
    let color: Color
    let dashSize: CGFloat
    let gapSize: CGFloat

    init(color: Color = .white, dashSize: CGFloat = 1, gapSize: CGFloat = 3) {
        self.color = color
        self.dashSize = dashSize
        self.gapSize = gapSize
    }

    var body: some View {
        GeometryReader { geometry in
            let dashCount = Int(geometry.size.width / (dashSize + gapSize))
            HStack(spacing: gapSize) {
                ForEach(0..<dashCount, id: \.self) { _ in
                    Rectangle()
                        .fill(color)
                        .frame(width: dashSize, height: dashSize)
                }
            }
        }
        .frame(height: dashSize)
    }
}

// MARK: - Button

struct CircleButtonStyle: ButtonStyle {
    let size: CGFloat = 38
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size, height: size)
            .background(
                Circle()
                    .fill(configuration.isPressed ? Color.buttonGray.opacity(0.8) : Color.buttonGray)
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .borderGradientLight, location: 0),
                                .init(color: .borderGradientDark, location: 1)
                            ]),
                            startPoint: .topLeading,
                            endPoint: UnitPoint(x: 0.8, y: 0.8)
                        ),
                        lineWidth: configuration.isPressed ? 0 : 1
                    )
            )
            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.99 : 1)
            .animation(.easeOut(duration: 0.15), value: configuration.isPressed)
    }
}
