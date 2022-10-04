//
//  CardCollectionViewCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/05.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cardCell"
    
    let cardView =  CardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardCollectionViewCell {
    func addViews() {
        [cardView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setConstraints() {
        [cardView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
