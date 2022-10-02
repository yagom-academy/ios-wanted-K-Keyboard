//
//  TagCell.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/02.
//

import UIKit

final class TagCell: UICollectionViewCell {
   
    @IBOutlet private weak var titleLabel: UILabel!
 
    func configure(title: String) {
        self.titleLabel.text = title
    }
}
