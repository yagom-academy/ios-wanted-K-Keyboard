//
//  ReviewCell.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/04.
//

import UIKit

enum UserType {
    case creater
    case user
}

struct ReviewModel {
    let userType: UserType
    let nickname: String
    let content: String
}

protocol ReviewProtocol: AnyObject {
    func reportButtonDidTap()
}

final class ReviewCell: UICollectionViewCell {
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var reportButton: UIButton!
    @IBOutlet private weak var createrBadge: UIView!
    
    weak var delegate: ReviewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.reportButton.addTarget(self, action: #selector(reportButtonDidTap(_:)), for: .touchUpInside)
    }
    
    func configure(_ review: ReviewModel) {
        switch review.userType {
        case .creater:
            reportButton.isHidden = true
            createrBadge.isHidden = false
        case .user:
            reportButton.isHidden = false
            createrBadge.isHidden = true
        }
        self.profileImageView.image = UIImage(systemName: "person.circle.fill")
        self.nicknameLabel.text = review.nickname
        self.contentLabel.text = review.content
    }
    
    @objc func reportButtonDidTap(_ sender: UIButton) {
        delegate?.reportButtonDidTap()
    }
    
}
