//
//  buttonView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/02.
//

import UIKit

protocol  ButtonViewDelegate {
    func showAlert()
    func showAlert1()
    }

class ButtonView: UIView {
 var buttonDelegate: ButtonViewDelegate?
    let fif = PurchaseReviewView()
    
    let textFiedViewButton : UIButton = {
        let textFiedViewButton = UIButton()
        textFiedViewButton.setTitle("눌러주세요", for: .normal)
        textFiedViewButton.setTitleColor(.black, for: .normal)
      
        textFiedViewButton.translatesAutoresizingMaskIntoConstraints = false
        textFiedViewButton.isHidden = true
        textFiedViewButton.addTarget(self, action: #selector(bu), for: .touchUpInside)
        return textFiedViewButton
    }()
    @objc func bu(){
        print("왜안돼?")
        buttonDelegate?.showAlert1()
        fif.dataArry.append(.init(uesrImage: UIImage(named: "uesr"), idLabel: "ID", infoLabel: textFiedView.text ?? "", timeLabel: "1초", declaration: "신고"))
        fif.collectionView.reloadData()
    }
    
    let textFiedView : UITextField = {
        let textFiedView = UITextField()
        textFiedView.translatesAutoresizingMaskIntoConstraints = false
        textFiedView.placeholder = "리뷰댓글을 달아주세요"
        textFiedView.backgroundColor = .red
        textFiedView.isHidden = true
        return textFiedView
    }()
    
    let buyButton : UIButton = {
       lazy var buyButton = UIButton()
        buyButton.setTitle("구매하기", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = UIColor(hex: "#FF417D", alpha: 1)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.layer.cornerRadius = 15
        buyButton.addTarget(self, action: #selector(imageAlert), for: .touchUpInside)

        return buyButton
    }()
    @objc func imageAlert(){

        buttonDelegate?.showAlert()
        
    }
        
    let diamond : UIImageView = {
        let diamond = UIImageView(image: UIImage(named: "diamond"))
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
        self.addSubview(diamondcount)
        self.addSubview(jamLabel)
        self.addSubview(textFiedView)
        self.addSubview(textFiedViewButton)
        constraintCustomView()
    }
    
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            buyButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 250),
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            buyButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 4),
           
            diamond.topAnchor.constraint(equalTo: topAnchor,constant: 11),
            diamond.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
//            diamond.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            diamondcount.topAnchor.constraint(equalTo: diamond.topAnchor),
            diamondcount.leadingAnchor.constraint(equalTo: diamond.trailingAnchor,constant: 6.3),
            
            jamLabel.topAnchor.constraint(equalTo: topAnchor,constant: 35),
            jamLabel.leadingAnchor.constraint(equalTo: diamond.leadingAnchor),
            jamLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 11),
            
            textFiedView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            textFiedView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
//            textFiedView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 10),
            
            
            textFiedViewButton.topAnchor.constraint(equalTo: textFiedView.topAnchor),
            textFiedViewButton.leadingAnchor.constraint(equalTo: textFiedView.trailingAnchor,constant: 10),
            textFiedViewButton.widthAnchor.constraint(equalToConstant: 100)
//            textFiedViewButton.trailingAnchor.constraint(equalTo: trailingAnchor),
//            textFiedViewButton.bottomAnchor.constraint(equalTo: textFiedView.bottomAnchor),
        ])
    }
    
}

