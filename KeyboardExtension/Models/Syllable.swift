//
//  Syllable.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation

struct Syllable: Equatable {
    var firstConsonant: Consonant?
    var middleVowel: Vowel?
    var lastConsonant: Consonant?
    
    var unicode: UnicodeScalar? {
        if let firstConsonantNumber = firstConsonant?.firstConsonantNumber,
           let middleVowel {
            let digit = 44032 + firstConsonantNumber * 21 * 28 + middleVowel.middelVowelNumber * 28 + (lastConsonant?.lastConsonantNumber ?? 0)
            return UnicodeScalar(digit)
        } else if let firstConsonant = firstConsonant {
            return firstConsonant.rawValue.unicodeScalars.first
        } else if let middleVowel {
            return middleVowel.rawValue.unicodeScalars.first
        } else {
            return nil
        }
    }
    
    mutating func receive(_ phoneme: Phoneme) -> Bool {
        if lastConsonant != nil {
            if let phoneme = phoneme as? Consonant,
               let mergedConsonant = Consonant.mergeConsonant(preceding: lastConsonant!, trailing: phoneme) {
                lastConsonant = mergedConsonant
                return true
            } else {
                return false
            }
        } else if middleVowel != nil {
            if firstConsonant != nil,
               let phoneme = phoneme as? Consonant,
               phoneme.lastConsonantNumber != nil {
                lastConsonant = phoneme
                return true
            } else {
                return false
            }
        } else if firstConsonant != nil {
            if let phoneme = phoneme as? Vowel {
                middleVowel = phoneme
                return true
            } else {
                return false
            }
        } else {
            if let phoneme = phoneme as? Consonant,
               phoneme.firstConsonantNumber != nil {
                firstConsonant = phoneme
                return true
            } else if let phoneme = phoneme as? Vowel {
                middleVowel = phoneme
                return true
            } else {
                return false
            }
        }
    }
}
