//
//  ThemaCollectionViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/10/02.
//

import UIKit

class ThemaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ThemaCollectionViewCell"
    
    var isActivated : Bool = false {
        didSet {
            if isActivated {
                feel.textColor = UIColor(hex: "#FF417D",alpha: 1)
                count.textColor = UIColor(hex: "#FF417D",alpha: 1)
            } else {
                feel.textColor = UIColor(hex: "#919299",alpha: 1)
                count.textColor = UIColor(hex: "#919299", alpha: 1)
            }
        }
    }
    
    lazy var imoge: UILabel = {
        let imoge = UILabel()
        imoge.font = .appleSDGothicNeo(weight: .regular, size: 30)
        imoge.translatesAutoresizingMaskIntoConstraints = false
        return imoge
    }()
    lazy var feel: UILabel = {
        let feel = UILabel()
        feel.translatesAutoresizingMaskIntoConstraints = false
        feel.font = .appleSDGothicNeo(weight: .regular, size: 12)
        feel.numberOfLines = 0
        feel.textColor = UIColor(hex: "#919299",alpha: 1)
        return feel
    }()
    lazy var count: UILabel = {
        let count = UILabel()
        count.translatesAutoresizingMaskIntoConstraints = false
        count.font = .appleSDGothicNeo(weight: .regular, size: 10)
        count.textColor = UIColor(hex: "#919299", alpha: 1)
        return count
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cellSetting()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func cellSetting() {
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            imoge.topAnchor.constraint(equalTo: topAnchor),
            imoge.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            feel.topAnchor.constraint(equalTo: imoge.bottomAnchor,constant: 8),
            feel.centerXAnchor.constraint(equalTo: imoge.centerXAnchor),
            
            count.topAnchor.constraint(equalTo: feel.bottomAnchor,constant: 0),
            count.centerXAnchor.constraint(equalTo: feel.centerXAnchor),
            count.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    private func addContentView() {
        contentView.addSubview(imoge)
        contentView.addSubview(feel)
        contentView.addSubview(count)
    }
}
