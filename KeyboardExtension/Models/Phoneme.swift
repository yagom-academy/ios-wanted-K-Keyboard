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

extension Phoneme {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

enum Consonant: String, Phoneme {
    case ㄱ
    case ㄲ
    case ㄱㅅ
    case ㄴ
    case ㄴㅈ
    case ㄴㅎ
    case ㄷ
    case ㄸ
    case ㄹ
    case ㄹㄱ
    case ㄹㅁ
    case ㄹㅂ
    case ㄹㅅ
    case ㄹㅌ
    case ㄹㅍ
    case ㄹㅎ
    case ㅁ
    case ㅂ
    case ㅂㅅ
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
        
    static func mergeConsonant(preceding: Consonant, trailing: Consonant) -> Consonant? {
        switch preceding {
        case .ㄱ:
            if trailing == .ㅅ { return .ㄱㅅ }
            else { return nil }
        case .ㄴ:
            if trailing == .ㅈ { return .ㄴㅈ }
            else if trailing == .ㅎ { return .ㄴㅎ }
            else { return nil }
        case .ㄹ:
            if trailing == .ㄱ { return .ㄹㄱ }
            else if trailing == .ㅁ { return .ㄹㅁ }
            else if trailing == .ㅂ { return .ㄹㅂ }
            else if trailing == .ㅅ { return .ㄹㅅ }
            else if trailing == .ㅌ { return .ㄹㅌ }
            else if trailing == .ㅍ { return .ㄹㅍ }
            else if trailing == .ㅎ { return .ㄹㅎ }
            else { return nil }
        case .ㅂ:
            if trailing == .ㅅ { return .ㅂㅅ }
            else { return nil }
        default:
            return nil
        }
    }
    
    func decomposeConsonant() -> (Consonant, Consonant)? {
        switch self {
        case .ㄱㅅ: return (.ㄱ, .ㅅ)
        case .ㄴㅈ: return (.ㄴ, .ㅈ)
        case .ㄴㅎ: return (.ㄴ, .ㅎ)
        case .ㄹㄱ: return (.ㄹ, .ㄱ)
        case .ㄹㅁ: return (.ㄹ, .ㅁ)
        case .ㄹㅂ: return (.ㄹ, .ㅂ)
        case .ㄹㅅ: return (.ㄹ, .ㅅ)
        case .ㄹㅌ: return (.ㄹ, .ㅌ)
        case .ㄹㅍ: return (.ㄹ, .ㅍ)
        case .ㄹㅎ: return (.ㄹ, .ㅎ)
        case .ㅂㅅ: return (.ㅂ, .ㅅ)
        default: return nil
        }
    }
    
    var firstConsonantNumber: Int? {
        switch self {
        case .ㄱ: return 0
        case .ㄲ: return 1
        case .ㄴ: return 2
        case .ㄷ: return 3
        case .ㄸ: return 4
        case .ㄹ: return 5
        case .ㅁ: return 6
        case .ㅂ: return 7
        case .ㅃ: return 8
        case .ㅅ: return 9
        case .ㅆ: return 10
        case .ㅇ: return 11
        case .ㅈ: return 12
        case .ㅉ: return 13
        case .ㅊ: return 14
        case .ㅋ: return 15
        case .ㅌ: return 16
        case .ㅍ: return 17
        case .ㅎ: return 18
        default: return nil
        }
    }
    
    var lastConsonantNumber: Int? {
        switch self {
        case .ㄱ: return 1
        case .ㄲ: return 2
        case .ㄱㅅ: return 3
        case .ㄴ: return 4
        case .ㄴㅈ: return 5
        case .ㄴㅎ: return 6
        case .ㄷ: return 7
        case .ㄹ: return 8
        case .ㄹㄱ: return 9
        case .ㄹㅁ: return 10
        case .ㄹㅂ: return 11
        case .ㄹㅅ: return 12
        case .ㄹㅌ: return 13
        case .ㄹㅍ: return 14
        case .ㄹㅎ: return 15
        case .ㅁ: return 16
        case .ㅂ: return 17
        case .ㅂㅅ: return 18
        case .ㅅ: return 19
        case .ㅆ: return 20
        case .ㅇ: return 21
        case .ㅈ: return 22
        case .ㅊ: return 23
        case .ㅋ: return 24
        case .ㅌ: return 25
        case .ㅍ: return 26
        case .ㅎ: return 27
        default: return nil
        }
    }
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
    
    static func mergeVowel(preceding: Vowel, trailing: Vowel) -> Vowel? {
        switch preceding {
        case .ㅗ:
            if trailing == .ㅏ { return .ㅘ }
            else if trailing == .ㅐ { return .ㅙ }
            else if trailing == .ㅣ { return .ㅚ }
            else { return nil }
        case .ㅜ:
            if trailing == .ㅓ { return .ㅝ }
            else if trailing == .ㅔ { return .ㅞ }
            else if trailing == .ㅣ { return .ㅟ }
            else { return nil }
        case .ㅡ:
            if trailing == .ㅣ { return .ㅢ }
            else { return nil }
        default:
            return nil
        }
    }
    
    var middelVowelNumber: Int {
        switch self {
        case .ㅏ: return 0
        case .ㅐ: return 1
        case .ㅑ: return 2
        case .ㅒ: return 3
        case .ㅓ: return 4
        case .ㅔ: return 5
        case .ㅕ: return 6
        case .ㅖ: return 7
        case .ㅗ: return 8
        case .ㅘ: return 9
        case .ㅙ: return 10
        case .ㅚ: return 11
        case .ㅛ: return 12
        case .ㅜ: return 13
        case .ㅝ: return 14
        case .ㅞ: return 15
        case .ㅟ: return 16
        case .ㅠ: return 17
        case .ㅡ: return 18
        case .ㅢ: return 19
        case .ㅣ: return 20
        }
    }
}

enum Spacer: String, Phoneme {
    case space
}
