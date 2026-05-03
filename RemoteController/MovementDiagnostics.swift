//
//  MovementDiagnostics.swift
//  RemoteController
//
//  Lightweight movement pipeline diagnostics.
//

import Foundation
import CoreGraphics
import QuartzCore

final class MovementDiagnostics {
    static let shared = MovementDiagnostics()

    enum DropReason: String {
        case bleBlocked
        case stale
        case disconnected
    }

    private struct IntervalHistogram {
        private let bucketUpperBoundsMs: [Double]
        private var counts: [Int]
        private var maxMs: Double = 0

        init(bucketUpperBoundsMs: [Double]) {
            self.bucketUpperBoundsMs = bucketUpperBoundsMs
            self.counts = Array(repeating: 0, count: bucketUpperBoundsMs.count + 1)
        }

        mutating func record(seconds: CFTimeInterval) {
            let ms = max(0, seconds * 1000)
            maxMs = max(maxMs, ms)

            for (index, upperBound) in bucketUpperBoundsMs.enumerated() {
                if ms < upperBound {
                    counts[index] += 1
                    return
                }
            }
            counts[counts.count - 1] += 1
        }

        mutating func summary(name: String) -> String {
            var parts: [String] = []
            var lower = 0.0
            for (index, upperBound) in bucketUpperBoundsMs.enumerated() {
                parts.append("\(formatRange(lower, upperBound))=\(counts[index])")
                lower = upperBound
            }
            parts.append(">=\(formatNumber(lower))ms=\(counts[counts.count - 1])")
            parts.append("max=\(formatNumber(maxMs))ms")
            reset()
            return "\(name): " + parts.joined(separator: " ")
        }

        private mutating func reset() {
            counts = Array(repeating: 0, count: counts.count)
            maxMs = 0
        }

        private func formatRange(_ lower: Double, _ upper: Double) -> String {
            "\(formatNumber(lower))-\(formatNumber(upper))ms"
        }

        private func formatNumber(_ value: Double) -> String {
            if value.rounded() == value {
                return String(Int(value))
            }
            return String(format: "%.1f", value)
        }
    }

    private struct ValueHistogram {
        private let bucketUpperBounds: [Double]
        private var counts: [Int]
        private var maxValue: Double = 0

        init(bucketUpperBounds: [Double]) {
            self.bucketUpperBounds = bucketUpperBounds
            self.counts = Array(repeating: 0, count: bucketUpperBounds.count + 1)
        }

        mutating func record(_ value: Double) {
            let safeValue = max(0, value)
            maxValue = max(maxValue, safeValue)

            for (index, upperBound) in bucketUpperBounds.enumerated() {
                if safeValue < upperBound {
                    counts[index] += 1
                    return
                }
            }
            counts[counts.count - 1] += 1
        }

        mutating func summary(name: String) -> String {
            var parts: [String] = []
            var lower = 0.0
            for (index, upperBound) in bucketUpperBounds.enumerated() {
                parts.append("\(formatRange(lower, upperBound))=\(counts[index])")
                lower = upperBound
            }
            parts.append(">=\(formatNumber(lower))=\(counts[counts.count - 1])")
            parts.append("max=\(formatNumber(maxValue))")
            reset()
            return "\(name): " + parts.joined(separator: " ")
        }

        private mutating func reset() {
            counts = Array(repeating: 0, count: counts.count)
            maxValue = 0
        }

        private func formatRange(_ lower: Double, _ upper: Double) -> String {
            "\(formatNumber(lower))-\(formatNumber(upper))"
        }

        private func formatNumber(_ value: Double) -> String {
            if value.rounded() == value {
                return String(Int(value))
            }
            return String(format: "%.1f", value)
        }
    }

    private let enabled: Bool
    private let summaryInterval: CFTimeInterval = 2.0
    private var lastSummaryTime: CFTimeInterval = CACurrentMediaTime()

    private var touchIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [4, 8, 12, 20, 33, 50])
    private var bleTickIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [8, 12, 17, 25, 34, 50])
    private var bleSendIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [8, 12, 17, 25, 34, 50])
    private var pointerSpeedHistogram = ValueHistogram(bucketUpperBounds: [50, 150, 300, 600, 1000, 1600, 2400])
    private var pointerGainHistogram = ValueHistogram(bucketUpperBounds: [1.1, 1.5, 2.0, 2.5, 3.0, 3.5])
    private var emittedDeltaHistogram = ValueHistogram(bucketUpperBounds: [1, 2, 4, 8, 16, 32, 64, 127])

    private var touchEvents = 0
    private var pointerEvents = 0
    private var emittedPointerPackets = 0
    private var bleAttempts = 0
    private var bleSent = 0
    private var bleBlocked = 0
    private var bleReadyCallbacks = 0
    private var droppedMovementEvents = 0
    private var droppedMovementAbsX: CGFloat = 0
    private var droppedMovementAbsY: CGFloat = 0
    private var lastBleSendTime: CFTimeInterval?
    private var currentBleBlockStartedAt: CFTimeInterval?
    private var longestBleBlock: CFTimeInterval = 0

    private init() {
        #if DEBUG
        enabled = true
        #else
        enabled = false
        #endif
    }

    func recordTouchInterval(_ dt: CFTimeInterval, dx: CGFloat, dy: CGFloat) {
        guard enabled else { return }
        touchEvents += 1
        touchIntervalHistogram.record(seconds: dt)
        maybeFlushSummary()
    }

    func recordPointerGain(speed: CGFloat, gain: CGFloat, safeDt: CFTimeInterval) {
        guard enabled else { return }
        pointerEvents += 1
        pointerSpeedHistogram.record(Double(speed))
        pointerGainHistogram.record(Double(gain))
        maybeFlushSummary()
    }

    func recordPointerEmit(dx: CGFloat, dy: CGFloat) {
        guard enabled else { return }
        emittedPointerPackets += 1
        emittedDeltaHistogram.record(Double(hypot(dx, dy)))
        maybeFlushSummary()
    }

    func recordBleTickInterval(_ dt: CFTimeInterval) {
        guard enabled else { return }
        bleTickIntervalHistogram.record(seconds: dt)
        maybeFlushSummary()
    }

    func recordBleAttempt() {
        guard enabled else { return }
        bleAttempts += 1
        maybeFlushSummary()
    }

    func recordBleSent(dx: Int16, dy: Int16) {
        guard enabled else { return }
        bleSent += 1
        let now = CACurrentMediaTime()
        if let lastBleSendTime {
            bleSendIntervalHistogram.record(seconds: now - lastBleSendTime)
        }
        lastBleSendTime = now
        closeBleBlock(at: now)
        maybeFlushSummary()
    }

    func recordBleBlocked() {
        guard enabled else { return }
        bleBlocked += 1
        let now = CACurrentMediaTime()
        if currentBleBlockStartedAt == nil {
            currentBleBlockStartedAt = now
        }
        maybeFlushSummary()
    }

    func recordBleReadyCallback() {
        guard enabled else { return }
        bleReadyCallbacks += 1
        closeBleBlock(at: CACurrentMediaTime())
        maybeFlushSummary()
    }

    func recordMovementDropped(reason: DropReason, dx: CGFloat, dy: CGFloat) {
        guard enabled else { return }
        droppedMovementEvents += 1
        droppedMovementAbsX += abs(dx)
        droppedMovementAbsY += abs(dy)
        maybeFlushSummary()
    }

    func flushSummaryIfNeeded() {
        guard enabled else { return }
        maybeFlushSummary(force: true)
    }

    private func closeBleBlock(at now: CFTimeInterval) {
        guard let startedAt = currentBleBlockStartedAt else { return }
        longestBleBlock = max(longestBleBlock, now - startedAt)
        currentBleBlockStartedAt = nil
    }

    private func maybeFlushSummary(force: Bool = false) {
        let now = CACurrentMediaTime()
        guard force || now - lastSummaryTime >= summaryInterval else { return }

        if let startedAt = currentBleBlockStartedAt {
            longestBleBlock = max(longestBleBlock, now - startedAt)
        }

        let dropped = "dropped movement: events=\(droppedMovementEvents) absDx=\(Int(droppedMovementAbsX.rounded())) absDy=\(Int(droppedMovementAbsY.rounded()))"
        let ble = "BLE: attempts=\(bleAttempts) sent=\(bleSent) blocked=\(bleBlocked) readyCb=\(bleReadyCallbacks) longestBlock=\(String(format: "%.1f", longestBleBlock * 1000))ms"
        let pointer = "pointer: events=\(pointerEvents) emitted=\(emittedPointerPackets)"
        let touch = "touch: events=\(touchEvents)"

        print("📈 Movement diagnostics\n  \(touch)\n  \(touchIntervalHistogram.summary(name: "touch dt"))\n  \(pointer)\n  \(pointerSpeedHistogram.summary(name: "speed"))\n  \(pointerGainHistogram.summary(name: "gain"))\n  \(emittedDeltaHistogram.summary(name: "emit delta"))\n  \(ble)\n  \(bleTickIntervalHistogram.summary(name: "BLE tick dt"))\n  \(bleSendIntervalHistogram.summary(name: "BLE send dt"))\n  \(dropped)")

        touchEvents = 0
        pointerEvents = 0
        emittedPointerPackets = 0
        bleAttempts = 0
        bleSent = 0
        bleBlocked = 0
        bleReadyCallbacks = 0
        droppedMovementEvents = 0
        droppedMovementAbsX = 0
        droppedMovementAbsY = 0
        longestBleBlock = 0
        lastSummaryTime = now
    }
}
