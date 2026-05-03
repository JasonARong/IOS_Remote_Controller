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
    private let lock = NSLock()
    private let summaryInterval: CFTimeInterval = 2.0
    private var lastSummaryTime: CFTimeInterval = CACurrentMediaTime()

    private var touchIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [4, 8, 12, 20, 33, 50])
    private var coalescedSampleIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [4, 8, 12, 20, 33, 50])
    private var bleTickIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [8, 12, 17, 25, 34, 50])
    private var bleSendIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [8, 12, 17, 25, 34, 50])
    private var udpSendIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [8, 12, 17, 25, 34, 50])
    private var udpTimerIntervalHistogram = IntervalHistogram(bucketUpperBoundsMs: [4, 8, 12, 17, 25, 34, 50])
    private var pointerSpeedHistogram = ValueHistogram(bucketUpperBounds: [50, 150, 300, 600, 1000, 1600, 2400])
    private var pointerGainHistogram = ValueHistogram(bucketUpperBounds: [1.1, 1.5, 2.0, 2.5, 3.0, 3.5])
    private var emittedDeltaHistogram = ValueHistogram(bucketUpperBounds: [1, 2, 4, 8, 16, 32, 64, 127])

    private var touchCallbacks = 0
    private var coalescedSamples = 0
    private var touchEvents = 0
    private var pointerEvents = 0
    private var emittedPointerPackets = 0
    private var bleAttempts = 0
    private var bleSent = 0
    private var bleBlocked = 0
    private var bleReadyCallbacks = 0
    private var udpDatagramsSent = 0
    private var udpSubframesSent = 0
    private var udpFrameCapped = 0
    private var udpStaleDrops = 0
    private var udpSenderTicks = 0
    private var udpSenderEmittedTicks = 0
    private var udpSenderEmptyWhileActive = 0
    private var maxUdpBatchedSubframes = 0
    private var maxUdpPendingAbs: CGFloat = 0
    private var droppedMovementEvents = 0
    private var droppedMovementAbsX: CGFloat = 0
    private var droppedMovementAbsY: CGFloat = 0
    private var lastBleSendTime: CFTimeInterval?
    private var lastUdpSendTime: CFTimeInterval?
    private var currentBleBlockStartedAt: CFTimeInterval?
    private var longestBleBlock: CFTimeInterval = 0

    private init() {
        #if DEBUG
        enabled = true
        #else
        enabled = false
        #endif
    }

    private func withLock(_ body: () -> Void) {
        lock.lock()
        defer { lock.unlock() }
        body()
    }

    func recordTouchInterval(_ dt: CFTimeInterval, dx: CGFloat, dy: CGFloat) {
        guard enabled else { return }
        withLock {
            touchEvents += 1
            touchIntervalHistogram.record(seconds: dt)
            maybeFlushSummary()
        }
    }

    func recordTouchCallback(coalescedSampleCount: Int) {
        guard enabled else { return }
        withLock {
            touchCallbacks += 1
            coalescedSamples += max(0, coalescedSampleCount)
            maybeFlushSummary()
        }
    }

    func recordCoalescedSampleInterval(_ dt: CFTimeInterval) {
        guard enabled, dt >= 0 else { return }
        withLock {
            coalescedSampleIntervalHistogram.record(seconds: dt)
            maybeFlushSummary()
        }
    }

    func recordPointerGain(speed: CGFloat, gain: CGFloat, safeDt: CFTimeInterval) {
        guard enabled else { return }
        withLock {
            pointerEvents += 1
            pointerSpeedHistogram.record(Double(speed))
            pointerGainHistogram.record(Double(gain))
            maybeFlushSummary()
        }
    }

    func recordPointerEmit(dx: CGFloat, dy: CGFloat) {
        guard enabled else { return }
        withLock {
            emittedPointerPackets += 1
            emittedDeltaHistogram.record(Double(hypot(dx, dy)))
            maybeFlushSummary()
        }
    }

    func recordBleTickInterval(_ dt: CFTimeInterval) {
        guard enabled else { return }
        withLock {
            bleTickIntervalHistogram.record(seconds: dt)
            maybeFlushSummary()
        }
    }

    func recordBleAttempt() {
        guard enabled else { return }
        withLock {
            bleAttempts += 1
            maybeFlushSummary()
        }
    }

    func recordBleSent(dx: Int16, dy: Int16) {
        guard enabled else { return }
        withLock {
            bleSent += 1
            let now = CACurrentMediaTime()
            if let lastBleSendTime {
                bleSendIntervalHistogram.record(seconds: now - lastBleSendTime)
            }
            lastBleSendTime = now
            closeBleBlock(at: now)
            maybeFlushSummary()
        }
    }

    func recordUdpDatagramSent(subframes _: Int) {
        guard enabled else { return }
        withLock {
            udpDatagramsSent += 1
            let now = CACurrentMediaTime()
            if let lastUdpSendTime {
                udpSendIntervalHistogram.record(seconds: now - lastUdpSendTime)
            }
            lastUdpSendTime = now
            maybeFlushSummary()
        }
    }

    func recordUdpSubframeSent(dx: Int16, dy: Int16) {
        guard enabled else { return }
        withLock {
            udpSubframesSent += 1
            emittedDeltaHistogram.record(Double(hypot(Double(dx), Double(dy))))
            maybeFlushSummary()
        }
    }

    func recordUdpTimerInterval(_ dt: CFTimeInterval) {
        guard enabled else { return }
        withLock {
            udpTimerIntervalHistogram.record(seconds: dt)
            maybeFlushSummary()
        }
    }

    /// Records one UDP sender timer tick.
    /// - Parameters:
    ///   - emitted: whether the tick produced a non-zero subframe.
    ///   - hadInput: whether motion input was considered active at tick time.
    /// `emptyWhileActive` is the diagnostic that proves the slow-drag
    /// resolution-scaling change worked: target is near zero during steady
    /// motion. Without scaling, this counter sees most ticks rounding to
    /// zero on slow drags.
    func recordUdpSenderTick(emitted: Bool, hadInput: Bool) {
        guard enabled else { return }
        withLock {
            udpSenderTicks += 1
            if emitted {
                udpSenderEmittedTicks += 1
            } else if hadInput {
                udpSenderEmptyWhileActive += 1
            }
            maybeFlushSummary()
        }
    }

    func recordUdpSchedulerState(queuedFrames: Int, pendingDx: CGFloat, pendingDy: CGFloat) {
        guard enabled else { return }
        withLock {
            maxUdpBatchedSubframes = max(maxUdpBatchedSubframes, queuedFrames)
            maxUdpPendingAbs = max(maxUdpPendingAbs, abs(pendingDx), abs(pendingDy))
            maybeFlushSummary()
        }
    }

    func recordUdpFrameCapped() {
        guard enabled else { return }
        withLock {
            udpFrameCapped += 1
            maybeFlushSummary()
        }
    }

    func recordUdpStaleDrop(dx: CGFloat, dy: CGFloat) {
        guard enabled else { return }
        withLock {
            udpStaleDrops += 1
            droppedMovementEvents += 1
            droppedMovementAbsX += abs(dx)
            droppedMovementAbsY += abs(dy)
            maybeFlushSummary()
        }
    }

    func recordUdpStreamEnded() {
        guard enabled else { return }
        withLock {
            lastUdpSendTime = nil
        }
    }

    func recordBleBlocked() {
        guard enabled else { return }
        withLock {
            bleBlocked += 1
            let now = CACurrentMediaTime()
            if currentBleBlockStartedAt == nil {
                currentBleBlockStartedAt = now
            }
            maybeFlushSummary()
        }
    }

    func recordBleReadyCallback() {
        guard enabled else { return }
        withLock {
            bleReadyCallbacks += 1
            closeBleBlock(at: CACurrentMediaTime())
            maybeFlushSummary()
        }
    }

    func recordMovementDropped(reason: DropReason, dx: CGFloat, dy: CGFloat) {
        guard enabled else { return }
        withLock {
            droppedMovementEvents += 1
            droppedMovementAbsX += abs(dx)
            droppedMovementAbsY += abs(dy)
            maybeFlushSummary()
        }
    }

    func flushSummaryIfNeeded() {
        guard enabled else { return }
        withLock {
            maybeFlushSummary(force: true)
        }
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
        let udp = "UDP: datagrams=\(udpDatagramsSent) subframes=\(udpSubframesSent) capped=\(udpFrameCapped) staleDrops=\(udpStaleDrops) maxBatch=\(maxUdpBatchedSubframes) maxPending=\(Int(maxUdpPendingAbs.rounded()))"
        let udpSender = "UDP sender: ticks=\(udpSenderTicks) emitted=\(udpSenderEmittedTicks) emptyWhileActive=\(udpSenderEmptyWhileActive)"
        let pointer = "pointer: events=\(pointerEvents) emitted=\(emittedPointerPackets)"
        let touch = "touch: callbacks=\(touchCallbacks) coalescedSamples=\(coalescedSamples) motionEvents=\(touchEvents)"

        print("📈 Movement diagnostics\n  \(touch)\n  \(touchIntervalHistogram.summary(name: "touch dt"))\n  \(coalescedSampleIntervalHistogram.summary(name: "coalesced dt"))\n  \(pointer)\n  \(pointerSpeedHistogram.summary(name: "speed"))\n  \(pointerGainHistogram.summary(name: "gain"))\n  \(emittedDeltaHistogram.summary(name: "emit delta"))\n  \(ble)\n  \(bleTickIntervalHistogram.summary(name: "BLE tick dt"))\n  \(bleSendIntervalHistogram.summary(name: "BLE send dt"))\n  \(udp)\n  \(udpSender)\n  \(udpTimerIntervalHistogram.summary(name: "UDP timer dt"))\n  \(udpSendIntervalHistogram.summary(name: "UDP send dt"))\n  \(dropped)")

        touchCallbacks = 0
        coalescedSamples = 0
        touchEvents = 0
        pointerEvents = 0
        emittedPointerPackets = 0
        bleAttempts = 0
        bleSent = 0
        bleBlocked = 0
        bleReadyCallbacks = 0
        udpDatagramsSent = 0
        udpSubframesSent = 0
        udpFrameCapped = 0
        udpStaleDrops = 0
        udpSenderTicks = 0
        udpSenderEmittedTicks = 0
        udpSenderEmptyWhileActive = 0
        maxUdpBatchedSubframes = 0
        maxUdpPendingAbs = 0
        droppedMovementEvents = 0
        droppedMovementAbsX = 0
        droppedMovementAbsY = 0
        longestBleBlock = 0
        lastSummaryTime = now
    }
}
