//
//  FrequentlyUsedWordsListViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/06.
//

import Foundation
import UIKit


class FrequentlyUsedWordsListViewModel {
    // MARK: Input
    var didTapCell: ((Int) -> ())?
    
    // MARK: Output
    var reloadList: (() -> ())?
    var propagateSelectedWord: ((String) -> ())?
    
    // MARK: Properties
    var frequentlyUsedWords = [
        "안녕하세요~",
        "감사합니다!",
        "지금 가는 중이야!",
        "감사합니다!",
        "지금 가는 중이야!",
    ] {
        didSet {
            reloadList?()
        }
    }
    
    // MARK: Life Cycle
    init() {
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        didTapCell = { [weak self] index in
            guard let self else { return }
            let word = self.frequentlyUsedWords[index]
            self.propagateSelectedWord?(word)
        }
    }
}
