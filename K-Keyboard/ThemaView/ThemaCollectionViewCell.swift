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
//        let attributeString = NSMutableAttributedString(string:  feel.text ?? "")
//        attributeString.addAttribute(.foregroundColor, value: UIColor(hex: "#FF417D", alpha: 1), range: ( feel.text! as NSString).range(of: "심쿵했어요"))
//        feel.attributedText = attributeString
        
        return feel
    }()
    lazy var count: UILabel = {
        let count = UILabel()
        count.translatesAutoresizingMaskIntoConstraints = false
        count.font = .appleSDGothicNeo(weight: .regular, size: 10)
        count.textColor = UIColor(hex: "#919299", alpha: 1)
//        let attributeString = NSMutableAttributedString(string:  count.text ?? "")
//        attributeString.addAttribute(.foregroundColor, value: UIColor(hex: "#FF417D", alpha: 1), range: ( count.text! as NSString).range(of: "1"))
//        count.attributedText = attributeString
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
//                self.backgroundColor = .gray
        addContentView()
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            imoge.topAnchor.constraint(equalTo: topAnchor),
            imoge.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 21),
            imoge.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0),
            
            feel.topAnchor.constraint(equalTo: imoge.bottomAnchor,constant: 3),
            feel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 6),
            feel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            count.topAnchor.constraint(equalTo: feel.bottomAnchor,constant: 3),
            count.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 30),
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
