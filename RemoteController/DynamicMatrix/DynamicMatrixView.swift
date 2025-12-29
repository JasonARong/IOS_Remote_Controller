//
//  DynamicMatrixView.swift
//  RemoteController
//
//  Created by 陈皆成 on 2025/12/28.
//

import SwiftUI

struct DynamicMatrixView: View {
    @ObservedObject var viewModel: DynamicMatrixViewModel
    @State private var geometrySize: CGSize = .zero
    
    private let matrixSpaceName = "matrixSpace"
    
    init(viewModel: DynamicMatrixViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    private var matrixShiftXBinding: Binding<Double> {
        Binding(
            get: { Double(viewModel.matrixShiftValueX) },
            set: { viewModel.matrixShiftValueX = CGFloat($0) }
        )
    }

    private var matrixShiftYBinding: Binding<Double> {
        Binding(
            get: { Double(viewModel.matrixShiftValueY) },
            set: { viewModel.matrixShiftValueY = CGFloat($0) }
        )
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color.backgroundBlack
                    .ignoresSafeArea()
                
                // Circles
                ForEach(viewModel.circles) { circle in
                    let attraction = viewModel.attractionOffset(for: circle.position)
                    let matrixShift = viewModel.matrixShiftOffset(for: circle.targetPosition)
                    let touchOpacity = viewModel.attractionOpacity(for: circle.position)
                    let matrixOpacity = viewModel.matrixShiftOpacity(for: circle.targetPosition)
                    // Combine two independent opacity boosts, bounded to [base, 1].
                    let opacity = max(touchOpacity, matrixOpacity)
                    let highlightOpacity = viewModel.matrixShiftHighlightOpacity(for: circle.targetPosition)
                    let combinedOffset = CGSize(
                        width: attraction.width + matrixShift.width,
                        height: attraction.height + matrixShift.height
                    )
                    Circle()
                        .fill(Color.circleWhite)
                        .opacity(opacity)
                        .overlay(
                            Circle()
                                .fill(Color.circleHighlightGreen)
                                .opacity(highlightOpacity)
                        )
                        .frame(width: viewModel.circleSize, height: viewModel.circleSize)
                        .position(circle.position)
                        .offset(combinedOffset)
                        // Timer-driven movement has animations disabled in ViewModel transactions.
                        .animation(
                            .interactiveSpring(
                                response: viewModel.attractionSettings.springResponse,
                                dampingFraction: viewModel.attractionSettings.springDampingFraction,
                                blendDuration: viewModel.attractionSettings.springBlendDuration
                            ),
                            value: viewModel.touchLocation
                        )
                        .animation(
                            .interactiveSpring(
                                response: viewModel.matrixShiftSettings.springResponse,
                                dampingFraction: viewModel.matrixShiftSettings.springDampingFraction,
                                blendDuration: viewModel.matrixShiftSettings.springBlendDuration
                            ),
                            value: viewModel.matrixShiftValueX
                        )
                        .animation(
                            .interactiveSpring(
                                response: viewModel.matrixShiftSettings.springResponse,
                                dampingFraction: viewModel.matrixShiftSettings.springDampingFraction,
                                blendDuration: viewModel.matrixShiftSettings.springBlendDuration
                            ),
                            value: viewModel.matrixShiftValueY
                        )
                        .allowsHitTesting(false)
                }

                // Full-screen touch pad (single finger), layered above circles but below button
                Rectangle()
                    .fill(Color.clear)
                    .contentShape(Rectangle())
                    .gesture(
                        // IMPORTANT: Use the same coordinate space as the circles, otherwise safe-area
                        // differences (e.g. status bar) can create a constant Y offset.
                        DragGesture(minimumDistance: 0, coordinateSpace: .named(matrixSpaceName))
                            .onChanged { value in
                                viewModel.setTouchLocation(value.location)
                            }
                            .onEnded { _ in
                                viewModel.setTouchLocation(nil)
                            }
                    )
                    .ignoresSafeArea()
                    .allowsHitTesting(true)

                if viewModel.attractionSettings.showsTouchIndicator, let touch = viewModel.touchLocation {
                    Circle()
                        .stroke(Color.touchIndicatorWhite, lineWidth: 1)
                        .frame(width: 14, height: 14)
                        .position(touch)
                        .allowsHitTesting(false)
                }
                
                // Button overlay
//                VStack {
//                    Spacer()
//                    
//                    // Slider: only active/visible in matrix mode
//                    if viewModel.mode == .matrix {
//                        VStack(spacing: 10) {
//                            Text("Matrix Shift")
//                                .font(.subheadline)
//                                .foregroundColor(.textWhitePrimary)
//                            
//                            // Horizontal shift
//                            Slider(value: matrixShiftXBinding, in: -1...1)
//                                .tint(.white)
//                            
//                            HStack {
//                                Text("Left")
//                                Spacer()
//                                Text("Right")
//                            }
//                            .font(.caption)
//                            .foregroundColor(.textWhiteSecondary)
//
//                            // Vertical shift
//                            Slider(value: matrixShiftYBinding, in: -1...1)
//                                .tint(.white)
//
//                            HStack {
//                                Text("Up")
//                                Spacer()
//                                Text("Down")
//                            }
//                            .font(.caption)
//                            .foregroundColor(.textWhiteSecondary)
//                        }
//                        .padding(.horizontal, 24)
//                        .padding(.bottom, 16)
//                    }
//                    
//                    Button(action: {
//                        if viewModel.mode == .random {
//                            viewModel.animateToMatrix()
//                        } else {
//                            viewModel.resetToRandomMovement()
//                        }
//                    }) {
//                        Text(viewModel.mode == .random ? "Organize Matrix" : "Reset Movement")
//                            .font(.headline)
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 24)
//                            .padding(.vertical, 12)
//                            .background(Color.buttonBlue)
//                            .cornerRadius(10)
//                    }
//                    .padding(.bottom, 50)
//                }
            }
            .coordinateSpace(name: matrixSpaceName)
            .onAppear {
                geometrySize = geometry.size
                viewModel.setupCircles(in: CGRect(origin: .zero, size: geometry.size))
            }
            .onChange(of: geometry.size) { newSize in
                geometrySize = newSize
                viewModel.setupCircles(in: CGRect(origin: .zero, size: newSize))
            }
        }
    }
}

#Preview {
    DynamicMatrixView(viewModel: DynamicMatrixViewModel())
}
