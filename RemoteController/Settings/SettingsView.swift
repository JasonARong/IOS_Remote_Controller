//
//  SettingsView.swift
//  UITest
//
//  Created by 陈皆成 on 2025/12/27.
//

import SwiftUI

struct SettingsView: View {
    let model: SettingsViewModel
    
    init(model: SettingsViewModel) {
        self.model = model
    }
    
    var body: some View {
        switch model.viewType {
        case .keyboardOnOff:
            KeyboardOnOffView(model: model.keyboardOnOff)
        }
    }
}

#Preview {
    VStack (alignment: .leading, spacing: 0) {
        Text("SETTINGS")
            .font(.custom("Pixelify Sans", size: 13))
            .foregroundColor(.white)
        
        SettingsView(model: .init(
            viewType: .keyboardOnOff,
            keyboardOnOff: .init(isKeyboardOn: true)
        ))
    }
    .padding(EdgeInsets(top: 14, leading: 10, bottom: 0, trailing: 10))
    .frame(width: 204, height: 140, alignment: .topLeading)
    .background(DisplayCardBackground())
    .clipped()
}
