//
//  PurchaseReviewTableViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/10/06.
//

import UIKit

class PurchaseReviewTableViewCell: UITableViewCell {
    
    static let identifier = "PurchaseReviewTableViewCell"
    
    var model: PurchasReviewModel? {
        didSet {
            guard let model else {return}
            idLabel.text = model.idLabel
            userImage.image = model.uesrImage
            createrView.isHidden = !model.isCreater
            contentLabel.text = model.infoLabel
            timeLabel.text = model.timeLabel
            descriptionLabel.text = model.declaration
        }
    }
    lazy var messageView : UIView = {
        let message = UIView()
        message.backgroundColor = UIColor(hex: "#F2F3F7", alpha: 1)
        message.layer.cornerRadius = 15
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    lazy var userImage : UIImageView = {
        let uesrImage = UIImageView()
        uesrImage.translatesAutoresizingMaskIntoConstraints = false
        return uesrImage
    }()
    lazy var createrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let label = UILabel()
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.text = "크리에이터"
        label.font = .appleSDGothicNeo(weight: .medium, size: 10)
        label.textColor = .white
        view.backgroundColor = UIColor(hex: "#FF417D",alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    lazy var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.font = .appleSDGothicNeo(weight: .medium, size: 12)
        idLabel.numberOfLines = 0
        idLabel.textColor = UIColor(hex: "#42444C")
        idLabel.numberOfLines = 0
        return idLabel
    }()
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .appleSDGothicNeo(weight: .regular, size: 14)
        label.textColor = UIColor(hex: "#50535C",alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = .appleSDGothicNeo(weight: .regular, size: 12)
        timeLabel.textColor = UIColor(hex: "#919299",alpha: 1)
        return timeLabel
    }()
    lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = .appleSDGothicNeo(weight: .bold, size: 12)
        description.textColor = UIColor(hex: "#919299",alpha: 1)
        return description
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cellSetting()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func cellSetting() {
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        messageView.addSubview(idLabel)
        messageView.addSubview(contentLabel)
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: topAnchor,constant: 13),
            userImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 6),
            userImage.heightAnchor.constraint(equalToConstant: 48),
            userImage.widthAnchor.constraint(equalToConstant: 48),
            
            createrView.topAnchor.constraint(equalTo: userImage.topAnchor,constant: 38),
            createrView.centerXAnchor.constraint(equalTo: userImage.centerXAnchor),
            createrView.widthAnchor.constraint(equalToConstant: 58),
            createrView.heightAnchor.constraint(equalToConstant: 20),
            
            messageView.topAnchor.constraint(equalTo: userImage.topAnchor),
            messageView.leadingAnchor.constraint(equalTo: userImage.trailingAnchor,constant: 16),
            messageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            
            idLabel.topAnchor.constraint(equalTo: messageView.topAnchor,constant: 6),
            idLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor,constant: 12),
            idLabel.trailingAnchor.constraint(lessThanOrEqualTo: messageView.trailingAnchor, constant: -12),
            
            contentLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor,constant: 3),
            contentLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor),
            contentLabel.trailingAnchor.constraint(lessThanOrEqualTo: messageView.trailingAnchor, constant: -12),
            contentLabel.bottomAnchor.constraint(equalTo: messageView.bottomAnchor, constant: -6),
            
            timeLabel.topAnchor.constraint(equalTo: messageView.bottomAnchor,constant: 6),
            timeLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor,constant: 12),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor,constant: 12),
            descriptionLabel.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
        ])
    }
    private func addContentView() {
        addSubview(userImage)
        addSubview(idLabel)
        addSubview(contentLabel)
        addSubview(timeLabel)
        addSubview(descriptionLabel)
        addSubview(messageView)
        addSubview(createrView)
    }
}

