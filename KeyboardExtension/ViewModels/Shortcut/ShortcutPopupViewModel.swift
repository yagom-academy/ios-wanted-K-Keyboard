//
//  ShortcutViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/07.
//

import Foundation
import UIKit


class ShortcutPopupViewModel {
    // MARK: Input
    var receiveDidTap: ((Int) -> ())?
    
    // MARK: Output
    var shortcutWordsSource: (([String]) -> ())?
    var propagateSelectedWord: ((String) -> ())?
    
    // MARK: Properties
    var shortcutWords: [String] = [
        "ㅋㅋㅋㅋ", "ㅠㅠㅠㅠ", "안녕하세요", "감사합니다",
        "?", "❤️", "😂"
    ]
    
    // MARK: Life Cycle
    init() {
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        receiveDidTap = { [weak self] index in
            guard let self else { return }
            let word = self.shortcutWords[index]
            self.propagateSelectedWord?(word)
            
            self.moveToFront(from: index)
        }
    }
    
    // MARK: Util
    private func moveToFront(from index: Int) {
        let word = shortcutWords.remove(at: index)
        shortcutWords.insert(word, at: 0)
        shortcutWordsSource?(shortcutWords)
    }
}
