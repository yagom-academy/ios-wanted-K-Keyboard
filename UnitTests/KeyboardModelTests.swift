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

    func test_mergeVowels() throws {
        // given
        var resultPhonemes = [Phoneme]()
        model.inputPhonemesSource = { phonemes in
            resultPhonemes = phonemes
        }
        
        // when
        model.inputPhonemes = [Consonant.ㅇ, Vowel.ㅜ, Vowel.ㅓ, Consonant.ㅅ, Vowel.ㅕ, Vowel.ㅓ, Vowel.ㅡ, Vowel.ㅣ]

        // then
        let expected: [Phoneme] = [Consonant.ㅇ, Vowel.ㅝ, Consonant.ㅅ, Vowel.ㅕ, Vowel.ㅓ, Vowel.ㅢ]
        XCTAssertEqual(resultPhonemes.map { $0.rawValue }, expected.map { $0.rawValue })
    }
}
