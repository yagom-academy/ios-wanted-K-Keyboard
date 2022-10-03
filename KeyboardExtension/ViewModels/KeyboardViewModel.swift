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
    var addPhoneme: ((Phoneme) -> ())?
    
    // MARK: Output
    var syllablesSource: (([Syllable]) -> ())?
    
    // MARK: Properties
    let phonemes: [[Phoneme]] = [
        [Consonant.ㅂ, Consonant.ㅈ, Consonant.ㄷ, Consonant.ㄱ, Consonant.ㅅ, Vowel.ㅛ, Vowel.ㅕ, Vowel.ㅑ, Vowel.ㅐ, Vowel.ㅔ],
        [Consonant.ㅁ, Consonant.ㄴ, Consonant.ㅇ, Consonant.ㄹ, Consonant.ㅎ, Vowel.ㅗ, Vowel.ㅓ, Vowel.ㅏ, Vowel.ㅣ],
        [Consonant.ㅋ, Consonant.ㅌ, Consonant.ㅊ, Consonant.ㅍ, Vowel.ㅠ, Vowel.ㅜ, Vowel.ㅡ]
    ]
    
    var inputPhonemes = [Phoneme]() {
        didSet {
            syllablesSource?(mergeSyllables(mergeVowels(inputPhonemes)))
        }
    }
    
    // MARK: Life Cycle
    init() {
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        addPhoneme = { [weak self] phoneme in
            guard let self else { return }
            self.inputPhonemes.append(phoneme)
        }
    }
    
    private func mergeVowels(_ phonemes: [Phoneme]) -> [Phoneme] {
        var result = [Phoneme]()
        var buffer: Vowel? = nil
        phonemes.forEach{ phoneme in
            if phoneme is Consonant || phoneme is Spacer {
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
        
        if let buffer {
            result.append(buffer)
        }
        return result
    }
    
    private func mergeSyllables(_ phonemes: [Phoneme]) -> [Syllable] {
        var syllables = [Syllable]()
        phonemes.forEach { phoneme in
            if let phoneme = phoneme as? Consonant {
                if syllables.isEmpty || !syllables[syllables.count - 1].receive(phoneme) {
                    let syllable = Syllable(firstConsonant: phoneme)
                    syllables.append(syllable)
                }
            } else if let phoneme = phoneme as? Vowel {
                if syllables.isEmpty {
                    let syllable = Syllable(middleVowel: phoneme)
                    syllables.append(syllable)
                } else if !syllables[syllables.count - 1].receive(phoneme) {
                    if let lastConsonant = syllables[syllables.count - 1].lastConsonant {
                        if let decomposedConsonants = lastConsonant.decomposeConsonant() {
                            syllables[syllables.count - 1].lastConsonant = decomposedConsonants.0
                            let syllable = Syllable(firstConsonant: decomposedConsonants.1, middleVowel: phoneme)
                            syllables.append(syllable)
                        } else {
                            syllables[syllables.count - 1].lastConsonant = nil
                            let syllable = Syllable(firstConsonant: lastConsonant, middleVowel: phoneme)
                            syllables.append(syllable)
                        }
                    } else {
                        let syllable = Syllable(middleVowel: phoneme)
                        syllables.append(syllable)
                    }
                }
            } else if let spacer = phoneme as? Spacer {
                let syllable = Syllable(spacer: spacer)
                syllables.append(syllable)
            }
        }
        return syllables
    }
}
