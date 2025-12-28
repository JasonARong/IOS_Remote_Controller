//
//  KeyboardView.swift
//  RemoteController
//
//  Created by 陈皆成 on 2025/12/27.
//

import SwiftUI


enum KeyboardLayer {
    case letters
    case numbersAndBasic
    case moreSymbols
}

/// What your SwiftUI keyboard view sends to the VM when a key is tapped.
enum KeyboardKey {
    case letter(Character)          // 'a'...'z'
    case digit(Character)           // '0'...'9'
    case symbol(Character)          // '-', '@', '{', etc.
    case space
    case backspace
    case returnKey
    case shiftToggle
    case switchLayer(KeyboardLayer)
}


enum KeyboardMode {
    case letters
    case numbers
    case symbols
}

enum ShiftMode {
    case normal
    case temporary
    case alwaysOn
}

// MARK: - Keyboard Styling

struct KeyboardStyle {
    // MARK: - Layout Spacing
    static let rowSpacing: CGFloat = 6                    // Spacing between keys in a row
    static let verticalSpacing: CGFloat = 12              // Spacing between keyboard rows
    static let horizontalPadding: CGFloat = 3              // Horizontal padding around keyboard
    static let verticalPadding: CGFloat = 6                // Vertical padding around keyboard
    static let letterRowIndent: CGFloat = 19               // Indent for second row of letters
    static let specialButtonSpacing: CGFloat = 12          // Spacing between special buttons and regular keys in row 3
    static let bottomRowButtonSpacing: CGFloat = 6          // Spacing between buttons in bottom row
    
    // MARK: - Button Dimensions
    static let keyHeight: CGFloat = 42                     // Height of all buttons
    static let buttonCornerRadius: CGFloat = 5              // Corner radius for all buttons
    static let thirdRowSpecialButtonWidth: CGFloat = 42     // Width of special buttons in row 3
    static let modeSwitchButtonWidth: CGFloat = 90          // Width of mode switch buttons in row 4
    static let returnButtonWidth: CGFloat = 90              // Width of return button in row 4
    
    // MARK: - Key Button Styles (letter/number/symbol keys)
    struct KeyButton {
        static let fontSize: CGFloat = 22                   // Font size for key button text
        static let fontWeight: Font.Weight = .regular       // Font weight for key button text
        static let fillColorNormal: CGFloat = 0.40          // Background fill color (normal state) - lighter
        static let fillColorPressed: CGFloat = 0.35         // Background fill color (pressed state) - lighter
    }
    
    // MARK: - Special Button Styles (shift, delete, mode switch, return)
    struct SpecialButton {
        static let fontSize: CGFloat = 16                    // Font size for special button text
        static let iconFontSize: CGFloat = 20               // Font size for special button icons
        static let fontWeight: Font.Weight = .regular       // Font weight for special button text/icons
        static let fillColorNormal: CGFloat = 0.25          // Background fill color (normal state) - darker
        static let fillColorPressed: CGFloat = 0.3          // Background fill color (pressed state) - darker
        static let fillColorActive: CGFloat = 0.35          // Background fill color (active state, e.g. shift always on)
    }
}

struct KeyboardView: View {
    @ObservedObject var viewModel: KeyboardViewModel
    
    @State private var keyboardMode: KeyboardMode = .letters
    @State private var shiftMode: ShiftMode = .normal
    @State private var lastShiftTapTime: Date = Date()
    
    init(viewModel: KeyboardViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            keyboardContent
        }
        .onChange(of: viewModel.currentLayer) { newLayer in
            // Sync view model layer to view mode
            switch newLayer {
            case .letters:
                keyboardMode = .letters
            case .numbersAndBasic:
                keyboardMode = .numbers
            case .moreSymbols:
                keyboardMode = .symbols
            }
        }
        .onChange(of: viewModel.isShiftAlwaysOn) { newValue in
            // Sync view model shift state to view shift mode
            if newValue {
                shiftMode = .alwaysOn
            } else if shiftMode == .alwaysOn {
                shiftMode = .normal
            }
        }
    }
    
    @ViewBuilder
    private var keyboardContent: some View {
        switch keyboardMode {
        case .letters:
            lettersKeyboard
        case .numbers:
            numbersKeyboard
        case .symbols:
            symbolsKeyboard
        }
    }
    
    // MARK: - Letters Keyboard
    
    private var lettersKeyboard: some View {
        VStack(spacing: KeyboardStyle.verticalSpacing) {
            letterRow1
            letterRow2
            letterRow3
            letterRow4
        }
        .padding(.horizontal, KeyboardStyle.horizontalPadding)
        .padding(.vertical, KeyboardStyle.verticalPadding)
    }
    
    private var letterRow1: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            ForEach(["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"], id: \.self) { key in
                KeyButton(
                    title: getLetterTitle(key),
                    action: { handleLetterKey(key) }
                )
            }
        }
    }
    
    private var letterRow2: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            Spacer().frame(width: KeyboardStyle.letterRowIndent)
            ForEach(["a", "s", "d", "f", "g", "h", "j", "k", "l"], id: \.self) { key in
                KeyButton(
                    title: getLetterTitle(key),
                    action: { handleLetterKey(key) }
                )
            }
            Spacer().frame(width: KeyboardStyle.letterRowIndent)
        }
    }
    
    private var letterRow3: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            ShiftButton(shiftMode: shiftMode) {
                handleShiftTap()
            }
            
            Spacer().frame(width: KeyboardStyle.specialButtonSpacing)
            
            ForEach(["z", "x", "c", "v", "b", "n", "m"], id: \.self) { key in
                KeyButton(
                    title: getLetterTitle(key),
                    action: { handleLetterKey(key) }
                )
            }
            
            Spacer().frame(width: KeyboardStyle.specialButtonSpacing)
            
            BackspaceButton {
                viewModel.handleKeyTap(.backspace)
            }
        }
    }
    
    private var letterRow4: some View {
        HStack(spacing: KeyboardStyle.bottomRowButtonSpacing) {
            ModeSwitchButton(title: "123", width: KeyboardStyle.modeSwitchButtonWidth) {
                keyboardMode = .numbers
                shiftMode = .normal
                viewModel.handleKeyTap(.switchLayer(.numbersAndBasic))
            }
            
            SpaceButton {
                viewModel.handleKeyTap(.space)
            }
            
            ReturnButton {
                viewModel.handleKeyTap(.returnKey)
            }
        }
    }
    
    // MARK: - Numbers Keyboard
    
    private var numbersKeyboard: some View {
        VStack(spacing: KeyboardStyle.verticalSpacing) {
            numberRow1
            numberRow2
            numberRow3
            numberRow4
        }
        .padding(.horizontal, KeyboardStyle.horizontalPadding)
        .padding(.vertical, KeyboardStyle.verticalPadding)
    }
    
    private var numberRow1: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            ForEach(["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"], id: \.self) { key in
                KeyButton(title: key) {
                    if let char = key.first {
                        viewModel.handleKeyTap(.digit(char))
                    }
                }
            }
        }
    }
    
    private var numberRow2: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            ForEach(["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""], id: \.self) { key in
                KeyButton(title: key) {
                    if let char = key.first {
                        viewModel.handleKeyTap(.symbol(char))
                    }
                }
            }
        }
    }
    
    private var numberRow3: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            ModeSwitchButton(title: "#+=", width: KeyboardStyle.thirdRowSpecialButtonWidth) {
                keyboardMode = .symbols
                shiftMode = .normal
                viewModel.handleKeyTap(.switchLayer(.moreSymbols))
            }
            
            Spacer().frame(width: KeyboardStyle.specialButtonSpacing)
            
            ForEach([".", ",", "?", "!", "'"], id: \.self) { key in
                KeyButton(title: key) {
                    if let char = key.first {
                        viewModel.handleKeyTap(.symbol(char))
                    }
                }
            }
            
            Spacer().frame(width: KeyboardStyle.specialButtonSpacing)
            
            BackspaceButton {
                viewModel.handleKeyTap(.backspace)
            }
        }
    }
    
    private var numberRow4: some View {
        HStack(spacing: KeyboardStyle.bottomRowButtonSpacing) {
            ModeSwitchButton(title: "ABC", width: KeyboardStyle.modeSwitchButtonWidth) {
                keyboardMode = .letters
                shiftMode = .normal
                viewModel.handleKeyTap(.switchLayer(.letters))
            }
            
            SpaceButton {
                viewModel.handleKeyTap(.space)
            }
            
            ReturnButton {
                viewModel.handleKeyTap(.returnKey)
            }
        }
    }
    
    // MARK: - Symbols Keyboard
    
    private var symbolsKeyboard: some View {
        VStack(spacing: KeyboardStyle.verticalSpacing) {
            symbolRow1
            symbolRow2
            symbolRow3
            symbolRow4
        }
        .padding(.horizontal, KeyboardStyle.horizontalPadding)
        .padding(.vertical, KeyboardStyle.verticalPadding)
    }
    
    private var symbolRow1: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            ForEach(["[", "]", "{", "}", "#", "%", "^", "*", "+", "="], id: \.self) { key in
                KeyButton(title: key) {
                    if let char = key.first {
                        viewModel.handleKeyTap(.symbol(char))
                    }
                }
            }
        }
    }
    
    private var symbolRow2: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            ForEach(["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "."], id: \.self) { key in
                KeyButton(title: key) {
                    if let char = key.first {
                        viewModel.handleKeyTap(.symbol(char))
                    }
                }
            }
        }
    }
    
    private var symbolRow3: some View {
        HStack(spacing: KeyboardStyle.rowSpacing) {
            ModeSwitchButton(title: "123", width: KeyboardStyle.thirdRowSpecialButtonWidth) {
                keyboardMode = .numbers
                shiftMode = .normal
                viewModel.handleKeyTap(.switchLayer(.numbersAndBasic))
            }
            
            Spacer().frame(width: KeyboardStyle.specialButtonSpacing)
            
            ForEach([".", ",", "?", "!", "'"], id: \.self) { key in
                KeyButton(title: key) {
                    if let char = key.first {
                        viewModel.handleKeyTap(.symbol(char))
                    }
                }
            }
            
            Spacer().frame(width: KeyboardStyle.specialButtonSpacing)
            
            BackspaceButton {
                viewModel.handleKeyTap(.backspace)
            }
        }
    }
    
    private var symbolRow4: some View {
        HStack(spacing: KeyboardStyle.bottomRowButtonSpacing) {
            ModeSwitchButton(title: "ABC", width: KeyboardStyle.modeSwitchButtonWidth) {
                keyboardMode = .letters
                shiftMode = .normal
                viewModel.handleKeyTap(.switchLayer(.letters))
            }
            
            SpaceButton {
                viewModel.handleKeyTap(.space)
            }
            
            ReturnButton {
                viewModel.handleKeyTap(.returnKey)
            }
        }
    }
    
    // MARK: - Helpers
    
    private func getLetterTitle(_ key: String) -> String {
        shiftMode != .normal ? key.uppercased() : key
    }
    
    private func handleShiftTap() {
        let now = Date()
        let timeSinceLastTap = now.timeIntervalSince(lastShiftTapTime)
        
        if timeSinceLastTap < 0.3 {
            // Double tap - toggle always on mode
            shiftMode = shiftMode == .alwaysOn ? .normal : .alwaysOn
            viewModel.handleKeyTap(.shiftToggle)  // This toggles isShiftAlwaysOn in view model
        } else {
            // Single tap - temporary shift (only if not already always on)
            if shiftMode == .alwaysOn {
                // If currently always on, turn it off
                shiftMode = .normal
                viewModel.handleKeyTap(.shiftToggle)  // Toggle off always-on mode
            } else {
                // Otherwise, set temporary shift
                shiftMode = .temporary
                viewModel.applyTemporaryShift()
            }
        }
        
        lastShiftTapTime = now
    }
    
    private func handleLetterKey(_ key: String) {
        // Apply shift state to view model before sending
        if shiftMode == .temporary {
            viewModel.applyTemporaryShift()
        } else if shiftMode == .alwaysOn {
            viewModel.isShiftAlwaysOn = true
            viewModel.isShiftOn = true
        } else {
            viewModel.isShiftOn = false
        }
        
        // Always send lowercase - view model will handle shift
        if let char = key.lowercased().first {
            viewModel.handleKeyTap(.letter(char))
        }
        
        // Clear temporary shift after typing
        if shiftMode == .temporary {
            shiftMode = .normal
            viewModel.clearTemporaryShift()
        }
    }
}

// MARK: - Key Button Component

struct KeyButton: View {
    let title: String
    let action: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: KeyboardStyle.KeyButton.fontSize, weight: KeyboardStyle.KeyButton.fontWeight))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: KeyboardStyle.keyHeight)
                .background(
                    RoundedRectangle(cornerRadius: KeyboardStyle.buttonCornerRadius)
                        .fill(isPressed ? Color(white: KeyboardStyle.KeyButton.fillColorPressed) : Color(white: KeyboardStyle.KeyButton.fillColorNormal))
                )
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(pressGesture)
        .drawingGroup() // Optimize rendering for individual buttons
    }
    
    private var pressGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if !isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
            }
            .onEnded { _ in
                if isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
            }
    }
}

// MARK: - Special Buttons

struct ShiftButton: View {
    let shiftMode: ShiftMode
    let action: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            Image(systemName: shiftMode == .alwaysOn ? "shift.fill" : "shift")
                .font(.system(size: KeyboardStyle.SpecialButton.iconFontSize, weight: KeyboardStyle.SpecialButton.fontWeight))
                .foregroundColor(.white)
                .frame(width: KeyboardStyle.thirdRowSpecialButtonWidth, height: KeyboardStyle.keyHeight)
                .background(
                    RoundedRectangle(cornerRadius: KeyboardStyle.buttonCornerRadius)
                        .fill(buttonColor)
                )
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(pressGesture)
        .drawingGroup() // Optimize rendering
    }
    
    private var buttonColor: Color {
        if isPressed {
            return Color(white: KeyboardStyle.SpecialButton.fillColorPressed)
        } else if shiftMode == .alwaysOn {
            return Color(white: KeyboardStyle.SpecialButton.fillColorActive)
        } else {
            return Color(white: KeyboardStyle.SpecialButton.fillColorNormal)
        }
    }
    
    private var pressGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if !isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
            }
            .onEnded { _ in
                if isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
            }
    }
}

struct BackspaceButton: View {
    let action: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "delete.left")
                .font(.system(size: KeyboardStyle.SpecialButton.iconFontSize, weight: KeyboardStyle.SpecialButton.fontWeight))
                .foregroundColor(.white)
                .frame(width: KeyboardStyle.thirdRowSpecialButtonWidth, height: KeyboardStyle.keyHeight)
                .background(
                    RoundedRectangle(cornerRadius: KeyboardStyle.buttonCornerRadius)
                        .fill(isPressed ? Color(white: KeyboardStyle.SpecialButton.fillColorPressed) : Color(white: KeyboardStyle.SpecialButton.fillColorNormal))
                )
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(pressGesture)
        .drawingGroup() // Optimize rendering
    }
    
    private var pressGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if !isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
            }
            .onEnded { _ in
                if isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
            }
    }
}

struct ModeSwitchButton: View {
    let title: String
    let action: () -> Void
    let width: CGFloat
    @State private var isPressed = false
    
    init(title: String, width: CGFloat = 50, action: @escaping () -> Void) {
        self.title = title
        self.width = width
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: KeyboardStyle.SpecialButton.fontSize, weight: KeyboardStyle.SpecialButton.fontWeight))
                .foregroundColor(.white)
                .frame(width: width, height: KeyboardStyle.keyHeight)
                .background(
                    RoundedRectangle(cornerRadius: KeyboardStyle.buttonCornerRadius)
                        .fill(isPressed ? Color(white: KeyboardStyle.SpecialButton.fillColorPressed) : Color(white: KeyboardStyle.SpecialButton.fillColorNormal))
                )
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(pressGesture)
        .drawingGroup() // Optimize rendering
    }
    
    private var pressGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if !isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
            }
            .onEnded { _ in
                if isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
            }
    }
}

struct SpaceButton: View {
    let action: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            Text("space")
                .font(.system(size: KeyboardStyle.SpecialButton.fontSize, weight: KeyboardStyle.SpecialButton.fontWeight))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: KeyboardStyle.keyHeight)
                .background(
                    RoundedRectangle(cornerRadius: KeyboardStyle.buttonCornerRadius)
                        .fill(isPressed ? Color(white: KeyboardStyle.KeyButton.fillColorPressed) : Color(white: KeyboardStyle.KeyButton.fillColorNormal))
                )
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(pressGesture)
        .drawingGroup() // Optimize rendering
    }
    
    private var pressGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if !isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
            }
            .onEnded { _ in
                if isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
            }
    }
}

struct ReturnButton: View {
    let action: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            Text("return")
                .font(.system(size: KeyboardStyle.SpecialButton.fontSize, weight: KeyboardStyle.SpecialButton.fontWeight))
                .foregroundColor(.white)
                .frame(width: KeyboardStyle.returnButtonWidth, height: KeyboardStyle.keyHeight)
                .background(
                    RoundedRectangle(cornerRadius: KeyboardStyle.buttonCornerRadius)
                        .fill(isPressed ? Color(white: KeyboardStyle.SpecialButton.fillColorPressed) : Color(white: KeyboardStyle.SpecialButton.fillColorNormal))
                )
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(pressGesture)
        .drawingGroup() // Optimize rendering
    }
    
    private var pressGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                if !isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = true
                    }
                }
            }
            .onEnded { _ in
                if isPressed {
                    withAnimation(.easeOut(duration: 0.1)) {
                        isPressed = false
                    }
                }
            }
    }
}

#Preview {
    let connectionManager = ConnectionManager()
    let viewModel = KeyboardViewModel(connection: connectionManager)
    return KeyboardView(viewModel: viewModel)
        .frame(height: 300)
        .background(Color.black)
}
