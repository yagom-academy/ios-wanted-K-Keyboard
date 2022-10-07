//
//  ShortcutViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/07.
//

import Foundation
import UIKit


class ShortcutViewModel {
    // MARK: Input
    var didTap: (() -> ())?
    var didLongPress: (() -> ())?
    var receiveWord: ((String) -> ())?
    
    // MARK: Output
    var wordSource: ((String) -> ())?
    
    // MARK: Properties
    var propagateDidTap: ((String) -> ())?
    var propagateLongPress: (() -> ())?
    var word: String = "ㅋㅋㅋㅋ" {
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
        didTap = { [weak self] in
            guard let self else { return }
            self.propagateDidTap?(self.word)
        }
        
        didLongPress = { [weak self] in
            guard let self else { return }
            self.propagateLongPress?()
        }
        
        receiveWord = { [weak self] word in
            guard let self else { return }
            self.word = word
        }
    }
}
