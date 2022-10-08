//
//  buttonView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/02.
//

import UIKit

protocol  ButtonViewDelegate {
    func popUpView()
    func addReview()
}

class ButtonView: UIView {
    var buttonDelegate: ButtonViewDelegate?
    
    let textFieldViewButton : UIButton = {
        let textFieldViewButton = UIButton()
        textFieldViewButton.setTitle("리뷰쓰기", for: .normal)
        textFieldViewButton.setTitleColor(.white, for: .normal)
        textFieldViewButton.backgroundColor = UIColor(hex: "#FF417D", alpha: 1)
        textFieldViewButton.translatesAutoresizingMaskIntoConstraints = false
        textFieldViewButton.layer.cornerRadius = 15
        textFieldViewButton.isHidden = true
        
        return textFieldViewButton
    }()
    @objc func addReview(){
        if let text = textFieldView.text,
           !text.isEmpty {
            self.endEditing(true)
            buttonDelegate?.addReview()
        }
    }
    
    let textFieldView : UITextField = {
        let textFieldView = UITextField()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        textFieldView.attributedPlaceholder = NSAttributedString(string: "댓글을 달아주세요", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, .paragraphStyle: centeredParagraphStyle])
        textFieldView.textAlignment = .center
        textFieldView.backgroundColor = UIColor(hex: "#FF417D", alpha: 1)
        textFieldView.layer.cornerRadius = 12
        textFieldView.isHidden = true
        return textFieldView
    }()
    
    let buyButton : UIButton = {
        lazy var buyButton = UIButton()
        buyButton.setTitle("구매하기", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.titleLabel?.font = .appleSDGothicNeo(weight: .bold, size: 14)
        buyButton.backgroundColor = UIColor(hex: "#FF417D", alpha: 1)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.layer.cornerRadius = 20
        
        return buyButton
    }()
    @objc func alertView(){
        buttonDelegate?.popUpView()
    }
    
    let diamond : UIImageView = {
        let diamond = UIImageView(image: UIImage(named: "diamond"))
        diamond.translatesAutoresizingMaskIntoConstraints = false
        return diamond
    }()
    let diamondCount : UILabel = {
        let diamondCount = UILabel()
        diamondCount.text = "5"
        diamondCount.font = .appleSDGothicNeo(weight: .bold, size: 16)
        diamondCount.textColor = UIColor(hex: "#7DC9FC", alpha: 1)
        diamondCount.translatesAutoresizingMaskIntoConstraints = false
        return diamondCount
    }()
    let jamLabel : UILabel = {
        let jamLabel = UILabel()
        jamLabel.text = "0젬 보유중"
        jamLabel.textColor = UIColor(hex: "#FF417D", alpha: 1)
        jamLabel.font = .appleSDGothicNeo(weight: .medium, size: 12)
        jamLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let attributeString = NSMutableAttributedString(string:  jamLabel.text ?? "")
        attributeString.addAttribute(.foregroundColor, value: UIColor(hex: "#919299", alpha: 1), range: ( jamLabel.text! as NSString).range(of: "보유중"))
        jamLabel.attributedText = attributeString
        return jamLabel
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        self.backgroundColor = .white
        self.addSubview(buyButton)
        self.addSubview(diamond)
        self.addSubview(diamondCount)
        self.addSubview(jamLabel)
        self.addSubview(textFieldView)
        self.addSubview(textFieldViewButton)
        textFieldViewButton.addTarget(self, action: #selector(addReview), for: .touchUpInside)
        buyButton.addTarget(self, action: #selector(alertView), for: .touchUpInside)
        constraintCustomView()
    }
    
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buyButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            buyButton.widthAnchor.constraint(equalToConstant: 144),
            buyButton.heightAnchor.constraint(equalToConstant: 40),
            
            diamond.topAnchor.constraint(equalTo: topAnchor,constant: 18),
            diamond.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 18),
            diamond.widthAnchor.constraint(equalToConstant: 11),
            diamond.heightAnchor.constraint(equalToConstant: 11),
            
            diamondCount.centerYAnchor.constraint(equalTo: diamond.centerYAnchor),
            diamondCount.leadingAnchor.constraint(equalTo: diamond.trailingAnchor,constant: 6),
            
            jamLabel.topAnchor.constraint(equalTo: diamond.bottomAnchor, constant: 5),
            jamLabel.leadingAnchor.constraint(equalTo: diamond.leadingAnchor),
            
            textFieldView.centerYAnchor.constraint(equalTo: centerYAnchor),
            textFieldView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            textFieldView.heightAnchor.constraint(equalToConstant: 30),
            
            textFieldViewButton.centerYAnchor.constraint(equalTo: textFieldView.centerYAnchor),
            textFieldViewButton.leadingAnchor.constraint(equalTo: textFieldView.trailingAnchor, constant: 10),
            textFieldViewButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldViewButton.widthAnchor.constraint(equalToConstant: 100),
            textFieldViewButton.heightAnchor.constraint(equalToConstant: 30),        
        ])
    }
    
}

