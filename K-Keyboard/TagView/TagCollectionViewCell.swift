//
//  CollectionViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/09/29.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "TagCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func cellSetting(){
        //        self.backgroundColor = .systemGray
        self.addSubview(title)
        //        self.contentView.layer.cornerRadius = 15
        
        title.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    
    lazy var title: UILabel = {
        let label = UILabel()
        //        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        self.contentView.backgroundColor = UIColor(hex: "#EBEDF5", alpha: 1)
        self.contentView.layer.cornerRadius = 14
        self.contentView.layer.shadowColor = UIColor.black.cgColor
        self.contentView.layer.shadowRadius = 1
        self.contentView.layer.shadowOffset = .zero
        self.contentView.layer.shadowOpacity = 0.6
        
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private func addContentView() {
        contentView.addSubview(title)
    }
}
