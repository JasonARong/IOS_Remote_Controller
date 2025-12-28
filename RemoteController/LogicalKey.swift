//
//  LogicalKey.swift
//  RemoteController
//
//  Created by 陈皆成 on 2025/12/27.
//

import Foundation

/// Logical keyboard keys used in BLE packets.
/// These are *not* USB scancodes; they’re your own IDs.
/// ESP will map them to real HID keycodes.
enum LogicalKey: UInt8 {
    // MARK: - Modifiers
    case control      = 1
    case shift        = 2
    case altOption    = 3
    case commandGUI   = 4   // Command on Mac / Win key on Windows
    case fn           = 5   // (reserved for future, if ever needed)

    // MARK: - Navigation / control keys
    case arrowLeft    = 20
    case arrowRight   = 21
    case arrowUp      = 22
    case arrowDown    = 23

    case escape       = 24
    case tab          = 25
    case enterReturn  = 26
    case backspace    = 27
    case deleteForward = 28  // (reserved)
    case space        = 29

    // MARK: - Letters (physical A–Z key positions)
    case keyA = 40
    case keyB
    case keyC
    case keyD
    case keyE
    case keyF
    case keyG
    case keyH
    case keyI
    case keyJ
    case keyK
    case keyL
    case keyM
    case keyN
    case keyO
    case keyP
    case keyQ
    case keyR
    case keyS
    case keyT
    case keyU
    case keyV
    case keyW
    case keyX
    case keyY
    case keyZ

    // MARK: - Digits (top number row)
    case digit0 = 80
    case digit1
    case digit2
    case digit3
    case digit4
    case digit5
    case digit6
    case digit7
    case digit8
    case digit9

    // MARK: - Punctuation / symbols

    // Base punctuation keys (roughly US layout physical keys)
    case minus        // key with '-' and '_'
    case equal        // '=' and '+'
    case leftBracket  // '[' and '{'
    case rightBracket // ']' and '}'
    case semicolon    // ';' and ':'
    case apostrophe   // '\'' and '"'
    case comma        // ',' and '<'
    case period       // '.' and '>'
    case slash        // '/' and '?'
    case backslash    // '\' and '|'
    case backtick     // '`' and '~'


    // Currency / extended symbols
    case euro         = 170      // '€'
    case pound        = 171      // '£'
    case yen          = 172      // '¥'
    case middleDot    = 173      // '·'
}
