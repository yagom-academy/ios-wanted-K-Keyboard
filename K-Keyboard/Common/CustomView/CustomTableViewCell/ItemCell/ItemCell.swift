//
//  itemCell.swift
//  K-Keyboard
//
//  Created by 박호현 on 2022/09/29.
//

import UIKit

class ItemCell: UITableViewCell {
    static var identifier: String { String(describing: self) }
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var buyerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func set(data: ItemData) {
        self.itemImageView.image = UIImage(named: data.image)
        self.titleLabel.text = data.title
        self.creatorLabel.text = data.creator
        self.buyerLabel.text = "\(String(describing: data.numberOfBuyer))명이참여했어요!"
        
        changeTextColor()
    }
    
    private func changeTextColor() {
        guard let text = buyerLabel.text else { return }
        let atrributeString = NSMutableAttributedString(string: text)
        atrributeString.addAttribute(.foregroundColor, value: UIColor(named: "all_sub_dark_gray") as Any, range: (text as NSString).range(of: "명이참여했어요!"))
        buyerLabel.attributedText = atrributeString
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.itemImageView.image = nil
        self.titleLabel.text = ""
        self.creatorLabel.text = ""
        self.buyerLabel.text = ""
    }
    
}
