//
//  TouchPadUIView.swift
//  RemoteController
//
//  Created by Jason Chen on 2025/10/26.
//

import Foundation
import UIKit

final class TouchPadUIView: UIView {
    // Callbacks for SwiftUI layer
    var onTouchesChanged: ( (Set<UITouch>, UIEvent?)->Void )?
    var onTouchesEnded:   ( (Set<UITouch>, UIEvent?)->Void )?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isMultipleTouchEnabled = true
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Touch Handlers
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        onTouchesChanged?(touches, event)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        onTouchesChanged?(touches, event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        onTouchesEnded?(touches, event)
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        onTouchesEnded?(touches, event)
    }
}
