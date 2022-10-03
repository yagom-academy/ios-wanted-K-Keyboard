//
//  SyllableTests.swift
//  K-KeyboardTests
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation
import XCTest

final class SyllableTests: XCTestCase {
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func test_Syllable_unicode_꽰() throws {
        // given
        let syllable = Syllable(firstConsonant: .ㄲ, middleVowel: .ㅙ, lastConsonant: .ㄹㅅ)

        // when
        let unicode = syllable.unicode

        // then
        XCTAssertNotNil(unicode)
        XCTAssertEqual(String(unicode!), "꽰")
    }
    
    func test_Syllable_unicode_ㅡ() throws {
        // given
        let syllable = Syllable(middleVowel: .ㅡ)
        
        // when
        let unicode = syllable.unicode
        
        // then
        XCTAssertNotNil(unicode)
        XCTAssertEqual(String(unicode!), "ㅡ")
    }
    
    func test_Syllable_unicode_ㅌ() throws {
        // given
        let syllable = Syllable(firstConsonant: .ㅌ)
        
        // when
        let unicode = syllable.unicode
        
        // then
        XCTAssertNotNil(unicode)
        XCTAssertEqual(String(unicode!), "ㅌ")
    }
}
