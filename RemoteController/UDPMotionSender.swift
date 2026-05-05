//
//  UDPMotionSender.swift
//  RemoteController
//
//  UDP motion sender for the Wi-Fi motion POC.
//
//  Each coalesced touch sample is quantized into its own Int16 MotionSubframe
//  in `enqueueMotion`, then the timer drains the FIFO into UDP datagrams. The
//  previous design summed all samples in a burst into one scalar, which
//  destroyed the per-sample temporal granularity iOS gives us at 240 Hz and
//  collapsed it down to ~25 reports/s on the host. See `Log 13` analysis.
//

import Foundation
import CoreGraphics
import Network
import QuartzCore

final class UDPMotionSender {
    private let connection: NWConnection
    private let queue = DispatchQueue(label: "name.jason.RemoteController.udpMotion", qos: .userInteractive)
    private let packetMarker: UInt8
    // 250 Hz drain rate. Matches coalesced-touch arrival cadence (240 Hz)
    // closely enough that we ship subframes within one tick of arrival.
    private let frameInterval: CFTimeInterval = 0.004
    // Subframes older than this at drain time are pruned from the head of the
    // queue (input went stale during a network blip).
    private let staleInterval: CFTimeInterval = 0.032
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
    private var lastInputReceiveTimestamp: CFTimeInterval?
    private var lastTimerFireTimestamp: CFTimeInterval?
    private var isCancelled = false

    // Sets up UDP connection and starts the 250Hz timer
    init(host: String, port: UInt16, packetMarker: UInt8) {
        self.packetMarker = packetMarker
        let endpointHost = NWEndpoint.Host(host)
        let endpointPort = NWEndpoint.Port(rawValue: port)!
        connection = NWConnection(host: endpointHost, port: endpointPort, using: .udp)
        connection.stateUpdateHandler = { state in
            #if DEBUG
            print("UDP motion state: \(state)")
            #endif
        }
        connection.start(queue: queue)
        startTimer()
    }

    // Receives a single touch movement delta, accumulates sub-pixel remainders to avoid rounding to zero,
    // caps extreme values, converts to Int16, and pushes the result onto the back of the subframe queue.
    func enqueueMotion(dx: CGFloat, dy: CGFloat, timestamp _: CFTimeInterval) {
        guard dx != 0 || dy != 0 else { return }

        queue.async { [weak self] in
            guard let self, !self.isCancelled else { return }
            let arrival = CACurrentMediaTime()

            // Accumlate dx dy sub-pixels, prevent rounding gives sub-pixel 0 every time, so the cursor never moves.
            self.fractionalDx += dx
            self.fractionalDy += dy

            let rawDx = self.fractionalDx.rounded()
            let rawDy = self.fractionalDy.rounded()
            let cappedDx = max(-self.maxDeltaPerFrame, min(self.maxDeltaPerFrame, rawDx))
            let cappedDy = max(-self.maxDeltaPerFrame, min(self.maxDeltaPerFrame, rawDy))
            let wasCapped = cappedDx != rawDx || cappedDy != rawDy

            self.fractionalDx -= cappedDx
            self.fractionalDy -= cappedDy

            if wasCapped {
                MovementDiagnostics.shared.recordUdpFrameCapped()
            }

            let intDx = Int16(cappedDx)
            let intDy = Int16(cappedDy)
            if intDx != 0 || intDy != 0 {
                self.queuedSubframes.append(
                    MotionSubframe(dx: intDx, dy: intDy, timestamp: arrival)
                )
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
        }
    }

    // Full teardown; stops timer and closes connection
    func cancel() {
        queue.async { [weak self] in
            guard let self, !self.isCancelled else { return }
            self.isCancelled = true
            self.timer?.cancel()
            self.timer = nil
            self.connection.cancel()
        }
    }

    // Creates and starts the DispatchSourceTimer that fires emitFrameIfNeeded every 4ms. Called once during init.
    private func startTimer() {
        let timer = DispatchSource.makeTimerSource(queue: queue)
        // repeat every frameInterval (0.004s, 250Hz)
        timer.schedule(deadline: .now() + frameInterval, repeating: frameInterval, leeway: .milliseconds(1))
        timer.setEventHandler { [weak self] in
            self?.emitFrameIfNeeded()
        }
        timer.resume()
        self.timer = timer
    }

    // fires every 0.004s, steadily empties the queue
    private func emitFrameIfNeeded() {
        guard !isCancelled else { return }

        let now = CACurrentMediaTime()
        if let lastTimerFireTimestamp {
            MovementDiagnostics.shared.recordUdpTimerInterval(now - lastTimerFireTimestamp)
        }
        lastTimerFireTimestamp = now

        pruneStaleSubframes(now: now) // Remove anything too old

        let hadInput: Bool
        if let lastInputReceiveTimestamp {
            hadInput = (now - lastInputReceiveTimestamp) <= staleInterval
        } else {
            hadInput = false
        }

        let willEmit = !queuedSubframes.isEmpty
        MovementDiagnostics.shared.recordUdpSenderTick(emitted: willEmit, hadInput: hadInput)

        if willEmit { // Send one subframe
            flushBatch()
        }

        // Stream-end bookkeeping: if input has gone stale and the queue is
        // already empty, mirror the previous behavior of marking the stream
        // closed so diagnostics can recompute idle time.
        if !willEmit, let lastInputReceiveTimestamp,
           now - lastInputReceiveTimestamp > staleInterval {
            self.lastInputReceiveTimestamp = nil
            MovementDiagnostics.shared.recordUdpStreamEnded()
        }

        recordQueueState()
    }

    // Walks the front of the queue and discards any subframe older than 32ms,
    // preventing stale input from replaying after a network blip or pause.
    private func pruneStaleSubframes(now: CFTimeInterval) {
        while let first = queuedSubframes.first,
              now - first.timestamp > staleInterval {
            queuedSubframes.removeFirst()
            MovementDiagnostics.shared.recordUdpStaleDrop(
                dx: CGFloat(first.dx),
                dy: CGFloat(first.dy)
            )
        }
    }

    // Ships at most one chunk of `maxSubframesPerDatagram` subframes per
    // tick, NOT the entire queue. This is the crucial throttle: with the
    // queue-flush "while" loop a 5-sample iOS burst was mashed back into a
    // single chunky packet, then the ESP pacer summed it into a single HID
    // report (~30 Hz cursor). One chunk per tick + maxSubframesPerDatagram=1
    // = 250 Hz packet rate during drags, which the ESP pacer can pump
    // straight through to USB without re-coalescing.
    private func flushBatch() {
        guard !queuedSubframes.isEmpty else { return }
        let take = min(queuedSubframes.count, maxSubframesPerDatagram)
        let chunk = Array(queuedSubframes.prefix(take))
        queuedSubframes.removeFirst(take)
        send(subframes: chunk)
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
            if let error {
                print("UDP motion send error: \(error)")
            }
            #endif
        })

        MovementDiagnostics.shared.recordUdpDatagramSent(subframes: subframes.count)
        for subframe in subframes {
            MovementDiagnostics.shared.recordUdpSubframeSent(dx: subframe.dx, dy: subframe.dy)
        }
    }

    // Resets all motion state (fractional accumulators + subframe queue) to zero.
    // Optionally records the total discarded movement to diagnostics if any was lost.
    private func clearMotionState(recordDrop: Bool) {
        let droppedDx = fractionalDx + queuedSubframes.reduce(CGFloat(0)) { $0 + CGFloat($1.dx) }
        let droppedDy = fractionalDy + queuedSubframes.reduce(CGFloat(0)) { $0 + CGFloat($1.dy) }
        fractionalDx = 0
        fractionalDy = 0
        queuedSubframes.removeAll()

        if recordDrop && (droppedDx != 0 || droppedDy != 0) {
            MovementDiagnostics.shared.recordUdpStaleDrop(dx: droppedDx, dy: droppedDy)
        }
        MovementDiagnostics.shared.recordUdpStreamEnded()
        recordQueueState()
    }

    // Snapshots the current queue length and total pending dx/dy (including fractional remainder)
    // and forwards it to MovementDiagnostics for Monitoring.
    private func recordQueueState() {
        let queuedDx = queuedSubframes.reduce(CGFloat(0)) { $0 + CGFloat($1.dx) }
        let queuedDy = queuedSubframes.reduce(CGFloat(0)) { $0 + CGFloat($1.dy) }
        MovementDiagnostics.shared.recordUdpSchedulerState(
            queuedFrames: queuedSubframes.count,
            pendingDx: queuedDx + fractionalDx,
            pendingDy: queuedDy + fractionalDy
        )
    }
}
