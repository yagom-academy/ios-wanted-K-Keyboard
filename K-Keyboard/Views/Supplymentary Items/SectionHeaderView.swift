//
//  SectionHeaderView.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let elementKind = "section-header"
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        label.font = .preferredFont(forTextStyle: .title3)
        return label
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.adjustsFontForContentSizeCategory = true
         label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
         return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(_ title: String, _ count: Int?) {
        titleLabel.text = title
        if let count = count {
            addSubview(countLabel)
            countLabel.text = String(count)
            NSLayoutConstraint.activate([
                countLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
                countLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 15)
            ])
        }
    }
}

extension SectionHeaderView {
    func configure() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5)
        ])
    }
}
