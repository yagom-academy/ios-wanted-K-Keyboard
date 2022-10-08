//
//  TagCollectionViewCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/02.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    static let identifier = "tagCell"
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        label.textColor = UIColor(red: 0.294, green: 0.306, blue: 0.341, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraints()
        
        contentView.layer.backgroundColor = UIColor(red: 0.922, green: 0.929, blue: 0.961, alpha: 1).cgColor
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 18
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TagCollectionViewCell {
    func addViews() {
        [tagLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setConstraints() {
        [tagLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tagLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tagLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            tagLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tagLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
