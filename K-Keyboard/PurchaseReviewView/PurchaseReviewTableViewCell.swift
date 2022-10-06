//
//  PurchaseReviewTableViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/10/06.
//

import UIKit

class PurchaseReviewTableViewCell: UITableViewCell {
    
    static let identifier = "PurchaseReviewTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //        cellSetting()
        // Configure the view for the selected state
    }
    
    var model: PurchasReviewModel? {
        didSet {
            guard let model else {return}
            idLabel.text = model.idLabel
            uesrImage.image = model.uesrImage
            infoLabel.text = model.infoLabel
            timeLabel.text = model.timeLabel
            descriotionLabel.text = model.declaration
            
            
        }
    }
    lazy var messageView : UIView = {
        let message = UIView()
        message.backgroundColor = UIColor(hex: "#F2F3F7", alpha: 1)
        message.layer.cornerRadius = 15
        message.layer.shadowColor = UIColor.black.cgColor
        message.layer.shadowRadius = 1
        message.layer.shadowOffset = .zero
        message.layer.shadowOpacity = 0.6
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    lazy var uesrImage : UIImageView = {
        let uesrImage = UIImageView()
        uesrImage.translatesAutoresizingMaskIntoConstraints = false
        return uesrImage
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
    
    lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.font = .appleSDGothicNeo(weight: .regular, size: 14)
        infoLabel.textColor = UIColor(hex: "#50535C",alpha: 1)
        infoLabel.numberOfLines = 0
        return infoLabel
    }()
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = .appleSDGothicNeo(weight: .regular, size: 12)
        timeLabel.textColor = UIColor(hex: "#919299",alpha: 1)
        return timeLabel
    }()
    lazy var descriotionLabel: UILabel = {
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
    
    //    override init(frame: CGRect) {
    //        super.init(frame: frame)
    //        self.cellSetting()
    //    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func cellSetting() {
        //                self.backgroundColor = .gray
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        messageView.addSubview(idLabel)
        messageView.addSubview(infoLabel)
        NSLayoutConstraint.activate([
            uesrImage.topAnchor.constraint(equalTo: topAnchor,constant: 13),
            uesrImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 6),
            //            uesrImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            uesrImage.heightAnchor.constraint(equalToConstant: 48),
            uesrImage.widthAnchor.constraint(equalToConstant: 48),
            
            messageView.topAnchor.constraint(equalTo: uesrImage.topAnchor),
            messageView.leadingAnchor.constraint(equalTo: uesrImage.trailingAnchor,constant: 16),
            messageView.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor,constant: 12),
            messageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16),
            messageView.heightAnchor.constraint(equalToConstant: 54),
            
            idLabel.topAnchor.constraint(equalTo: messageView.topAnchor,constant: 6),
            idLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor,constant: 12),
            idLabel.trailingAnchor.constraint(greaterThanOrEqualTo: messageView.trailingAnchor, constant: 12),
            //            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor,constant: 3),
            infoLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: messageView.bottomAnchor,constant: 6),
            timeLabel.leadingAnchor.constraint(equalTo: uesrImage.trailingAnchor,constant: 28),
            //            timeLabel.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriotionLabel.topAnchor.constraint(equalTo: timeLabel.topAnchor),
            descriotionLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor,constant: 12),
            //            de.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            descriotionLabel.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor),
            
        ])
    }
    
    private func addContentView() {
        addSubview(uesrImage)
        addSubview(idLabel)
        addSubview(infoLabel)
        addSubview(timeLabel)
        addSubview(descriotionLabel)
        addSubview(messageView)
        
    }
    
}

