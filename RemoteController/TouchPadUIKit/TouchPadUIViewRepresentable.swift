//
//  TouchPadUIViewRepresentable.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/26.
//

import Foundation
import SwiftUI
import UIKit

// Translation layar between the TouchPadUIView (UIKit) and TouchPadView (SwiftUI)
// UIViewRepresentable: display a UIKit UIView inside SwiftUI view hierarchy
struct TouchPadUIViewRepresentable: UIViewRepresentable {
    var onTouchesChanged: (Set<UITouch>, UIEvent?) -> Void
    var onTouchesEnded:   (Set<UITouch>, UIEvent?) -> Void
    
    // Lifecycle: called by SwiftUI to render the UIView for the first time
    func makeUIView(context: Context) -> TouchPadUIView {
        let view = TouchPadUIView()
        view.onTouchesChanged = self.onTouchesChanged
        view.onTouchesEnded = self.onTouchesEnded
        view.isMultipleTouchEnabled = true
        
        return view
    }
    
    // Lifecycle: called by SwiftUI to update the UIView
    func updateUIView(_ uiView: TouchPadUIView, context: Context) {}
}
