//
//  StatusRowView.swift
//  UITest
//

import SwiftUI

struct StatusRowView: View {
    let item: StatusItem

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(systemName: iconName)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(iconColor)

            Text(item.text)
                .font(.custom("Jersey 20", size: 14))
                .foregroundColor(.white)
        }
    }

    private var iconName: String {
        switch item.type {
        case .success:
            return "checkmark.circle.fill"
        case .info, .error:
            return "info.circle.fill"
        }
    }

    private var iconColor: Color {
        switch item.type {
        case .success:
            return Color.displayGreen
        case .info:
            return Color.displayBlue
        case .error:
            return Color.displayRed
        }
    }
}

#Preview("StatusRowView") {
    VStack(alignment: .leading, spacing: 8) {
        StatusRowView(item: .init(text: "Bluetooth is OFF", type: .info))
        StatusRowView(item: .init(text: "Found ESP Dongle", type: .success))
        StatusRowView(item: .init(text: "Connection Error", type: .error))
    }
    .padding()
    .background(Color.black)
}

