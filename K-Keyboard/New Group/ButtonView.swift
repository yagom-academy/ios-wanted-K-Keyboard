//
//  buttonView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/02.
//

import UIKit

class ButtonView: UIView {
    var buttonDelegate: ButtonView?
    
    let buyButton : UIButton = {
        let buyButton = UIButton()
        buyButton.setTitle("구매하기", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.backgroundColor = UIColor(hex: "#FF417D", alpha: 1)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.layer.cornerRadius = 15
        buyButton.addTarget(self, action: #selector(imageAlert), for: .touchDown)

        return buyButton
    }()
    @objc func imageAlert(_ sender: Any){
        print("구매하기버튼눌려짐")
//        let showAlert = UIAlertController(title: "", message: "N젬이 부족해요\n빠르게 충전해 보세요!", preferredStyle: .alert)
//        let imageView = UIImageView(frame: CGRect(x: 80, y: 50, width: 100, height: 100))
//        imageView.image = UIImage(named: "01")
//        showAlert.view.addSubview(imageView)
//        
//        let height = NSLayoutConstraint(item: showAlert.view!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 320)
//        let width = NSLayoutConstraint(item: showAlert.view!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
//        showAlert.view.addConstraint(height)
//        showAlert.view.addConstraint(width)
//        showAlert.addAction(UIAlertAction(title: "충전하고 바로 사용하기", style: .default, handler: { action in
//            print("충전하고 바로 사용하기")
//        }))
//        self.present(showAlert, animated: true, completion: nil)
//        
        //        let g = MainViewController()
        //        g.qiw()
        
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
        ])
    }
    
}
