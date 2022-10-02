//
//  PurchaseReviewTableViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/10/01.
//

import UIKit

class PurchaseReviewTableViewCell: UICollectionViewCell {
    static let identifier = "PurchaseReviewTableViewCell"
    
    lazy var uesrimage : UIImageView = {
        let uesrimage = UIImageView()
        uesrimage.translatesAutoresizingMaskIntoConstraints = false
        return uesrimage
    }()
    
    lazy var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        //        idLabel.numberOfLines =
        idLabel.font = .systemFont(ofSize: 17)
        return idLabel
    }()
    
    //    lazy var infoLabel: UILabel = {
    //        let infoLabel = UILabel()
    //        infoLabel.translatesAutoresizingMaskIntoConstraints = false
    //
    //        infoLabel.font = .systemFont(ofSize: 17)
    //        return infoLabel
    //    }()
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeLabel.font = .systemFont(ofSize: 17)
        return timeLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func cellSetting() {
        //        self.backgroundColor = .gray
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            uesrimage.topAnchor.constraint(equalTo: topAnchor,constant: 13),
            uesrimage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 6),
            //            uesrimage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            idLabel.topAnchor.constraint(equalTo: uesrimage.topAnchor),
            idLabel.leadingAnchor.constraint(equalTo: uesrimage.trailingAnchor,constant: 5),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 50),
            
            timeLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor,constant: 10),
            timeLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            
        ])
    }
    
    private func addContentView() {
        addSubview(uesrimage)
        addSubview(idLabel)
        //        addSubview(infoLabel)
        addSubview(timeLabel)
    }
    
}
