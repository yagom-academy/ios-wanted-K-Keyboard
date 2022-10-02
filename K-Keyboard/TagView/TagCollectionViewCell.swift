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
        self.backgroundColor = .green
        self.addSubview(title)
        self.addSubview(second)
        
        title.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        //        second.topAnchor.constraint(equalTo: self.title.bottomAnchor).isActive = true
        //        second.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        //        second.leadingAnchor.constraint(equalTo: self.title.trailingAnchor).isActive = true
        //        second.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    lazy var second: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    lazy var Date: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private func addContentView() {
        contentView.addSubview(title)
        contentView.addSubview(second)
        contentView.addSubview(Date)
    }
}
