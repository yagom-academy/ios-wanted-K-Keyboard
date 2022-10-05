//
//  KorKeyboardDelegate.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/06.
//

import Foundation

protocol KorKeyboardViewDelegate: class {
    func insertCharacter(_ input: String)
    func deleteCharacterBeforeCursor()
}
