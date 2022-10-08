//
//  ReviewItemCell.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/04.
//

import UIKit

class ReviewItemCell: UITableViewCell {
    static var identifier: String { String(describing: self) }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var creatorView: UIView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var reportButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func set(data: ReviewData) {
        self.profileImageView.image = UIImage(named: data.image)
        self.creatorView.isHidden = data.isCreator == false
        self.userLabel.text = data.name
        self.reviewLabel.text = data.review
        self.timeLabel.text = data.time.description
        self.reportButton.isHidden = data.isCreator
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.profileImageView.image = UIImage(named: "img_profile")
        self.creatorView.isHidden = true
        self.userLabel.text = ""
        self.reviewLabel.text = ""
        self.timeLabel.text = ""
    }
    
}
