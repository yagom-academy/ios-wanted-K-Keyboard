//
//  ShortcutButtonViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/07.
//

import Foundation
import UIKit


class ShortcutButtonViewModel {
    // MARK: Input
    var receiveWord: ((String) -> ())?
    var didTap: (() -> ())?
    
    // MARK: Output
    var wordSource: ((String?) -> ())?
    var propagateDidTap: (() -> ())?
    
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
            guard let self else { return }
            self.word = word
        }
        
        didTap = { [weak self] in
            guard let self else { return }
            self.propagateDidTap?()
        }
    }
}
