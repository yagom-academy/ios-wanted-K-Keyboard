//
//  ReviewTableViewCell.swift
//  K-Keyboard
//
//  Created by 유영훈 on 2022/10/06.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    static let identifier = "ReviewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile.png")!
        return imageView
    }()
    
    let profileTagLabel: UIButton = {
        let button = UIButton()
        button.setTitle("크리에이터", for: .normal)
        button.backgroundColor = .allMainColor()
        button.tintColor = .white
        button.titleLabel!.font = .NotoSanKR(weight: .Regular, size: 10)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        return button
    }()
    
    let contentbackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 242/255, green: 243/255, blue: 247/255, alpha: 1.0)
        view.layer.cornerRadius = 18
        view.layer.masksToBounds = true
        return view
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이름"
        label.font = .NotoSanKR(weight: .Bold, size: 12)
        label.textColor = .allTitleGray()
        return label
    }()
    
    let reviewContentLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byTruncatingTail
        label.text = "안녕하세요"
        label.numberOfLines = 0
        label.textColor = .allDarkGray()
        label.font = .NotoSanKR(weight: .Regular, size: 14)
        return label
    }()
    
    let writeBeforeLabel: UILabel = {
        let label = UILabel()
        label.text = "1일"
        label.font = .NotoSanKR(weight: .Regular, size: 12)
        label.textColor = .allSubDarkGray()
        return label
    }()
    
    let reportButton: UILabel = {
        let view = UILabel()
        view.text = "신고"
        view.font = .NotoSanKR(weight: .Bold, size: 12)
        view.textColor = .allSubDarkGray()
        return view
    }()
    
    func setup() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileTagLabel.translatesAutoresizingMaskIntoConstraints = false
        contentbackgroundView.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewContentLabel.translatesAutoresizingMaskIntoConstraints = false
        writeBeforeLabel.translatesAutoresizingMaskIntoConstraints = false
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        
        [profileImageView, profileTagLabel, contentbackgroundView, writeBeforeLabel, reportButton].forEach {
            addSubview($0)
        }
        contentbackgroundView.addSubview(userNameLabel)
        contentbackgroundView.addSubview(reviewContentLabel)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
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
//            reviewContentLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 27),
            reviewContentLabel.bottomAnchor.constraint(equalTo: contentbackgroundView.bottomAnchor, constant: -6),
            
            writeBeforeLabel.topAnchor.constraint(equalTo: contentbackgroundView.bottomAnchor, constant: 8),
            writeBeforeLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor, constant: 0),
            writeBeforeLabel.heightAnchor.constraint(equalToConstant: 20),
            writeBeforeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
            
            reportButton.leadingAnchor.constraint(equalTo: writeBeforeLabel.trailingAnchor, constant: 12),
            reportButton.topAnchor.constraint(equalTo: writeBeforeLabel.topAnchor, constant: 0),
            reportButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }
}
