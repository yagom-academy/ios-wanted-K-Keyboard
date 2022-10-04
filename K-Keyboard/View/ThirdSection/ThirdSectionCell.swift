//
//  ThirdSectionCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/03.
//

import UIKit

class ThirdSectionCell: UITableViewCell {

    static let identifier = "section3"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        label.attributedText = NSMutableAttributedString(string: "이런 키워드에 반응해요", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    lazy var tagCollectionView: UICollectionView = TagCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ThirdSectionCell {
    func addViews() {
        [titleLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setConstraints() {
        [titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 31),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
}
