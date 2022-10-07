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
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.layer.cornerRadius = 15
        buyButton.addTarget(self, action: #selector(alertView), for: .touchDown)
        return buyButton
    }()
    @objc func alertView(){
        NotificationCenter.default.post(name: .purchaseButtonClick, object: nil)
        purchaseAndUseButtonSelected = true
    }
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
        let label = UIImageView()
        label.image = UIImage(named: "01")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        label.textColor = UIColor(hex: "#FF417D",alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let diamond : UIImageView = {
        let diamond = UIImageView(image: UIImage(named: "diamond2"))
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
    let diamondcount : UILabel = {
        let diamondcount = UILabel()
        diamondcount.text = "5"
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
        self.addSubview(diamondcount)
        self.addSubview(buyButton)
        self.backgroundColor = .white
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 96),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -99),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            title.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 8),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            jamLabel.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 16),
            jamLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            
            left.topAnchor.constraint(equalTo: jamLabel.topAnchor),
            left.leadingAnchor.constraint(equalTo: jamLabel.trailingAnchor,constant: 82.09),
            
            diamond.topAnchor.constraint(equalTo: jamLabel.topAnchor),
            diamond.leadingAnchor.constraint(equalTo: left.trailingAnchor,constant: 24),
            
            diamondcount.topAnchor.constraint(equalTo: jamLabel.topAnchor),
            diamondcount.leadingAnchor.constraint(equalTo: diamond.trailingAnchor,constant: 4),
            
            right.topAnchor.constraint(equalTo: jamLabel.topAnchor),
            right.leadingAnchor.constraint(equalTo: diamondcount.trailingAnchor,constant: 24),
            
            amountLabel.topAnchor.constraint(equalTo: jamLabel.bottomAnchor,constant: 8),
            amountLabel.leadingAnchor.constraint(equalTo: jamLabel.leadingAnchor),
            amountLabel.widthAnchor.constraint(equalToConstant: 55),
            
            priceLabel.topAnchor.constraint(equalTo: amountLabel.topAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -62),
            priceLabel.bottomAnchor.constraint(equalTo: amountLabel.bottomAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            buyButton.topAnchor.constraint(equalTo: amountLabel.bottomAnchor,constant: 20),
            buyButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 46),
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -49),
            buyButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])
    }
}
