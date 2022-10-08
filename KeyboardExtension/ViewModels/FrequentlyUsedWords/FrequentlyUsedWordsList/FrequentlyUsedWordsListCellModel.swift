//
//  FrequentlyUsedWordsListCellModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/06.
//

import Foundation
import UIKit


class FrequentlyUsedWordsListCellModel {
    // MARK: Input
    var receiveWord: ((String) -> ())?
    
    // MARK: Output
    var wordSource: ((String?) -> ())?
    
    // MARK: Properties
    var word: String? {
        didSet {
            wordSource?(word)
        }
    }
    
    // MARK: Life Cycle
    init() {
        bind()
    }
    
    // MARK: Binding
    func bind() {
        receiveWord = { [weak self] word in
            guard let self else{ return }
            self.word = word
        }
    }
}
