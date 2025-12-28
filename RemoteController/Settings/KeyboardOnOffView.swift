//
//  KeyboardOnOffView.swift
//  UITest
//
//  Created by 陈皆成 on 2025/12/27.
//

import SwiftUI

struct KeyboardOnOffView: View {
    let model: KeyboardOnOffViewModel
    
    init(model: KeyboardOnOffViewModel) {
        self.model = model
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("KEYBOARD")
                .font(.custom("Pixelify Sans", size: 24))
                .foregroundColor(.white)
            
            HStack{
                if model.isKeyboardOn {
                    Text("ON")
                        .font(.custom("Jersey 15", size: 32))
                        .frame(width: 53, height: 53)
                        .foregroundColor(Color.displayGreen)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.buttonGray)
                        )
                } else {
                    Text("OFF")
                        .font(.custom("Jersey 15", size: 32))
                        .frame(width: 53, height: 53)
                        .foregroundColor(Color.displayRed)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.buttonGray)
                        )
                }
                
                VStack (alignment: .leading) {
                    
                    // Static Tag
                    Text("INFO")
                        .font(.custom("Jersey 20", size: 12))
                        .foregroundColor(Color.displayBlue)
                        .padding(.vertical, 2)
                        .padding(.horizontal, 4)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .strokeBorder(Color.displayBlue, lineWidth: 1.5)
                        )
                    Text("Keyboard Mode")
                        .font(.custom("Jersey 15", size: 16))
                        .foregroundColor(.white)
                        .opacity(0.6)
                    Text(model.isKeyboardOn ? "Enabled" : "Disabled")
                        .font(.custom("Jersey 15", size: 16))
                        .foregroundColor(.white)
                        .opacity(0.6)
                }
                
            }
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        KeyboardOnOffView(model: .init(isKeyboardOn: true))
        KeyboardOnOffView(model: .init(isKeyboardOn: false))
    }
    .padding()
    .background(Color.black)
}
