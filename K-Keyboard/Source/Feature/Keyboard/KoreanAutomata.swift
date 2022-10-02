//
//  KoreanAutomata.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/09/30.
//

import UIKit

enum Korean {
    case consonant
    case vowel
}

class KoreanAutomata {
    static let shared = KoreanAutomata()
    
    let firstConsonants: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    let doubleConsonants: [String: String] = ["ㄱ" : "ㄲ", "ㄷ": "ㄸ", "ㅂ": "ㅃ", "ㅅ": "ㅆ", "ㅈ": "ㅉ"]
    
    let vowels: [String] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ",
                               "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
    let doubleVowels: [String] = []
    let finalConsonants: [String] = [" ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ","ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    var lastWord = ""
    var totalWords: [String] = []
    
    func insertLogic(state: KeyboardState, text: String, keyType: KeyType) -> (KeyboardState, String) {
        
        if keyType == .space {
            lastWord = " "
            return (.start, lastWord)
        }
        
        switch state {
        case .start:
            lastWord = text
            totalWords.append(text)
            if keyType == .vowel {
                return (.vowelOnly, lastWord)
            } else {
                return (.firstConsonantOnly, lastWord)
            }
        case .firstConsonantOnly:
            if keyType == .vowel {
                let value = hangle(chosung: lastWord, jungsung: text, jongsung: nil)
                lastWord = value ?? ""
                totalWords.append(text)
                return (.consonantPlusVowel, lastWord)
            } else {
                if doubleConsonants.keys.contains(lastWord) && totalWords.last == text {
                    lastWord = doubleConsonants[text] ?? ""
                    totalWords.append(text)
                    return (.firstConsonantOnly, lastWord)
                } else {
                    lastWord = text
                    totalWords.append(text)
                    return (.firstConsonantOnly, lastWord)
                }
            }
        case .vowelOnly:
            return (.start, text)
        case .consonantPlusVowel:
            return (.start, text)
        case .finalConsonant:
            return (.start, text)
        }
        
        
        
        
    }
    
    func hangle(chosung: String, jungsung: String, jongsung:String?) -> String? {
        var chosungIndex = 0
        var jungsungIndex = 0
        var jongsungIndex = 0
        
        for i in 0 ..< firstConsonants.count {
            if firstConsonants[i] == chosung { chosungIndex = i }
        }
        
        for i in 0 ..< vowels.count {
            if vowels[i] == jungsung { jungsungIndex = i }
        }
        
        for i in 0 ..< finalConsonants.count {
            if finalConsonants[i] == jongsung { jongsungIndex = i }
        }
        
        let uniValue:Int = (chosungIndex * 21 * 28) + (jungsungIndex * 28) + (jongsungIndex) + 0xAC00;
        if let uni = Unicode.Scalar(uniValue) {
            return String(Character(uni))
        }
        
        return nil
    }
    
}
