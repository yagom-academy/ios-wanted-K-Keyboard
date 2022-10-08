//
//  ToolBarViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/05.
//

import Foundation
import UIKit


class ToolBarViewModel {
    // MARK: Input
    var tapButton: ((Int) -> ())?
    
    // MARK: Output
    var selectedSource: ((Int?) -> ())?
    var propagateSelected: ((Int?) -> ())?
    
    // MARK: Properties
    let toolBarImages: [UIImage?] = [
        UIImage(named: "ic_toolbar_live_theme_sticker_send"),
        UIImage(named: "ic_toolbar_clipboard"),
        UIImage(named: "ic_toolbar_frequently_used_words"),
        UIImage(named: "ic_toolbar_stickers"),
        UIImage(named: "ic_toolbar_text_emoji"),
        UIImage(named: "ic_toolbar_emoji"),
    ]
    
    var selected: Int? {
        didSet {
            selectedSource?(selected)
            propagateSelected?(selected)
        }
    }
    
    // MARK: Life Cycle
    init() {
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        tapButton = { [weak self] index in
            guard let self else { return }
            if self.selected == index {
                self.selected = nil
            } else {
                self.selected = index
            }
        }
    }
}
