//
//  itemCell.swift
//  K-Keyboard
//
//  Created by 박호현 on 2022/09/29.
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var itemCellImageView: UIImageView!
    @IBOutlet var TItleLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        changeTextColor()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func changeTextColor() {
        guard let text = detailLabel.text else { return }
        let atrributeString = NSMutableAttributedString(string: text)
        atrributeString.addAttribute(.foregroundColor, value: UIColor(named: "all_sub_dark_gray"), range: (text as NSString).range(of: "명이참여했어요!"))
        detailLabel.attributedText = atrributeString
    }
    
}
