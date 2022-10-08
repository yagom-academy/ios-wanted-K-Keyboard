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
        var resultText = ""
        model.propagateText = { assemblingText in
            resultText = assemblingText
        }
        
        // when
        let inputPhonemes: [Phoneme] = [Consonant.ㅇ, Vowel.ㅜ, Vowel.ㅓ, Consonant.ㅅ, Vowel.ㅕ, Vowel.ㅓ, Vowel.ㅡ, Vowel.ㅣ]
        inputPhonemes.forEach {
            model.addPhoneme?($0)
        }

        // then
        let expected = "워셔ㅓㅢ"
        XCTAssertEqual(resultText, expected)
    }
}
