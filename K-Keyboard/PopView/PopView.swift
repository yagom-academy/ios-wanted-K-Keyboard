//
//  ButtonViewView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/04.
//

import UIKit

extension NSNotification.Name {
    static let purchaseButtonClick = Notification.Name("purchaseButtonClick")
}
class PopView: UIView {
    @Published var purchaseAndUseButtonSelected: Bool = false
    lazy var buyButton : UIButton = {
        let buyButton = UIButton()
        buyButton.setTitle("충전하고 바로 사용하기", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = UIColor(hex: "#FF417D", alpha: 1)
        buyButton.titleLabel?.font = .appleSDGothicNeo(weight: .bold, size: 14)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.layer.cornerRadius = 21
        buyButton.addTarget(self, action: #selector(alertView), for: .touchDown)
        return buyButton
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = "N젬이 부족해요\n빠르게 충전해 보세요!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .appleSDGothicNeo(weight: .bold, size: 16)
        label.textColor = UIColor(hex: "#42444C", alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        let attributeString = NSMutableAttributedString(string:  label.text ?? "")
        attributeString.addAttribute(.foregroundColor, value: UIColor(hex: "#7DC9FC", alpha: 1), range: ( label.text! as NSString).range(of: "N젬"))
        label.attributedText = attributeString
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "01")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let jamLabel: UILabel = {
        let label = UILabel()
        label.text = "젬 수량"
        label.textColor = UIColor(hex: "#42444C",alpha: 1)
        label.font = .appleSDGothicNeo(weight: .bold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#42444C",alpha: 1)
        label.font = .appleSDGothicNeo(weight: .bold, size: 14)
        label.text = "결제 금액"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "₩ 1,100"
        label.font = .appleSDGothicNeo(weight: .medium, size: 14)
        label.textColor = UIColor(hex: "#FF417D",alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let diamond : UIImageView = {
        let diamond = UIImageView(image: UIImage(named: "diamond"))
        diamond.translatesAutoresizingMaskIntoConstraints = false
        return diamond
    }()
    
    let left : UIImageView = {
        let diamond = UIImageView(image: UIImage(named: "left"))
        diamond.translatesAutoresizingMaskIntoConstraints = false
        return diamond
    }()
    
    let right : UIImageView = {
        let diamond = UIImageView(image: UIImage(named: "right"))
        diamond.translatesAutoresizingMaskIntoConstraints = false
        return diamond
    }()
    
    let diamondCount : UILabel = {
        let diamondcount = UILabel()
        diamondcount.text = "5"
        diamondcount.font = .appleSDGothicNeo(weight: .bold, size: 14)
        diamondcount.textColor = UIColor(hex: "#7DC9FC", alpha: 1)
        diamondcount.translatesAutoresizingMaskIntoConstraints = false
        return diamondcount
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        self.addSubview(title)
        self.addSubview(imageView)
        self.addSubview(jamLabel)
        self.addSubview(amountLabel)
        self.addSubview(priceLabel)
        self.addSubview(left)
        self.addSubview(right)
        self.addSubview(diamond)
        self.addSubview(diamondCount)
        self.addSubview(buyButton)
        self.backgroundColor = .white
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 8),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            jamLabel.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 16),
            jamLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            
            left.centerYAnchor.constraint(equalTo: jamLabel.centerYAnchor),
            left.leadingAnchor.constraint(equalTo: jamLabel.trailingAnchor,constant: 82),
            left.widthAnchor.constraint(equalToConstant: 6),
            left.widthAnchor.constraint(equalToConstant: 12),
            
            diamond.centerYAnchor.constraint(equalTo: jamLabel.centerYAnchor),
            diamond.leadingAnchor.constraint(equalTo: left.trailingAnchor,constant: 24),
            diamond.widthAnchor.constraint(equalToConstant: 16),
            diamond.heightAnchor.constraint(equalToConstant: 13),
            
            diamondCount.centerYAnchor.constraint(equalTo: jamLabel.centerYAnchor),
            diamondCount.leadingAnchor.constraint(equalTo: diamond.trailingAnchor,constant: 4),
            
            right.centerYAnchor.constraint(equalTo: jamLabel.centerYAnchor),
            right.leadingAnchor.constraint(equalTo: left.trailingAnchor,constant: 76),
            
            amountLabel.topAnchor.constraint(equalTo: jamLabel.bottomAnchor,constant: 8),
            amountLabel.leadingAnchor.constraint(equalTo: jamLabel.leadingAnchor),
            amountLabel.widthAnchor.constraint(equalToConstant: 55),
            
            priceLabel.centerYAnchor.constraint(equalTo: amountLabel.centerYAnchor),
            priceLabel.centerXAnchor.constraint(equalTo: diamond.centerXAnchor, constant: 6),
            priceLabel.bottomAnchor.constraint(equalTo: amountLabel.bottomAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            buyButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            buyButton.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 20),
            buyButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
            buyButton.widthAnchor.constraint(equalToConstant: 200),
            buyButton.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
    
    @objc func alertView(){
        NotificationCenter.default.post(name: .purchaseButtonClick, object: nil)
        purchaseAndUseButtonSelected = true
    }
}
