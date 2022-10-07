//
//  CommentTableViewCell.swift
//  K-Keyboard
//
//  Created by KangMingyo on 2022/10/04.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        return imageView
    }()
    
    let commentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Color.whiteGray.rawValue)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: Color.darkGray.rawValue)
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    let commentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    let reportButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.tintColor = UIColor(named: Color.subDarkGray.rawValue)
        button.setTitle("신고", for: UIControl.State.normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [nicknameLabel, commentLabel].map {
            self.commentStackView.addArrangedSubview($0)
        }

        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(commentView)
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        commentView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        commentView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        commentView.addSubview(commentStackView)
        commentStackView.translatesAutoresizingMaskIntoConstraints = false
        commentStackView.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 6).isActive = true
        commentStackView.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 12).isActive = true
        commentStackView.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -12).isActive = true
        commentStackView.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -6).isActive = true
        commentStackView.centerYAnchor.constraint(equalTo: commentView.centerYAnchor).isActive = true

        addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 6).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 98).isActive = true
        
        addSubview(reportButton)
        reportButton.translatesAutoresizingMaskIntoConstraints = false
        reportButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor).isActive = true
        reportButton.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 12).isActive = true
    }
}


