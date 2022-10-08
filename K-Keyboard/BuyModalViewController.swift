//
//  BuyModalView.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/08.
//

import UIKit

class BuyModalViewController: UIViewController, ViewRepresent {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let modalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "emoji1")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionLabel: UILabel  = {
        let view = UILabel()
        view.text = "N젬이 부족해요\n빠르게 충전해 보세요!"
        view.numberOfLines = 0
        view.textAlignment = .center
        view.asFontColor(targetString: "N젬", font: nil, color: UIColor.customBlue())
        view.font = .NotoSanKR(weight: .Bold, size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gemCountLabel: UILabel = {
        let view = UILabel()
        view.text = "젬 수량"
        view.font = .NotoSanKR(weight: .Bold, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gemPaymentLabel: UILabel = {
        let view = UILabel()
        view.text = "결제 금액"
        view.font = .NotoSanKR(weight: .Bold, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gemDecreaseButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "decrease"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gemImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "diamond")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let gemLabel: UILabel = {
        let view = UILabel()
        view.text = "5"
        view.font = .NotoSanKR(weight: .Bold, size: 14)
        view.textColor = .customBlue()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gemIncreaseButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "increase"), for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let gemPriceLabel: UILabel = {
        let view = UILabel()
        view.text = "₩ 1,100"
        view.font = .NotoSanKR(weight: .Medium, size: 14)
        view.textColor = .customPink()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let chargeButton: UIButton = {
       let view = UIButton()
        view.setTitle("충전하고 바로 사용하기", for: .normal)
        view.titleLabel?.font = .NotoSanKR(weight: .Bold, size: 14)
        view.layer.cornerRadius = 20
        view.backgroundColor = .customPink()
        view.addTarget(nil, action: #selector(purchase), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.addSubview(backgroundView)
        view.addSubview(modalView)
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTabbed))
        backgroundView.addGestureRecognizer(tabGesture)
        
        [imageView, descriptionLabel,gemCountLabel,gemDecreaseButton,gemImageView,gemLabel,gemIncreaseButton,gemPaymentLabel,gemPriceLabel,chargeButton].forEach {
            modalView.addSubview($0)
        }
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            modalView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            modalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            modalView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 330/812),
            
            imageView.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 24),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            
            gemCountLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 40),
            gemCountLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            
            gemDecreaseButton.leadingAnchor.constraint(equalTo: gemCountLabel.trailingAnchor, constant: 82),
            gemDecreaseButton.centerYAnchor.constraint(equalTo: gemCountLabel.centerYAnchor),
            
            gemImageView.leadingAnchor.constraint(equalTo: gemDecreaseButton.trailingAnchor,constant: 24),
            gemImageView.centerYAnchor.constraint(equalTo: gemDecreaseButton.centerYAnchor),
            gemImageView.widthAnchor.constraint(equalToConstant: 16),
            gemImageView.heightAnchor.constraint(equalToConstant: 16),
            
            gemLabel.leadingAnchor.constraint(equalTo: gemImageView.trailingAnchor,constant: 6),
            gemLabel.centerYAnchor.constraint(equalTo: gemImageView.centerYAnchor),
            
            gemIncreaseButton.leadingAnchor.constraint(equalTo: gemLabel.trailingAnchor,constant: 24),
            gemIncreaseButton.centerYAnchor.constraint(equalTo: gemDecreaseButton.centerYAnchor),
            
            gemPaymentLabel.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 40),
            gemPaymentLabel.topAnchor.constraint(equalTo: gemCountLabel.bottomAnchor, constant: 8),
            
            gemPriceLabel.leadingAnchor.constraint(equalTo: gemPaymentLabel.trailingAnchor, constant: 90),
            gemPriceLabel.centerYAnchor.constraint(equalTo: gemPaymentLabel.centerYAnchor),
            
            chargeButton.bottomAnchor.constraint(equalTo: modalView.bottomAnchor, constant: -16),
            chargeButton.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            chargeButton.widthAnchor.constraint(equalTo: modalView.widthAnchor, multiplier: 200/295),
            chargeButton.heightAnchor.constraint(equalTo: modalView.heightAnchor, multiplier: 42/330)
            
        ])
    }
    
    @objc func purchase() {
        UserDefaults.standard.set(true, forKey: "isPurchased")
        NotificationCenter.default.post(name: NSNotification.Name("purchased"), object: nil, userInfo: nil)
        self.dismiss(animated: true)
    }
    
    @objc func backgroundTabbed(sender: UITapGestureRecognizer) {
        self.dismiss(animated: false)
    }
}
