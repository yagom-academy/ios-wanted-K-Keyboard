//
//  PurchaseReviewTableViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/10/01.
//

import UIKit

class PurchaseReviewTableViewCell: UICollectionViewCell {
   
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
    
    static let identifier = "PurchaseReviewTableViewCell"
    
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
        
        idLabel.backgroundColor = .red
        idLabel.layer.cornerRadius = 15
        idLabel.layer.shadowColor = UIColor.black.cgColor
        idLabel.layer.shadowRadius = 1
        idLabel.layer.shadowOffset = .zero
        idLabel.layer.shadowOpacity = 0.6
        idLabel.textColor = UIColor(hex: "#42444C")
        return idLabel
    }()
    
        lazy var infoLabel: UILabel = {
            let infoLabel = UILabel()
            infoLabel.translatesAutoresizingMaskIntoConstraints = false
            infoLabel.font = .appleSDGothicNeo(weight: .regular, size: 14)
            infoLabel.textColor = UIColor(hex: "#50535C",alpha: 1)
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func cellSetting() {
                self.backgroundColor = .gray
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            uesrImage.topAnchor.constraint(equalTo: topAnchor,constant: 13),
            uesrImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22),
            uesrImage.bottomAnchor.constraint(equalTo: bottomAnchor),
//            uesrimage.heightAnchor.constraint(equalToConstant: 48),
            uesrImage.widthAnchor.constraint(equalToConstant: 48),
            
            idLabel.topAnchor.constraint(equalTo: uesrImage.topAnchor),
            idLabel.leadingAnchor.constraint(equalTo: uesrImage.trailingAnchor,constant: 15),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor,constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
//            timeLabel.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriotionLabel.topAnchor.constraint(equalTo: timeLabel.topAnchor),
            descriotionLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor,constant: 4),
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
    }
    
}
