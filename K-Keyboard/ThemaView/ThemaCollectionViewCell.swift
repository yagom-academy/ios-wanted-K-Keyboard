//
//  ThemaCollectionViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/10/02.
//

import UIKit

class ThemaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ThemaCollectionViewCell"
    
    
    lazy var imoge: UILabel = {
        let imoge = UILabel()
        imoge.translatesAutoresizingMaskIntoConstraints = false
        return imoge
    }()
    lazy var feel: UILabel = {
        let feel = UILabel()
        feel.translatesAutoresizingMaskIntoConstraints = false
        feel.numberOfLines = 1
        feel.font = .systemFont(ofSize: 17)
        return feel
    }()
    lazy var count: UILabel = {
        let count = UILabel()
        count.translatesAutoresizingMaskIntoConstraints = false
        
        count.font = .systemFont(ofSize: 17)
        return count
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func cellSetting() {
        //        self.backgroundColor = .gray
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            imoge.topAnchor.constraint(equalTo: topAnchor),
            imoge.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0),
            imoge.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0),
            
            feel.topAnchor.constraint(equalTo: imoge.bottomAnchor,constant: 2),
            feel.leadingAnchor.constraint(equalTo: imoge.leadingAnchor),
            feel.trailingAnchor.constraint(equalTo: imoge.trailingAnchor),
            
            count.topAnchor.constraint(equalTo: feel.bottomAnchor,constant: 3),
            count.leadingAnchor.constraint(equalTo: feel.leadingAnchor),
            count.trailingAnchor.constraint(equalTo: feel.trailingAnchor),
            count.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            
            
        ])
    }
    
    private func addContentView() {
        contentView.addSubview(imoge)
        contentView.addSubview(feel)
        contentView.addSubview(count)
    }
    
}
