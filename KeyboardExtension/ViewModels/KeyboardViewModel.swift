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
    
    // MARK: Properties
    let phonemes: [[Phoneme]] = [
        [Consonant.ㅂ, Consonant.ㅈ, Consonant.ㄷ, Consonant.ㄱ, Consonant.ㅅ, Vowel.ㅛ, Vowel.ㅕ, Vowel.ㅑ, Vowel.ㅐ, Vowel.ㅔ],
        [Consonant.ㅁ, Consonant.ㄴ, Consonant.ㅇ, Consonant.ㄹ, Consonant.ㅎ, Vowel.ㅗ, Vowel.ㅓ, Vowel.ㅏ, Vowel.ㅣ],
        [Consonant.ㅋ, Consonant.ㅌ, Consonant.ㅊ, Consonant.ㅍ, Vowel.ㅠ, Vowel.ㅜ, Vowel.ㅡ]
    ]
    
    // MARK: Life Cycle
    init() {
        bind()
    }
    
    
    // MARK: Binding
    func bind() {

    }
}
