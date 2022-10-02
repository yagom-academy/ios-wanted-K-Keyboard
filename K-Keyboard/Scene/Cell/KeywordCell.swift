//
//  KeywordCell.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/02.
//

import UIKit

struct Keyword {
    let title: String
    let imageName: String
}

final class KeywordCell: UICollectionViewCell {
    @IBOutlet private weak var keywordImageView: UIImageView!
    @IBOutlet private weak var keywordTitle: UILabel!

    
    func configure(_ keyword: Keyword) {
        self.keywordImageView.image = UIImage(named: keyword.imageName)
        self.keywordTitle.text = keyword.title
    }
    
    
}
