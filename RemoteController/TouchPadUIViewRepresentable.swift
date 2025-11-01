//
//  TouchPadUIViewRepresentable.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/26.
//

import Foundation
import SwiftUI
import UIKit

struct TouchPadUIViewRepresentable: UIViewRepresentable {
    var onTouchesChanged: (Set<UITouch>, UIEvent?) -> Void
    var onTouchesEnded:   (Set<UITouch>, UIEvent?) -> Void
    
    func makeUIView(context: Context) -> TouchPadUIView {
        let view = TouchPadUIView()
        view.onTouchesChanged = self.onTouchesChanged
        view.onTouchesEnded = self.onTouchesEnded
        view.isMultipleTouchEnabled = true
        
        return view
    }
    
    func updateUIView(_ uiView: TouchPadUIView, context: Context) {}
}
