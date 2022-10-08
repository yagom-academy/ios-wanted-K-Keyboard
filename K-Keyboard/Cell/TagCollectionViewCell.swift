//
//  TagCollectionViewCell.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/07.
//

import UIKit


class TagCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TagCollectionViewCell"

    let tagNameLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = .NotoSanKR(weight: .Medium, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tagNameLabel)
        self.isUserInteractionEnabled = true
        layer.cornerRadius = frame.height / 2
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tagNameLabel.topAnchor.constraint(equalTo: topAnchor),
            tagNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            tagNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            tagNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
        let cell = TagCollectionViewCell()
        cell.configure(name: name)
        
        let targetSize = CGSize(width: cell.tagNameLabel.frame.width + 22, height: availableHeight)
        return targetSize
    }
    
    func configure(name: String?) {
        tagNameLabel.text = name
        tagNameLabel.sizeToFit()
    }
}
