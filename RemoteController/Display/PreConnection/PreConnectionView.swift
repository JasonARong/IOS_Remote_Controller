//
//  PreConnectionView.swift
//  UITest
//
//  Created by 陈皆成 on 2025/12/25.
//

import SwiftUI

struct PreConnectionView: View {
    let model: PreConnectionViewModel
    @StateObject private var statusListController: StatusListController
    @State private var lastSnapshotIDs: Set<UUID> = []

    init(model: PreConnectionViewModel) {
        self.model = model
        _statusListController = StateObject(wrappedValue: StatusListController())
    }
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 0) {
                // Connection Status
                Text(model.status.rawValue)
                    .font(.custom("Pixelify Sans", size: 24))
                    .foregroundColor(.white)
                
                // Push the list to the bottom of the card content.
                Spacer(minLength: 0)
                
                StatusListView(controller: statusListController)
                    .frame(
                        width: PreConnectionLayout.statusListWidth,
                        height: PreConnectionLayout.statusListHeight,
                        alignment: .leading
                    )
            }
            
            if let tip = model.tip {
                Text(tip.text)
                    .font(.custom("Jersey 20", size: 14))
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: PreConnectionLayout.statusListWidth, alignment: .leading)
                    .offset(y: -10)
            }
        }
        .onAppear {
            lastSnapshotIDs = Set(model.statusItems.map(\.id))
            statusListController.reset(to: model.statusItems)
        }
        .onChange(of: model.statusItems) { _, newValue in
            let newIDs = Set(newValue.map(\.id))

            // If the upstream snapshot is not an incremental add, do a hard reset.
            // This makes the animation pipeline extremely stable under view rebuilds / style changes.
            let removed = lastSnapshotIDs.subtracting(newIDs)
            let added = newIDs.subtracting(lastSnapshotIDs)

            // Special case: entire list replaced (all old items removed, new items added with no overlap)
            // This happens when error type replaces the entire list
            if !removed.isEmpty && !added.isEmpty && removed.count == lastSnapshotIDs.count && newIDs.isDisjoint(with: lastSnapshotIDs) {
                statusListController.replaceAll(with: newValue)
                lastSnapshotIDs = newIDs
                return
            }

            // Special case: removed 1 + added 1 = replace animation
            if removed.count == 1 && added.count == 1 {
                if let newItem = newValue.first(where: { added.contains($0.id) }),
                   let oldId = removed.first {
                    statusListController.replaceItem(oldId: oldId, with: newItem)
                }
                lastSnapshotIDs = newIDs
                return
            }

            if !removed.isEmpty || added.count != 1 {
                lastSnapshotIDs = newIDs
                statusListController.reset(to: newValue)
                return
            }

            // Exactly one new item was added — animate that one.
            if let newItem = newValue.first(where: { added.contains($0.id) }) {
                statusListController.enqueue(newItem)
            }
            lastSnapshotIDs = newIDs
        }
    }
}

#Preview {
    PreConnectionView(model: .init(
        status: .disconnected,
        tip: .enableBluetooth,
        statusItems: [
            .init(text: "Bluetooth is OFF", type: .info),
            .init(text: "Bluetooth is Unauthorized", type: .info),
            .init(text: "Bluetooth is ON", type: .success),
            .init(text: "Connection Error", type: .error),
        ]
    ))
    .padding()
    .frame(width: 204, height: 140, alignment: .topLeading)
    .background(DisplayCardBackground())
    .background(Color.black)
}
