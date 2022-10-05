//
//  TagItemCell.swift
//  K-Keyboard
//
//  Created by 박호현 on 2022/10/04.
//

import UIKit

class TagItemCell: UICollectionViewCell {
    static var identifier: String { String(describing: self) }
    
    @IBOutlet var tagButton: UIButton!
//    @IBOutlet var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(data: TagData) {
        tagButton.setTitle(data.tag, for: .normal)
//        tagLabel.text = data.tag
    }
}


//tags: [
//    TagData(tag: "이벤트")
