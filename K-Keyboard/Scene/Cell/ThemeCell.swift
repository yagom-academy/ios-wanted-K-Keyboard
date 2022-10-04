//
//  ThemeCell.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/04.
//

import UIKit

class ThemeCell: UICollectionViewCell {
    
    @IBOutlet private weak var emojiLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    
    func configure(_ theme: ThemeModel) {
        self.emojiLabel.text = theme.emoji
        self.titleLabel.text = theme.title
        self.countLabel.text = "\(theme.count)"
    }
    
}
