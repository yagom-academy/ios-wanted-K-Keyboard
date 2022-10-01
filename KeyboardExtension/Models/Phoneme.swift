//
//  Phoneme.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation

protocol Phoneme {
    var rawValue: String { get }
}

enum Consonant: String, Phoneme {
    case ㄱ
    case ㄲ
    case ㄴ
    case ㄷ
    case ㄸ
    case ㄹ
    case ㅁ
    case ㅂ
    case ㅃ
    case ㅅ
    case ㅆ
    case ㅇ
    case ㅈ
    case ㅉ
    case ㅊ
    case ㅋ
    case ㅌ
    case ㅍ
    case ㅎ
}

enum Vowel: String, Phoneme {
    case ㅏ
    case ㅐ
    case ㅑ
    case ㅒ
    case ㅓ
    case ㅔ
    case ㅕ
    case ㅖ
    case ㅗ
    case ㅘ
    case ㅙ
    case ㅚ
    case ㅛ
    case ㅜ
    case ㅝ
    case ㅞ
    case ㅟ
    case ㅠ
    case ㅡ
    case ㅢ
    case ㅣ
}
