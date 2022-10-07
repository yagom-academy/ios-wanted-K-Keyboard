//
//  ReviewTableViewCell.swift
//  K-Keyboard
//
//  Created by 유영훈 on 2022/10/06.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    var profileImageView: UIImageView!
    var profileTagLabel: UIButton!
    var contentbackgroundView: UIView!
    var userNameLabel: UILabel!
    var reviewContentLabel: UILabel!
    var writeBeforeLabel: UILabel!
    var reportButton: UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
        self.addSubview(profileImageView)
        self.addSubview(profileTagLabel)
        self.addSubview(contentbackgroundView)
        self.addSubview(writeBeforeLabel)
        self.addSubview(reportButton)
        contentbackgroundView.addSubview(userNameLabel)
        contentbackgroundView.addSubview(reviewContentLabel)
        
        var const = [NSLayoutConstraint]()
        defer { NSLayoutConstraint.activate(const) }
        const += [
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            profileImageView.widthAnchor.constraint(equalToConstant: 48),
            profileImageView.heightAnchor.constraint(equalToConstant: 48),
            
            profileTagLabel.widthAnchor.constraint(equalToConstant: 58),
            profileTagLabel.heightAnchor.constraint(equalToConstant: 20),
            profileTagLabel.centerYAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 0),
            profileTagLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor, constant: 0),
            
            contentbackgroundView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            contentbackgroundView.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0),
            contentbackgroundView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            contentbackgroundView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -22),
            contentbackgroundView.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
            userNameLabel.topAnchor.constraint(equalTo: contentbackgroundView.topAnchor, constant: 6),
            userNameLabel.leadingAnchor.constraint(equalTo: contentbackgroundView.leadingAnchor, constant: 12),
            userNameLabel.heightAnchor.constraint(equalToConstant: 18),
            
            reviewContentLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 0),
            reviewContentLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor, constant: 0),
            reviewContentLabel.trailingAnchor.constraint(equalTo: contentbackgroundView.trailingAnchor, constant: -12),
            reviewContentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 27),
            reviewContentLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 27),
            reviewContentLabel.bottomAnchor.constraint(equalTo: contentbackgroundView.bottomAnchor, constant: -6),
            
            writeBeforeLabel.topAnchor.constraint(equalTo: contentbackgroundView.bottomAnchor, constant: 8),
            writeBeforeLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor, constant: 0),
            writeBeforeLabel.heightAnchor.constraint(equalToConstant: 20),
            writeBeforeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            
            reportButton.leadingAnchor.constraint(equalTo: writeBeforeLabel.trailingAnchor, constant: 12),
            reportButton.topAnchor.constraint(equalTo: writeBeforeLabel.topAnchor, constant: 0),
            reportButton.heightAnchor.constraint(equalToConstant: 20),
        ]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        
        profileImageView = UIImageView()
        profileImageView.image = UIImage(named: "profile.png")!
        
        profileTagLabel = UIButton()
        profileTagLabel.setTitle("크리에이터", for: .normal)
        profileTagLabel.backgroundColor = .systemPink
        profileTagLabel.tintColor = .white
        profileTagLabel.titleLabel!.font = UIFont.systemFont(ofSize: 10)
        profileTagLabel.layer.cornerRadius = 10
        profileTagLabel.layer.masksToBounds = true
        
        contentbackgroundView = UIView()
        contentbackgroundView.backgroundColor = UIColor(red: 242/255, green: 243/255, blue: 247/255, alpha: 1.0)
        contentbackgroundView.layer.cornerRadius = 18
        contentbackgroundView.layer.masksToBounds = true
        
        userNameLabel = UILabel()
        userNameLabel.text = "유저 이름"
        userNameLabel.font =  UIFont.systemFont(ofSize: 12)
        
        reviewContentLabel = UILabel()
        reviewContentLabel.lineBreakMode = .byTruncatingTail
        reviewContentLabel.text = "안녕하세요"
        reviewContentLabel.numberOfLines = 0
        reviewContentLabel.font =  UIFont.systemFont(ofSize: 14)
        
        writeBeforeLabel = UILabel()
        writeBeforeLabel.text = "1일"
        writeBeforeLabel.font =  UIFont.systemFont(ofSize: 12)
        writeBeforeLabel.textColor = UIColor(red: 145/255, green: 146/255, blue: 153/255, alpha: 1.0)
        
        reportButton = UIButton(type: .system)
        reportButton.setTitle("신고", for: .normal)
        reportButton.tintColor = UIColor(red: 145/255, green: 146/255, blue: 153/255, alpha: 1.0)
        reportButton.titleLabel!.font = UIFont.systemFont(ofSize: 12)
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileTagLabel.translatesAutoresizingMaskIntoConstraints = false
        contentbackgroundView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewContentLabel.translatesAutoresizingMaskIntoConstraints = false
        writeBeforeLabel.translatesAutoresizingMaskIntoConstraints = false
        reportButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }
}
