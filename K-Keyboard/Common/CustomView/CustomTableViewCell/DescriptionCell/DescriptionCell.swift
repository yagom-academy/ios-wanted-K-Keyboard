//
//  DescriptionCell.swift
//  K-Keyboard
//
//  Created by 박호현 on 2022/10/04.
//

import UIKit

class DescriptionCell: UITableViewCell {
    static var identifier: String { String(describing: self) }

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var textLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(data: NoticeData) {
        self.titleLabel.text = data.title
        self.textLabel2.text = data.text
    }
    
    override func prepareForReuse() {
        self.titleLabel.text = ""
        self.textLabel2.text = ""
    }
    
}
