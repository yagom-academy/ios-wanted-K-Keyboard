//
//  ThemeCell.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/04.
//

import UIKit

struct ThemeModel {
    let emoji: String
    let title: String
    var count: Int 
}

class ThemeCell: UICollectionViewCell {
    
    @IBOutlet private weak var emojiLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    var count: Int = 0 {
        didSet {
            countLabel.text = "\(count)"
            cellDidTapLabelColorChange()
        }
    }
    
    private func cellDidTapLabelColorChange() {
        if titleLabel.textColor != .systemPink {
            titleLabel.textColor = .systemPink
            countLabel.textColor = .systemPink
        }
    }
 
    func configure(_ theme: ThemeModel) {
        self.emojiLabel.text = theme.emoji
        self.titleLabel.text = theme.title
        self.countLabel.text = "\(theme.count)"
    }
    
}
