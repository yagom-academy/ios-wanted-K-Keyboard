//
//  KeywordCollectionViewCell.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/07.
//

import UIKit

class KeywordCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "KeywordCollectionViewCell"
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "emoji1")
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let keywordLabel: UILabel = {
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
        addSubview(imageView)
        addSubview(keywordLabel)
        backgroundColor = .white
        layer.borderColor = UIColor.customLightGray().cgColor
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 2
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            //imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            //imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imageView.image?.size.height ?? 30),
            
            keywordLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            keywordLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            keywordLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            keywordLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
//    static func fittingSize(availableHeight: CGFloat, name: String?) -> CGSize {
//        let cell = TagCollectionViewCell()
//        cell.configure(name: name)
//
//        let targetSize = CGSize(width: cell.tagNameLabel.frame.width + 22, height: availableHeight)
//        return targetSize
//    }
//
//    func configure(name: String?) {
//        keywordLabel.text = name
//        keywordLabel.sizeToFit()
//    }
}
