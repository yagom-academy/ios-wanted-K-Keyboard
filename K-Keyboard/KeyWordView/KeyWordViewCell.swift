//
//  ThirdCollectionViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit

class KeyWordViewCell: UICollectionViewCell {
    
    var model: KeyWordModel? {
        didSet {
            guard let model else {return}
            title.text = model.title
            imageView.image = model.image
        }
    }
    static let identifier = "KeyWordViewCell"
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.font = .appleSDGothicNeo(weight: .medium, size: 14)
        label.textColor = UIColor(hex: "#42444C", alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var imageView: UIImageView = {
        let label = UIImageView()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func cellSetting(){
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowRadius = 1
        self.contentView.layer.shadowOffset = .zero
        self.contentView.layer.shadowOpacity = 0.6
        //        self.backgroundColor = .green
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10.51),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 12),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -12),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 15.87),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -9.56),
        ])
    }
    private func addContentView() {
        contentView.addSubview(title)
        contentView.addSubview(imageView)
    }
}
