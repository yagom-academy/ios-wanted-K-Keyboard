//
//  ThirdCollectionViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit

class KeyWordViewCell: UICollectionViewCell {
    
    static let identifier = "KeyWordViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    required init?(coder: NSCoder) {
         fatalError()
    }
    func cellSetting(){
//        self.backgroundColor = .green
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -12),
//            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -20),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 15.87),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 45),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 44),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -9),
        ])
    }

    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
    
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let label = UIImageView()
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.backgroundColor = .brown
//        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    
    
    
    private func addContentView() {
        contentView.addSubview(title)
//        contentView.addSubview(second)
//        contentView.addSubview(Date)
        contentView.addSubview(imageView)
    }
}
