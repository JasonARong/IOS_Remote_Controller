//
//  KeyboardViewModel.swift
//  RemoteController
//
//  Created by 陈皆成 on 2025/12/27.
//

import SwiftUI
import Combine

final class KeyboardViewModel: ObservableObject {
    @Published var currentLayer: KeyboardLayer = .letters
    @Published var isShiftOn: Bool = false   // simple 1-shot shift to start
    @Published var isShiftAlwaysOn: Bool = false  // shift stays on until toggled again

    private let connection: ConnectionManager

    init(connection: ConnectionManager) {
        self.connection = connection
    }

    // Main entry from the UI
    func handleKeyTap(_ key: KeyboardKey) {
        switch key {
        case .switchLayer(let layer): // switch different keyboard layers
            currentLayer = layer
            // Reset shift when switching layers
            isShiftOn = false
            isShiftAlwaysOn = false

        case .shiftToggle:
            // Toggle always-on mode
            isShiftAlwaysOn.toggle()
            isShiftOn = isShiftAlwaysOn

        case .space:
            sendCombo([.space])

        case .backspace:
            sendCombo([.backspace])

        case .returnKey:
            sendCombo([.enterReturn])

        case .letter(let c):
            handleLetter(c)

        case .digit(let c):
            handleDigit(c)

        case .symbol(let c):
            handleSymbol(c)
        }
    }
    
    // Helper to check if shift should be applied
    var shouldApplyShift: Bool {
        isShiftOn || isShiftAlwaysOn
    }
    
    // Apply temporary shift (for single letter)
    func applyTemporaryShift() {
        if !isShiftAlwaysOn {
            isShiftOn = true
        }
    }
    
    // Clear temporary shift after use
    func clearTemporaryShift() {
        if !isShiftAlwaysOn {
            isShiftOn = false
        }
    }
}

private extension KeyboardViewModel {
    func sendCombo(_ combo: [LogicalKey]) {
        guard !combo.isEmpty else { return }
        
        // Send combo via connection manager
        connection.sendKeyCombo(combo)
        
        // Clear temporary shift after sending (but keep always-on shift)
        if isShiftOn && !isShiftAlwaysOn {
            isShiftOn = false
        }
    }
}
private extension KeyboardViewModel {
    func handleLetter(_ c: Character) {
        guard let base = logicalKeyForLetter(c) else { return }

        if shouldApplyShift {
            sendCombo([.shift, base])
        } else {
            sendCombo([base])
        }
    }

    func logicalKeyForLetter(_ c: Character) -> LogicalKey? {
        switch Character(c.lowercased()) {
        case "a": return .keyA
        case "b": return .keyB
        case "c": return .keyC
        case "d": return .keyD
        case "e": return .keyE
        case "f": return .keyF
        case "g": return .keyG
        case "h": return .keyH
        case "i": return .keyI
        case "j": return .keyJ
        case "k": return .keyK
        case "l": return .keyL
        case "m": return .keyM
        case "n": return .keyN
        case "o": return .keyO
        case "p": return .keyP
        case "q": return .keyQ
        case "r": return .keyR
        case "s": return .keyS
        case "t": return .keyT
        case "u": return .keyU
        case "v": return .keyV
        case "w": return .keyW
        case "x": return .keyX
        case "y": return .keyY
        case "z": return .keyZ
        default:  return nil
        }
    }
}

private extension KeyboardViewModel {
    func handleDigit(_ c: Character) {
        guard let key = logicalKeyForDigit(c) else { return }
        // For number keys on your UI, you almost always want the unshifted form
        // (shifted symbols use .symbol handler).
        sendCombo([key])
    }

    func logicalKeyForDigit(_ c: Character) -> LogicalKey? {
        switch c {
        case "0": return .digit0
        case "1": return .digit1
        case "2": return .digit2
        case "3": return .digit3
        case "4": return .digit4
        case "5": return .digit5
        case "6": return .digit6
        case "7": return .digit7
        case "8": return .digit8
        case "9": return .digit9
        default:  return nil
        }
    }
}

private extension KeyboardViewModel {
    func handleSymbol(_ c: Character) {
        guard let combo = comboForSymbol(c) else { return }
        sendCombo(combo)
    }

    func comboForSymbol(_ c: Character) -> [LogicalKey]? {
        switch c {

        // Direct base keys (no shift)
        case "-": return [.minus]
        case "=": return [.equal]
        case "[": return [.leftBracket]
        case "]": return [.rightBracket]
        case ";": return [.semicolon]
        case "/": return [.slash]
        case ",": return [.comma]
        case ".": return [.period]
        case "\\": return [.backslash]
        case "`": return [.backtick]

        // Shifted variants of base keys
        case "_": return [.shift, .minus]
        case "+": return [.shift, .equal]
        case "{": return [.shift, .leftBracket]
        case "}": return [.shift, .rightBracket]
        case ":": return [.shift, .semicolon]
        case "?": return [.shift, .slash]
        case "<": return [.shift, .comma]
        case ">": return [.shift, .period]
        case "|": return [.shift, .backslash]
        case "~": return [.shift, .backtick]
        case "\"": return [.shift, .apostrophe]    // need .apostrophe LogicalKey if you added it
        case "!": return [.shift, .digit1]
        case "@": return [.shift, .digit2]
        case "#": return [.shift, .digit3]
        case "$": return [.shift, .digit4]
        case "%": return [.shift, .digit5]
        case "^": return [.shift, .digit6]
        case "&": return [.shift, .digit7]
        case "*": return [.shift, .digit8]
        case "(": return [.shift, .digit9]
        case ")": return [.shift, .digit0]

        // Unshifted quote / apostrophe
        case "'": return [.apostrophe]

        // TODO: Layout-specific currency / extended symbols
        // These depend on OS keyboard layout; for now you can:
        //  - either leave them unmapped (return nil),
        //  - or add macOS US-specific combos (e.g. Option+...")
        case "€":
            // Example placeholder; you can fill with actual Mac-US combo later
            return nil
        case "£":
            return nil
        case "¥":
            return nil
        case "·":
            return nil

        default:
            return nil
        }
    }
}

