//
//  PreConnectionLayout.swift
//  UITest
//
//  Centralized layout constants for PreConnection UI.
//  Kept out of SwiftUI files to avoid MainActor inference warnings.
//

import CoreGraphics

enum PreConnectionLayout {
    // Status list viewport
    static let statusListWidth: CGFloat = 184
    static let statusListHeight: CGFloat = 65
    static let statusListBottomMargin: CGFloat = 10

    // Row sizing / spacing (should match StatusRowView’s font visual height)
    static let statusRowHeight: CGFloat = 14
    static let statusRowGap: CGFloat = 6

    // Cleanup leeway (how far below the viewport before removing for perf)
    static let removalLeeway: CGFloat = 20
}

