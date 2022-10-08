//
//  MainViewModelTests.swift
//  UnitTests
//
//  Created by CodeCamper on 2022/10/06.
//

import UIKit
import XCTest

class MainViewModelTests: XCTestCase {
    var model: MainViewModel!
    
    override func setUpWithError() throws {
        model = MainViewModel()
    }

    override func tearDownWithError() throws {
        model = nil
    }
    
    func test키보드로_한글의_키보드_입력() {
        // given
        var resultText = ""
        model.textSource = { text in
            resultText = text
        }
        
        // when
        model.receiveAssemblingText?("한글의")
        model.receiveAddSpace?()
        model.receiveAssemblingText?("키보드")
        
        // then
        let expected = "한글의 키보드"
        XCTAssertEqual(resultText, expected)
    }
    
    func test자주_쓰는_말로_한글의_키보드_입력() {
        // given
        var resultText = ""
        model.textSource = { text in
            resultText = text
        }
        
        // when
        model.receiveWord?("한글의")
        model.receiveAddSpace?()
        model.receiveWord?("키보드")
        
        // then
        let expected = "한글의 키보드"
        XCTAssertEqual(resultText, expected)
    }
}
