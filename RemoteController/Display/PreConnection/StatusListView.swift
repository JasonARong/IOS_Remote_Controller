//
//  StatusListView.swift
//  UITest
//
//  Created by 陈皆成 on 2025/12/26.
//

import SwiftUI
import Combine

// MARK: - Animated status list controller (mutation helpers)

struct StatusListLayout: Equatable {
    var itemHeight: CGFloat = PreConnectionLayout.statusRowHeight
    var itemGap: CGFloat = PreConnectionLayout.statusRowGap
    var bottomMargin: CGFloat = PreConnectionLayout.statusListBottomMargin
    var listWidth: CGFloat = PreConnectionLayout.statusListWidth
    var listHeight: CGFloat = PreConnectionLayout.statusListHeight
    var removalLeeway: CGFloat = PreConnectionLayout.removalLeeway
}

struct StatusListAnimationConfig: Equatable {
    var fadeInDuration: Double = 0.2
    var pushDownDuration: Double = 0.3
    var fadeIn: Animation { .easeInOut(duration: fadeInDuration) }
    var pushDown: Animation { .easeInOut(duration: pushDownDuration) }
}

@MainActor
final class StatusListController: ObservableObject {
    struct AnimatedItem: Identifiable, Equatable {
        let id: UUID
        let item: StatusItem
        var yPosition: CGFloat
        var opacity: Double
    }

    @Published private(set) var items: [AnimatedItem] = []
    @Published private(set) var isBusy: Bool = false

    var layout: StatusListLayout
    var animation: StatusListAnimationConfig

    private var queue: [StatusItem] = []
    /// All IDs the controller has ever accepted since last reset (visible or pruned).
    private var seenIDs: Set<UUID> = []
    private var drainTask: Task<Void, Never>?

    convenience init() {
        self.init(layout: StatusListLayout(), animation: StatusListAnimationConfig())
    }

    init(layout: StatusListLayout, animation: StatusListAnimationConfig) {
        self.layout = layout
        self.animation = animation
    }

    /// Enqueue a single new status item (newest-first).
    /// If you call this repeatedly, items will be animated sequentially and deterministically.
    func enqueue(_ item: StatusItem) {
        guard !seenIDs.contains(item.id) else { return }
        seenIDs.insert(item.id)
        queue.append(item)
        startDrainIfNeeded()
    }

    /// Reset the visible list to a snapshot (newest-first) without animation.
    /// Use this on view appear / when the upstream model is replaced wholesale.
    func reset(to desiredNewestFirst: [StatusItem]) {
        drainTask?.cancel()
        drainTask = nil
        queue.removeAll()
        isBusy = false

        // Keep only the newest items that can fit the viewport so future math stays stable.
        let newestThatFit = takeNewestThatFit(desiredNewestFirst)
        seenIDs = Set(newestThatFit.map(\.id))
        items = buildAnimatedItems(fromNewestFirst: newestThatFit)
    }

    /// Replace all items with a new list, fading out old items and fading in new items.
    func replaceAll(with desiredNewestFirst: [StatusItem]) {
        drainTask?.cancel()
        drainTask = nil
        queue.removeAll()
        isBusy = true

        // Fade out all existing items
        withAnimation(animation.fadeIn) {
            for idx in items.indices {
                items[idx].opacity = 0
            }
        }

        // After fade-out completes, remove old items and fade in new ones
        DispatchQueue.main.asyncAfter(deadline: .now() + animation.fadeInDuration) {
            // Keep only the newest items that can fit the viewport
            let newestThatFit = self.takeNewestThatFit(desiredNewestFirst)
            self.seenIDs = Set(newestThatFit.map(\.id))
            
            // Build new items at opacity 0
            let newAnimatedItems = self.buildAnimatedItems(fromNewestFirst: newestThatFit)
            self.items = newAnimatedItems.map { item in
                var modified = item
                modified.opacity = 0
                return modified
            }
            
            // Fade in new items
            withAnimation(self.animation.fadeIn) {
                for idx in self.items.indices {
                    self.items[idx].opacity = 1
                }
            }
            
            self.isBusy = false
        }
    }

    func removeLast() {
        guard !items.isEmpty else { return }

        guard let lastIndex = items.indices.max(by: { items[$0].yPosition < items[$1].yPosition }) else {
            return
        }
        let lastItemId = items[lastIndex].id

        withAnimation(animation.fadeIn) {
            if let index = items.firstIndex(where: { $0.id == lastItemId }) {
                items[index].opacity = 0
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + animation.fadeInDuration) {
            self.items.removeAll { $0.id == lastItemId }
            self.startDrainIfNeeded()
        }
    }

    /// Replace a specific item with a new item in-place (no position shifts).
    /// The old item fades out while the new item fades in at the same position.
    func replaceItem(oldId: UUID, with newItem: StatusItem) {
        guard !seenIDs.contains(newItem.id) else { return }
        seenIDs.insert(newItem.id)
        
        guard let oldIndex = items.firstIndex(where: { $0.id == oldId }) else {
            // Old item not found, just add the new one
            enqueue(newItem)
            return
        }

        let oldPosition = items[oldIndex].yPosition

        // Start fading out the old item
        withAnimation(animation.fadeIn) {
            items[oldIndex].opacity = 0
        }

        // Add new item at the same position with fade-in
        items.append(.init(id: newItem.id, item: newItem, yPosition: oldPosition, opacity: 0))
        withAnimation(animation.fadeIn.delay(0.05)) {
            if let index = items.firstIndex(where: { $0.id == newItem.id }) {
                items[index].opacity = 1
            }
        }

        // Remove the old item after fade-out completes
        DispatchQueue.main.asyncAfter(deadline: .now() + animation.fadeInDuration) {
            self.items.removeAll { $0.id == oldId }
        }
    }

    /// Replace the oldest (bottom-most) item with a new item.
    /// The new item appears at the top while the old item fades out at the bottom,
    /// and all other items shift down to fill the gap.
    func replaceOldest(with newItem: StatusItem) {
        guard !seenIDs.contains(newItem.id) else { return }
        seenIDs.insert(newItem.id)
        
        guard !items.isEmpty else {
            // No items to replace, just add the new one
            enqueue(newItem)
            return
        }

        // Find the bottom-most item
        guard let lastIndex = items.indices.max(by: { items[$0].yPosition < items[$1].yPosition }) else {
            enqueue(newItem)
            return
        }
        let lastItemId = items[lastIndex].id
        let delta = layout.itemHeight + layout.itemGap
        let currentTop = items.map(\.yPosition).max() ?? -delta

        // Start fading out the bottom item
        withAnimation(animation.fadeIn) {
            if let index = items.firstIndex(where: { $0.id == lastItemId }) {
                items[index].opacity = 0
            }
        }

        // Push all items down to fill the gap
        withAnimation(animation.pushDown) {
            for idx in items.indices where items[idx].id != lastItemId {
                items[idx].yPosition -= delta
            }
        }

        // Add new item at the top position with fade-in
        items.append(.init(id: newItem.id, item: newItem, yPosition: currentTop, opacity: 0))
        withAnimation(animation.fadeIn.delay(0.05)) {
            if let index = items.firstIndex(where: { $0.id == newItem.id }) {
                items[index].opacity = 1
            }
        }

        // Remove the old item after fade-out completes
        DispatchQueue.main.asyncAfter(deadline: .now() + animation.fadeInDuration) {
            self.items.removeAll { $0.id == lastItemId }
            self.pruneOffscreen()
        }
    }

    // MARK: - Internals

    private func startDrainIfNeeded() {
        guard drainTask == nil else { return }
        isBusy = true
        drainTask = Task { [weak self] in
            await self?.drainQueue()
        }
    }

    private func drainQueue() async {
        defer {
            Task { @MainActor in
                self.isBusy = false
                self.drainTask = nil
            }
        }

        while !Task.isCancelled, !queue.isEmpty {
            let next = queue.removeFirst()
            await addOneAnimated(next)
        }
    }

    private func addOneAnimated(_ item: StatusItem) async {
        let delta = layout.itemHeight + layout.itemGap
        let currentTop = items.map(\.yPosition).max() ?? -delta
        let candidateY = currentTop + delta
        let hasRoom = candidateY + layout.itemHeight + layout.bottomMargin <= layout.listHeight

        if hasRoom {
            items.append(.init(id: item.id, item: item, yPosition: candidateY, opacity: 0))
            // Let SwiftUI render the inserted view at opacity 0 first,
            // then animate to 1 in the next transaction.
            await Task.yield()
            withAnimation(animation.fadeIn) { setOpacity(id: item.id, to: 1) }
            try? await Task.sleep(nanoseconds: UInt64(animation.fadeInDuration * 1_000_000_000))
        } else {
            // Push existing down
            withAnimation(animation.pushDown) {
                for idx in items.indices { items[idx].yPosition -= delta }
            }
            try? await Task.sleep(nanoseconds: UInt64(animation.pushDownDuration * 1_000_000_000))

            pruneOffscreen()

            // Insert at the previous top slot (so it always appears where you expect)
            items.append(.init(id: item.id, item: item, yPosition: currentTop, opacity: 0))
            // Same as above: ensure the "opacity 0" frame is committed before animating.
            await Task.yield()
            withAnimation(animation.fadeIn) { setOpacity(id: item.id, to: 1) }
            try? await Task.sleep(nanoseconds: UInt64(animation.fadeInDuration * 1_000_000_000))
        }
    }

    private func setOpacity(id: UUID, to value: Double) {
        guard let index = items.firstIndex(where: { $0.id == id }) else { return }
        items[index].opacity = value
    }

    private func pruneOffscreen() {
        // yPosition is defined relative to the list's bottom baseline (before bottomMargin offset).
        // Negative yPosition means the row is below the baseline and clipped.
        let threshold = -layout.removalLeeway
        items.removeAll { $0.yPosition <= threshold }
    }

    private func takeNewestThatFit(_ newestFirst: [StatusItem]) -> [StatusItem] {
        var accepted: [StatusItem] = []
        var currentTop: CGFloat = -(layout.itemHeight + layout.itemGap)
        for item in newestFirst.reversed() { // oldest -> newest
            let nextY = currentTop + (layout.itemHeight + layout.itemGap)
            if nextY + layout.itemHeight + layout.bottomMargin > layout.listHeight { break }
            accepted.append(item)
            currentTop = nextY
        }
        // accepted is oldest->newest; convert back to newest-first
        return accepted.reversed()
    }

    private func buildAnimatedItems(fromNewestFirst newestFirst: [StatusItem]) -> [AnimatedItem] {
        var rebuilt: [AnimatedItem] = []
        var currentTop: CGFloat = -(layout.itemHeight + layout.itemGap)
        for item in newestFirst.reversed() { // oldest -> newest
            currentTop += (layout.itemHeight + layout.itemGap)
            rebuilt.append(.init(id: item.id, item: item, yPosition: currentTop, opacity: 1))
        }
        return rebuilt
    }
}

// MARK: - Animated status list view (render-only)

struct StatusListView: View {
    @ObservedObject var controller: StatusListController

    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .bottom) {
                ForEach(controller.items) { animated in
                    StatusRowView(item: animated.item)
                        .frame(
                            width: controller.layout.listWidth - 2,
                            height: controller.layout.itemHeight,
                            alignment: .leading
                        )
                        .offset(y: -(animated.yPosition + controller.layout.bottomMargin))
                        .opacity(animated.opacity)
                }
            }
            .frame(width: controller.layout.listWidth, height: controller.layout.listHeight, alignment: .bottom)
            .clipped()
        }
        .frame(width: controller.layout.listWidth, height: controller.layout.listHeight, alignment: .bottom)
    }
}

#Preview("StatusListView - Interactive") {
    struct Demo: View {
        @StateObject private var controller = StatusListController()
        @State private var next = 0

        private let samples: [StatusItem] = [
            .init(text: "Bluetooth is OFF", type: .info),
            .init(text: "Bluetooth is Unauthorized", type: .info),
            .init(text: "Bluetooth is ON", type: .success),
            .init(text: "Found ESP Dongle", type: .success),
            .init(text: "Connected to ESP", type: .success),
            .init(text: "Connection Error", type: .error),
        ]

        var body: some View {
            VStack(spacing: 12) {
                StatusListView(controller: controller)
                    .background(Color.black)

                HStack {
                    Button("Add") {
                        controller.enqueue(samples[next % samples.count])
                        next += 1
                    }
                    Button("Remove") { controller.removeLast() }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(Color.black)
        }
    }

    return Demo()
}
