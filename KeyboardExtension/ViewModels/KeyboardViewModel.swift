//
//  KeyboardViewModel.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation
import UIKit


class KeyboardViewModel {
    // MARK: Input
    
    // MARK: Output
    var inputPhonemesSource: (([Phoneme]) -> ())?
    
    // MARK: Properties
    let phonemes: [[Phoneme]] = [
        [Consonant.ㅂ, Consonant.ㅈ, Consonant.ㄷ, Consonant.ㄱ, Consonant.ㅅ, Vowel.ㅛ, Vowel.ㅕ, Vowel.ㅑ, Vowel.ㅐ, Vowel.ㅔ],
        [Consonant.ㅁ, Consonant.ㄴ, Consonant.ㅇ, Consonant.ㄹ, Consonant.ㅎ, Vowel.ㅗ, Vowel.ㅓ, Vowel.ㅏ, Vowel.ㅣ],
        [Consonant.ㅋ, Consonant.ㅌ, Consonant.ㅊ, Consonant.ㅍ, Vowel.ㅠ, Vowel.ㅜ, Vowel.ㅡ]
    ]
    
    var inputPhonemes = [Phoneme]() {
        didSet {
            inputPhonemesSource?(mergeVowels(inputPhonemes))
        }
    }
    
    // MARK: Life Cycle
    init() {
        bind()
        debugPrint(mergeVowels([Consonant.ㅇ, Vowel.ㅜ, Vowel.ㅓ, Consonant.ㅅ, Vowel.ㅕ, Vowel.ㅓ, Vowel.ㅡ, Vowel.ㅣ]))
    }
    
    
    // MARK: Binding
    func bind() {
        
    }
    
    private func mergeVowels(_ phonemes: [Phoneme]) -> [Phoneme] {
        var result = [Phoneme]()
        var buffer: Vowel? = nil
        phonemes.forEach{ phoneme in
            if let phoneme = phoneme as? Consonant {
                if buffer != nil {
                    result.append(buffer!)
                    result.append(phoneme)
                    buffer = nil
                } else {
                    result.append(phoneme)
                }
            } else if let phoneme = phoneme as? Vowel {
                if buffer != nil {
                    if let mergedBuffer = Vowel.mergeVowel(preceding: buffer!, trailing: phoneme) {
                        result.append(mergedBuffer)
                        buffer = nil
                    } else {
                        result.append(buffer!)
                        buffer = phoneme
                    }
                } else {
                    buffer = phoneme
                }
            }
        }
        return result
    }
    
    private func mergeSyllables(_ phonemes: [Phoneme]) -> [Syllable] {
        var syllables = [Syllable]()
        phonemes.forEach { phoneme in
            if syllables.isEmpty {
                let syllable = Syllable()
                
            }
        }
        return syllables
    }
}
