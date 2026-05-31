//
//  UDPMotionSender.swift
//  RemoteController
//
//  UDP motion sender for the Wi-Fi cursor path.
//
//  The sender keeps lab modes for balancing frame density against
//  stale backlog replay.
//

import Foundation
import CoreGraphics
import Network
import QuartzCore

final class UDPMotionSender {
    enum SchedulingMode: String {
        case accumulator125Hz
        case fifo250Hz
        case boundedFifo250Hz
        case latestWins250Hz
    }

    private let connection: NWConnection
    private let queue = DispatchQueue(label: "name.jason.RemoteController.udpMotion", qos: .userInteractive)
    private let packetMarker: UInt8
    private let schedulingMode: SchedulingMode
    // Active-only drain rate. Current baseline uses 125 Hz to reduce
    // timer/network wakeups; lab comparison modes keep 250 Hz semantics.
    private var frameInterval: CFTimeInterval {
        switch schedulingMode {
        case .accumulator125Hz:
            return 0.008
        case .fifo250Hz, .boundedFifo250Hz, .latestWins250Hz:
            return 0.004
        }
    }
    // Subframes older than this at drain time are pruned from the head of the
    // queue (input went stale during a network blip).
    private let staleInterval: CFTimeInterval = 0.032
    // Latest-wins mode should never replay old motion to "catch up". If the
    // pending aggregate is older than this, it is dropped before emit.
    private let latestWinsMaxPendingAge: CFTimeInterval = 0.012
    // Hybrid FIFO mode keeps enough per-sample frames to avoid low-FPS motion,
    // but drops older burst history before it becomes a delayed tail.
    private let boundedFifoMaxQueuedSubframes = 6
    private let boundedFifoMaxQueueAge: CFTimeInterval = 0.024
    // Per-subframe Int16 cap. Above this is structurally a "fast flick" and
    // the ESP HID pacer will clamp again to MAX_HID_DELTA_PER_REPORT (127),
    // so this is mostly to avoid pathological values.
    private let maxDeltaPerFrame: CGFloat = 1024
    // Up to this many subframes per UDP datagram and per drain tick. We
    // intentionally keep this at 1 so a 5-sample iOS callback burst (which
    // arrives in <1ms because UIKit dumps coalescedTouches synchronously)
    // gets time-spread across N sender ticks instead of being mashed back
    // into a single packet. Empirically, packing >1 subframe per packet
    // round-trips into the ESP pacer summing them again -> 30 Hz cursor.
    // ESP_Bridge_TinyUSB.ino's UDP_SUBFRAMES_PER_PACKET must be >= this.
    private let maxSubframesPerDatagram = 1

    private struct MotionSubframe {
        let dx: Int16
        let dy: Int16
        let timestamp: CFTimeInterval
    }

    private var timer: DispatchSourceTimer?
    private var sequence: UInt8 = 0
    // Sub-quantum motion that hasn't crossed an integer boundary yet. Carried
    // across enqueueMotion calls so a slow drag (e.g. 0.3 px / sample) doesn't
    // round to zero indefinitely.
    private var fractionalDx: CGFloat = 0
    private var fractionalDy: CGFloat = 0
    // FIFO of per-sample subframes awaiting UDP transmission. One entry per
    // coalesced touch sample (when the sample produced a non-zero Int16
    // delta after quantization).
    private var queuedSubframes: [MotionSubframe] = []
    private var pendingDx: CGFloat = 0
    private var pendingDy: CGFloat = 0
    private var pendingFirstArrivalTimestamp: CFTimeInterval?
    private var lastInputReceiveTimestamp: CFTimeInterval?
    private var lastTimerFireTimestamp: CFTimeInterval?
    private var isCancelled = false

    // Sets up UDP connection. The motion timer is active-only and starts on
    // first movement, then stops after finger up or idle drain.
    init(host: String, port: UInt16, packetMarker: UInt8, schedulingMode: SchedulingMode) {
        self.packetMarker = packetMarker
        self.schedulingMode = schedulingMode
        let endpointHost = NWEndpoint.Host(host)
        let endpointPort = NWEndpoint.Port(rawValue: port)!
        connection = NWConnection(host: endpointHost, port: endpointPort, using: .udp)
        MovementDiagnostics.shared.setExperimentLabels(udpSchedulerMode: schedulingMode.rawValue)
        connection.stateUpdateHandler = { state in
            #if DEBUG
            if RuntimeDiagnostics.transportStateLogs {
                print("UDP motion state: \(state)")
            }
            #endif
        }
        connection.start(queue: queue)
    }

    // Receives a single touch movement delta, accumulates sub-pixel remainders to avoid rounding to zero,
    // caps extreme values, converts to Int16, and pushes the result onto the back of the subframe queue.
    func enqueueMotion(dx: CGFloat, dy: CGFloat, timestamp _: CFTimeInterval) {
        guard dx != 0 || dy != 0 else { return }

        queue.async { [weak self] in
            guard let self, !self.isCancelled else { return }
            let arrival = CACurrentMediaTime()
            self.startTimerIfNeeded()

            switch self.schedulingMode {
            case .accumulator125Hz:
                self.enqueueAccumulatedMotion(dx: dx, dy: dy, arrival: arrival)
            case .fifo250Hz:
                self.enqueueFifoMotion(dx: dx, dy: dy, arrival: arrival)
            case .boundedFifo250Hz:
                self.enqueueFifoMotion(dx: dx, dy: dy, arrival: arrival)
                self.trimBoundedFifoQueue(recordDrop: true)
            case .latestWins250Hz:
                self.enqueueLatestWinsMotion(dx: dx, dy: dy, arrival: arrival)
            }
            self.lastInputReceiveTimestamp = arrival
            self.recordQueueState()
        }
    }

    // Finger lifted; clears the queue cleanly
    func endMotionStream() {
        queue.async { [weak self] in
            guard let self, !self.isCancelled else { return }
            self.clearMotionState(recordDrop: true)
            self.lastInputReceiveTimestamp = nil
            self.stopTimer()
        }
    }

    // Full teardown; stops timer and closes connection
    func cancel() {
        queue.async { [weak self] in
            guard let self, !self.isCancelled else { return }
            self.isCancelled = true
            self.stopTimer()
            self.connection.cancel()
        }
    }

    private func startTimerIfNeeded() {
        guard timer == nil else { return }
        let timer = DispatchSource.makeTimerSource(queue: queue)
        timer.schedule(deadline: .now() + frameInterval, repeating: frameInterval, leeway: .milliseconds(1))
        timer.setEventHandler { [weak self] in
            self?.emitFrameIfNeeded()
        }
        timer.resume()
        self.timer = timer
    }

    private func stopTimer() {
        timer?.cancel()
        timer = nil
        lastTimerFireTimestamp = nil
    }

    // Fires only while motion is active, steadily emptying pending movement.
    private func emitFrameIfNeeded() {
        guard !isCancelled else { return }

        let now = CACurrentMediaTime()
        if let lastTimerFireTimestamp {
            MovementDiagnostics.shared.recordUdpTimerInterval(now - lastTimerFireTimestamp)
        }
        lastTimerFireTimestamp = now

        pruneStaleMotion(now: now) // Remove anything too old

        let hadInput: Bool
        if let lastInputReceiveTimestamp {
            hadInput = (now - lastInputReceiveTimestamp) <= staleInterval
        } else {
            hadInput = false
        }

        let willEmit = hasMotionReadyToEmit()
        MovementDiagnostics.shared.recordUdpSenderTick(emitted: willEmit, hadInput: hadInput)

        if willEmit {
            switch schedulingMode {
            case .accumulator125Hz:
                flushAccumulatedFrame()
            case .fifo250Hz, .boundedFifo250Hz:
                flushFifoBatch()
            case .latestWins250Hz:
                flushLatestWinsFrame(now: now)
            }
        }

        // Stream-end bookkeeping: if input has gone stale and the queue is
        // already empty, mirror the previous behavior of marking the stream
        // closed so diagnostics can recompute idle time.
        if !willEmit, let lastInputReceiveTimestamp,
           now - lastInputReceiveTimestamp > staleInterval {
            self.lastInputReceiveTimestamp = nil
            MovementDiagnostics.shared.recordUdpStreamEnded()
            stopTimer()
        }

        recordQueueState()
    }

    private func enqueueAccumulatedMotion(dx: CGFloat, dy: CGFloat, arrival: CFTimeInterval) {
        if pendingFirstArrivalTimestamp == nil {
            pendingFirstArrivalTimestamp = arrival
        }
        pendingDx += dx
        pendingDy += dy
    }

    private func enqueueFifoMotion(dx: CGFloat, dy: CGFloat, arrival: CFTimeInterval) {
        // Accumulate dx/dy sub-pixels; otherwise repeated 0.x movement can
        // round to zero forever and the cursor never moves.
        fractionalDx += dx
        fractionalDy += dy

        let rawDx = fractionalDx.rounded()
        let rawDy = fractionalDy.rounded()
        let cappedDx = max(-maxDeltaPerFrame, min(maxDeltaPerFrame, rawDx))
        let cappedDy = max(-maxDeltaPerFrame, min(maxDeltaPerFrame, rawDy))
        let wasCapped = cappedDx != rawDx || cappedDy != rawDy

        fractionalDx -= cappedDx
        fractionalDy -= cappedDy

        if wasCapped {
            MovementDiagnostics.shared.recordUdpFrameCapped()
        }

        let intDx = Int16(cappedDx)
        let intDy = Int16(cappedDy)
        if intDx != 0 || intDy != 0 {
            queuedSubframes.append(MotionSubframe(dx: intDx, dy: intDy, timestamp: arrival))
        }
    }

    private func enqueueLatestWinsMotion(dx: CGFloat, dy: CGFloat, arrival: CFTimeInterval) {
        if let first = pendingFirstArrivalTimestamp,
           arrival - first > latestWinsMaxPendingAge {
            clearPendingAggregate(recordDrop: true)
        }

        if pendingFirstArrivalTimestamp == nil {
            pendingFirstArrivalTimestamp = arrival
        }
        pendingDx += dx
        pendingDy += dy
    }

    // Walks the front of the FIFO and discards stale subframes. Bounded FIFO
    // uses a tighter age cap. Aggregate modes drop their pending motion.
    private func pruneStaleMotion(now: CFTimeInterval) {
        while let first = queuedSubframes.first,
              now - first.timestamp > staleInterval {
            queuedSubframes.removeFirst()
            MovementDiagnostics.shared.recordUdpStaleDrop(
                dx: CGFloat(first.dx),
                dy: CGFloat(first.dy)
            )
        }

        if schedulingMode == .boundedFifo250Hz {
            trimBoundedFifoQueue(now: now, recordDrop: true)
        }

        if let first = pendingFirstArrivalTimestamp,
           now - first > staleInterval {
            clearPendingAggregate(recordDrop: true)
        }
    }

    private func trimBoundedFifoQueue(now: CFTimeInterval? = nil, recordDrop: Bool) {
        while queuedSubframes.count > boundedFifoMaxQueuedSubframes {
            dropOldestQueuedSubframe(recordDrop: recordDrop)
        }

        if let now {
            while let first = queuedSubframes.first,
                  now - first.timestamp > boundedFifoMaxQueueAge {
                dropOldestQueuedSubframe(recordDrop: recordDrop)
            }
        }
    }

    private func dropOldestQueuedSubframe(recordDrop: Bool) {
        guard !queuedSubframes.isEmpty else { return }
        let dropped = queuedSubframes.removeFirst()
        if recordDrop {
            MovementDiagnostics.shared.recordUdpStaleDrop(
                dx: CGFloat(dropped.dx),
                dy: CGFloat(dropped.dy)
            )
        }
    }

    // Ships at most one motion frame per timer tick. FIFO lab modes
    // preserve per-sample frames; the 125 Hz production-energy candidate
    // accumulates samples between ticks to avoid backlog.
    private func hasMotionReadyToEmit() -> Bool {
        switch schedulingMode {
        case .accumulator125Hz:
            return pendingDx != 0 || pendingDy != 0 || abs(fractionalDx) >= 0.5 || abs(fractionalDy) >= 0.5
        case .fifo250Hz, .boundedFifo250Hz:
            return !queuedSubframes.isEmpty
        case .latestWins250Hz:
            return pendingDx != 0 || pendingDy != 0 || abs(fractionalDx) >= 0.5 || abs(fractionalDy) >= 0.5
        }
    }

    private func flushFifoBatch() {
        guard !queuedSubframes.isEmpty else { return }
        let take = min(queuedSubframes.count, maxSubframesPerDatagram)
        let chunk = Array(queuedSubframes.prefix(take))
        queuedSubframes.removeFirst(take)
        send(subframes: chunk)
    }

    private func flushAccumulatedFrame() {
        flushPendingAggregate(maxPendingAge: staleInterval, carryCappedOverflow: true)
    }

    private func flushLatestWinsFrame(now: CFTimeInterval) {
        flushPendingAggregate(maxPendingAge: latestWinsMaxPendingAge, carryCappedOverflow: false, now: now)
    }

    private func flushPendingAggregate(
        maxPendingAge: CFTimeInterval,
        carryCappedOverflow: Bool,
        now: CFTimeInterval = CACurrentMediaTime()
    ) {
        guard pendingDx != 0 || pendingDy != 0 || abs(fractionalDx) >= 0.5 || abs(fractionalDy) >= 0.5 else { return }

        if let first = pendingFirstArrivalTimestamp,
           now - first > maxPendingAge {
            clearPendingAggregate(recordDrop: true)
            return
        }

        let timestamp = pendingFirstArrivalTimestamp ?? now
        let totalDx = pendingDx + fractionalDx
        let totalDy = pendingDy + fractionalDy
        let rawDx = totalDx.rounded()
        let rawDy = totalDy.rounded()
        let cappedDx = max(-maxDeltaPerFrame, min(maxDeltaPerFrame, rawDx))
        let cappedDy = max(-maxDeltaPerFrame, min(maxDeltaPerFrame, rawDy))
        let wasCapped = cappedDx != rawDx || cappedDy != rawDy

        pendingDx = 0
        pendingDy = 0
        pendingFirstArrivalTimestamp = nil

        if wasCapped {
            MovementDiagnostics.shared.recordUdpFrameCapped()
            if carryCappedOverflow {
                fractionalDx = totalDx - cappedDx
                fractionalDy = totalDy - cappedDy
            } else {
                // Latest-wins is intentionally lossy under extreme bursts.
                fractionalDx = 0
                fractionalDy = 0
            }
        } else {
            fractionalDx = totalDx - cappedDx
            fractionalDy = totalDy - cappedDy
        }

        let intDx = Int16(cappedDx)
        let intDy = Int16(cappedDy)
        guard intDx != 0 || intDy != 0 else { return }
        send(subframes: [MotionSubframe(dx: intDx, dy: intDy, timestamp: timestamp)])
    }

    // Building and sending the UDP packet
    private func send(subframes: [MotionSubframe]) {
        sequence &+= 1

        // Each packet: 7 bytes (3 header + 4 for one dx/dy pair)
        var packet = Data(capacity: 3 + maxSubframesPerDatagram * 4)
        packet.append(packetMarker)
        packet.append(sequence)
        packet.append(UInt8(subframes.count))
        for subframe in subframes {
            withUnsafeBytes(of: subframe.dx.littleEndian) { bytes in
                packet.append(contentsOf: bytes)
            }
            withUnsafeBytes(of: subframe.dy.littleEndian) { bytes in
                packet.append(contentsOf: bytes)
            }
        }

        // Package sent via NWConnection over UDP (fast, no handshake, fire-and-forget)
        connection.send(content: packet, completion: .contentProcessed { error in
            #if DEBUG
            if RuntimeDiagnostics.transportStateLogs, let error {
                print("UDP motion send error: \(error)")
            }
            #endif
        })

        let sentAt = CACurrentMediaTime()
        MovementDiagnostics.shared.recordUdpDatagramSent(subframes: subframes.count)
        for subframe in subframes {
            MovementDiagnostics.shared.recordUdpSubframeSent(
                dx: subframe.dx,
                dy: subframe.dy,
                queueAge: sentAt - subframe.timestamp
            )
        }
    }

    // Resets all motion state (fractional accumulators + subframe queue) to zero.
    // Optionally records the total discarded movement to diagnostics if any was lost.
    private func clearMotionState(recordDrop: Bool) {
        let queuedDx = queuedSubframes.reduce(CGFloat(0)) { $0 + CGFloat($1.dx) }
        let queuedDy = queuedSubframes.reduce(CGFloat(0)) { $0 + CGFloat($1.dy) }
        let droppedDx = fractionalDx + queuedDx + pendingDx
        let droppedDy = fractionalDy + queuedDy + pendingDy
        fractionalDx = 0
        fractionalDy = 0
        queuedSubframes.removeAll()
        pendingDx = 0
        pendingDy = 0
        pendingFirstArrivalTimestamp = nil

        if recordDrop && (droppedDx != 0 || droppedDy != 0) {
            MovementDiagnostics.shared.recordUdpStaleDrop(dx: droppedDx, dy: droppedDy)
        }
        MovementDiagnostics.shared.recordUdpStreamEnded()
        recordQueueState()
    }

    private func clearPendingAggregate(recordDrop: Bool) {
        let droppedDx = pendingDx + fractionalDx
        let droppedDy = pendingDy + fractionalDy
        pendingDx = 0
        pendingDy = 0
        fractionalDx = 0
        fractionalDy = 0
        pendingFirstArrivalTimestamp = nil

        if recordDrop && (droppedDx != 0 || droppedDy != 0) {
            MovementDiagnostics.shared.recordUdpStaleDrop(dx: droppedDx, dy: droppedDy)
        }
    }

    // Snapshots the current queue length and total pending dx/dy (including fractional remainder)
    // and forwards it to MovementDiagnostics for Monitoring.
    private func recordQueueState() {
        guard RuntimeDiagnostics.movementPipeline else { return }
        let queuedDx = queuedSubframes.reduce(CGFloat(0)) { $0 + CGFloat($1.dx) }
        let queuedDy = queuedSubframes.reduce(CGFloat(0)) { $0 + CGFloat($1.dy) }
        MovementDiagnostics.shared.recordUdpSchedulerState(
            queuedFrames: queuedSubframes.count + (pendingDx != 0 || pendingDy != 0 ? 1 : 0),
            pendingDx: queuedDx + pendingDx + fractionalDx,
            pendingDy: queuedDy + pendingDy + fractionalDy
        )
    }
}
