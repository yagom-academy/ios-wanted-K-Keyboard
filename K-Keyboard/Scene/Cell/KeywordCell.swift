//
//  KeywordCell.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/02.
//

import UIKit

struct KeywordModel {
    let title: String
    let imageName: String
}

final class KeywordCell: UICollectionViewCell {
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet private weak var keywordImageView: UIImageView!
    @IBOutlet private weak var keywordTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setViewShadow(backView: backView)
    }
    
    func configure(_ keyword: KeywordModel) {
        self.keywordImageView.image = UIImage(named: keyword.imageName)
        self.keywordTitle.text = keyword.title
    }
    
    
}
