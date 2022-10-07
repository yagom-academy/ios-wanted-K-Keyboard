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
    var toggleShift: (() -> ())?
    var removePhoneme: (() -> ())?
    var addWord: ((String) -> ())?
    var showShortcutPopup: (() -> ())?
    var addSpace: (() -> ())?
    var addNewLine: (() -> ())?
    var textContextDidChange: (() -> ())?
    
    // MARK: Output
    var propagateText: ((String) -> ())?
    var phonemesSource: (([[Phoneme]]) -> ())?
    var shiftActivatedSource: ((Bool) -> ())?
    var isShortcutPopupHiddenSource: ((Bool) -> ())?
    var propagateRemovePrefix: (() -> ())?
    var propagateAddWord: ((String) -> ())?
    var propagateAddSpace: (() -> ())?
    var propagateAddNewLine: (() -> ())?
    
    // MARK: Properties
    var phonemes: [[Phoneme]] = [
        [Consonant.ㅂ, Consonant.ㅈ, Consonant.ㄷ, Consonant.ㄱ, Consonant.ㅅ, Vowel.ㅛ, Vowel.ㅕ, Vowel.ㅑ, Vowel.ㅐ, Vowel.ㅔ],
        [Consonant.ㅁ, Consonant.ㄴ, Consonant.ㅇ, Consonant.ㄹ, Consonant.ㅎ, Vowel.ㅗ, Vowel.ㅓ, Vowel.ㅏ, Vowel.ㅣ],
        [Consonant.ㅋ, Consonant.ㅌ, Consonant.ㅊ, Consonant.ㅍ, Vowel.ㅠ, Vowel.ㅜ, Vowel.ㅡ]
    ] {
        didSet {
            phonemesSource?(phonemes)
        }
    }
    
    var inputPhonemes = [Phoneme]()
    
    var shiftActivated: Bool = false {
        didSet {
            mutatePhonemes(shiftActivated: shiftActivated)
            shiftActivatedSource?(shiftActivated)
        }
    }
    
    var isShortcutPopupHidden: Bool = true {
        didSet {
            isShortcutPopupHiddenSource?(isShortcutPopupHidden)
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
            self.shiftActivated = false
            self.isShortcutPopupHidden = true
            let syllables = self.mergeSyllables(self.mergeVowels(self.inputPhonemes))
            let text = self.convertToString(syllables)
            self.propagateText?(text)
        }
        
        toggleShift = { [weak self] in
            guard let self else { return }
            self.shiftActivated.toggle()
        }
        
        removePhoneme = { [weak self] in
            guard let self else { return }
            if !self.inputPhonemes.isEmpty {
                self.inputPhonemes.removeLast()
                let syllables = self.mergeSyllables(self.mergeVowels(self.inputPhonemes))
                let text = self.convertToString(syllables)
                self.propagateText?(text)
            } else {
                self.propagateRemovePrefix?()
            }
            self.shiftActivated = false
            self.isShortcutPopupHidden = true
        }
        
        addWord = { [weak self] word in
            guard let self else { return }
            self.propagateAddWord?(word)
            self.shiftActivated = false
            self.isShortcutPopupHidden = true
        }
        
        showShortcutPopup = { [weak self] in
            guard let self else { return }
            self.isShortcutPopupHidden = false
            self.shiftActivated = false
        }
        
        addSpace = { [weak self] in
            guard let self else { return }
            self.propagateAddSpace?()
            self.shiftActivated = false
            self.isShortcutPopupHidden = true
        }
        
        addNewLine = { [weak self] in
            guard let self else { return }
            self.propagateAddNewLine?()
            self.shiftActivated = false
            self.isShortcutPopupHidden = true
        }
        
        textContextDidChange = { [weak self] in
            guard let self else { return }
            self.shiftActivated = false
            self.isShortcutPopupHidden = true
            self.inputPhonemes = []
        }
    }
    
    private func mergeVowels(_ phonemes: [Phoneme]) -> [Phoneme] {
        var result = [Phoneme]()
        var buffer: Vowel? = nil
        phonemes.forEach{ phoneme in
            if phoneme is Consonant {
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
            }
        }
        return syllables
    }
    
    private func convertToString(_ syllables: [Syllable]) -> String {
        var text = ""
        syllables.compactMap { $0.unicode }.forEach { text += String($0) }
        return text
    }
    
    private func mutatePhonemes(shiftActivated activated: Bool) {
        phonemes[0][0] = activated ? Consonant.ㅃ : Consonant.ㅂ
        phonemes[0][1] = activated ? Consonant.ㅉ : Consonant.ㅈ
        phonemes[0][2] = activated ? Consonant.ㄸ : Consonant.ㄷ
        phonemes[0][3] = activated ? Consonant.ㄲ : Consonant.ㄱ
        phonemes[0][4] = activated ? Consonant.ㅆ : Consonant.ㅅ
        phonemes[0][8] = activated ? Vowel.ㅒ : Vowel.ㅐ
        phonemes[0][9] = activated ? Vowel.ㅖ : Vowel.ㅔ
    }
}
