//
//  FavoritesView.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/08.
//

import UIKit

class FavoritesView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        label.attributedText = NSMutableAttributedString(string: "자주 쓰는 말", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("coder:")
    }
}

extension FavoritesView {
    func addViews() {
        [titleLabel].forEach { self.addSubview($0) }
    }
    
    func setConstraints() {
        [titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
