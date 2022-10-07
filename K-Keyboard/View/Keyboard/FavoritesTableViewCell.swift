//
//  FavoritesTableViewCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/08.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    static let identifier = "favorites"
    
    let favoriteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        label.textColor = .white
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        label.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .darkGray
        
        addViews()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesTableViewCell {
    func addViews() {
        [favoriteLabel].forEach {
            contentView.addSubview($0)
        }
    }
    func setConstraints() {
        [favoriteLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            favoriteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            favoriteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            favoriteLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            favoriteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
