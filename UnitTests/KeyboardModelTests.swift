//
//  KeyboardModelTests.swift
//  UnitTests
//
//  Created by 한경수 on 2022/10/02.
//

import Foundation
import XCTest

final class KeyboardModelTests: XCTestCase {
    var model: KeyboardViewModel!
    
    override func setUpWithError() throws {
        model = KeyboardViewModel()
    }

    override func tearDownWithError() throws {
        model = nil
    }

    func test_mergeSyllables_워셔ㅓㅢ() throws {
        // given
        var resultSyllables = [Syllable]()
        model.syllablesSource = { syllables in
            resultSyllables = syllables
        }
        
        // when
        model.inputPhonemes = [Consonant.ㅇ, Vowel.ㅜ, Vowel.ㅓ, Consonant.ㅅ, Vowel.ㅕ, Vowel.ㅓ, Vowel.ㅡ, Vowel.ㅣ]

        // then
        let expected: [Syllable] = [
            Syllable(firstConsonant: Consonant.ㅇ, middleVowel: Vowel.ㅝ),
            Syllable(firstConsonant: Consonant.ㅅ, middleVowel: Vowel.ㅕ),
            Syllable(middleVowel: Vowel.ㅓ),
            Syllable(middleVowel: Vowel.ㅢ)
        ]
        XCTAssertEqual(resultSyllables, expected)
    }
    
    func test_mergeSyllables_한글의_키보드() throws {
        // given
        var resultSyllables = [Syllable]()
        model.syllablesSource = { syllables in
            resultSyllables = syllables
        }
        
        // when
        model.inputPhonemes = [
            Consonant.ㅎ, Vowel.ㅏ, Consonant.ㄴ,
            Consonant.ㄱ, Vowel.ㅡ, Consonant.ㄹ,
            Consonant.ㅇ, Vowel.ㅡ, Vowel.ㅣ,
            Spacer.space,
            Consonant.ㅋ, Vowel.ㅣ,
            Consonant.ㅂ, Vowel.ㅗ,
            Consonant.ㄷ, Vowel.ㅡ
        ]

        // then
        let expected: [Syllable] = [
            Syllable(firstConsonant: Consonant.ㅎ, middleVowel: Vowel.ㅏ, lastConsonant: Consonant.ㄴ),
            Syllable(firstConsonant: Consonant.ㄱ, middleVowel: Vowel.ㅡ, lastConsonant: Consonant.ㄹ),
            Syllable(firstConsonant: Consonant.ㅇ, middleVowel: Vowel.ㅢ),
            Syllable(spacer: Spacer.space),
            Syllable(firstConsonant: Consonant.ㅋ, middleVowel: Vowel.ㅣ),
            Syllable(firstConsonant: Consonant.ㅂ, middleVowel: Vowel.ㅗ),
            Syllable(firstConsonant: Consonant.ㄷ, middleVowel: Vowel.ㅡ),
        ]
        XCTAssertEqual(resultSyllables, expected)
    }
}
