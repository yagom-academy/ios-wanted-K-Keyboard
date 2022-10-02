//
//  TagCollectionViewCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/02.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    static let identifier = "tagCell"
    
    var items: [String]?

    let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        label.textColor = UIColor(red: 0.294, green: 0.306, blue: 0.341, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagLabel)
        
        contentView.layer.backgroundColor = UIColor(red: 0.922, green: 0.929, blue: 0.961, alpha: 1).cgColor
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 18
        
        tagLabel.translatesAutoresizingMaskIntoConstraints =  false
        tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tagLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        tagLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
