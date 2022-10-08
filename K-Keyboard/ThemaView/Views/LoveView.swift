//
//  good2View.swift
//  K-Keyboard
//
//  Created by so on 2022/10/07.
//

import UIKit

class LoveView: UIView {
    var addCount: Int = 0
    var isActivated : Bool = false {
        didSet {
            if isActivated {
                feel.textColor = UIColor(hex: "#FF417D",alpha: 1)
                count.textColor = UIColor(hex: "#FF417D",alpha: 1)
                addCount += 1
                count.text = "\(addCount)"
            } else {
                feel.textColor = UIColor(hex: "#919299",alpha: 1)
                count.textColor = UIColor(hex: "#919299", alpha: 1)
                addCount -= 1
                count.text = "\(addCount)"
            }
        }
    }
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isSelected = isActivated
        button.addTarget(self, action: #selector(change), for: .touchUpInside)
        return button
    }()
    @objc func change(){
        isActivated.toggle()
    }
    lazy var imoge: UILabel = {
        let imoge = UILabel()
        imoge.font = .appleSDGothicNeo(weight: .regular, size: 30)
        imoge.translatesAutoresizingMaskIntoConstraints = false
        imoge.text = "😍"
        return imoge
    }()
    lazy var feel: UILabel = {
        let feel = UILabel()
        feel.translatesAutoresizingMaskIntoConstraints = false
        feel.font = .appleSDGothicNeo(weight: .regular, size: 12)
        feel.numberOfLines = 0
        feel.textColor = UIColor(hex: "#919299",alpha: 1)
        feel.text = "심쿵했어요"
        return feel
    }()
    lazy var count: UILabel = {
        let count = UILabel()
        count.translatesAutoresizingMaskIntoConstraints = false
        count.font = .appleSDGothicNeo(weight: .regular, size: 10)
        count.textColor = UIColor(hex: "#919299", alpha: 1)
        count.text = "\(addCount)"
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
            changeButton.topAnchor.constraint(equalTo: topAnchor),
            
            changeButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            changeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            changeButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    private func addContentView() {
        self.addSubview(imoge)
        self.addSubview(feel)
        self.addSubview(count)
        self.addSubview(changeButton)
    }
}
