//
//  Syllable.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation

struct Syllable {
    var firstConsonant: Consonant?
    var middelVowel: Vowel?
    var lastConsonant: Consonant?
    
    var unicode: UnicodeScalar? {
        if let firstConsonantNumber = firstConsonant?.firstConsonantNumber,
           let middelVowel {
            let digit = 44032 + firstConsonantNumber * 21 * 28 + middelVowel.middelVowelNumber * 28 + (lastConsonant?.lastConsonantNumber ?? 0)
            return UnicodeScalar(digit)
        } else if let firstConsonant = firstConsonant {
            return firstConsonant.rawValue.unicodeScalars.first
        } else if let middelVowel {
            return middelVowel.rawValue.unicodeScalars.first
        } else {
            return nil
        }
    }
    
    func recivable(_ phoneme: Phoneme) -> Bool {
        if firstConsonant == nil {
            if let phoneme = phoneme as? Consonant,
               phoneme.firstConsonantNumber != nil {
                return true
            } else {
                return false
            }
        } else if middelVowel == nil {
            if phoneme is Vowel {
                return true
            } else {
                return false
            }
        } else if lastConsonant == nil {
            if let phoneme = phoneme as? Consonant,
               phoneme.lastConsonantNumber != nil {
                return true
            } else {
                return false
            }
        } else {
            if let phoneme = phoneme as? Consonant,
               Consonant.mergeConsonant(preceding: lastConsonant!, trailing: phoneme) != nil {
                return true
            } else {
                return false
            }
        }
    }
}
