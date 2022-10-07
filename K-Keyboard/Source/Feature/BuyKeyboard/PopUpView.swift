//
//  PopUpView.swift
//  K-Keyboard
//
//  Created by KangMingyo on 2022/10/01.
//

import UIKit

class PopUpView: UIView {
    
    weak var popUpViewController: PopUpViewController? {
        didSet {
            setupPopUpView()
        }
    }
    
    let superView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.layer.cornerRadius = 20
        return view
    }()
    
    let popUpView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.opacity = 1.0
        view.layer.cornerRadius = 20
        return view
    }()
    
    let funImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Fun")
        return imageView
    }()
    
    let chargeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "N젬이 부족해요\n빠르게 충전해보세요!"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        let attributeString = NSMutableAttributedString(string: label.text!)
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: "Color_theme_info_gem_txt_color"), range: (label.text! as NSString).range(of: "N젬"))
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: "Gray_all_title_gray"), range: (label.text! as NSString).range(of: "N이 부족해요\n빠르게 충전해보세요!"))
        label.attributedText = attributeString
        return label
    }()
    
    let jamNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "젬 수량"
        label.textColor = UIColor(named: "Gray_all_title_gray")
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let leftButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        let image = UIImage(named: "LeftButton")
        button.setImage(image, for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    let diamondImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Diamond")
        return imageView
    }()
    
    let diamondLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = UIColor(named: "Color_theme_info_gem_txt_color")
        return label
    }()
    
    let rightButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        let image = UIImage(named: "RightButton")
        button.setImage(image, for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    let paymentLabel: UILabel = {
        let label = UILabel()
        label.text = "결제 금액"
        label.textColor = UIColor(named: "Gray_all_title_gray")
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let moneyLabel: UILabel = {
        let label = UILabel()
        label.text = "₩1,100"
        label.textColor = UIColor(named: "Color_all_main_color")
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let moneyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 90
        return stackView
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = UIColor(named: "Color_all_main_color")
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.setTitle("충전하고 바로 사용하기", for: UIControl.State.normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(superView)
        superView.translatesAutoresizingMaskIntoConstraints = false
        superView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        superView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        superView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        superView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(popUpView)
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        popUpView.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: 295).isActive = true
        popUpView.heightAnchor.constraint(equalToConstant: 330).isActive = true
        
        popUpView.addSubview(funImageView)
        funImageView.translatesAutoresizingMaskIntoConstraints = false
        funImageView.topAnchor.constraint(equalTo: popUpView.topAnchor, constant: 24).isActive = true
        funImageView.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        funImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        funImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        popUpView.addSubview(chargeLabel)
        chargeLabel.translatesAutoresizingMaskIntoConstraints = false
        chargeLabel.topAnchor.constraint(equalTo: funImageView.bottomAnchor, constant: 8).isActive = true
        chargeLabel.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        
        popUpView.addSubview(jamNumberLabel)
        jamNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        jamNumberLabel.topAnchor.constraint(equalTo: chargeLabel.bottomAnchor, constant: 16).isActive = true
        jamNumberLabel.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 40).isActive = true
        
        popUpView.addSubview(leftButton)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.topAnchor.constraint(equalTo: chargeLabel.bottomAnchor, constant: 16).isActive = true
        leftButton.leadingAnchor.constraint(equalTo: jamNumberLabel.trailingAnchor, constant: 82.09).isActive = true
        
        popUpView.addSubview(diamondImage)
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.topAnchor.constraint(equalTo: chargeLabel.bottomAnchor, constant: 16).isActive = true
        diamondImage.leadingAnchor.constraint(equalTo: leftButton.trailingAnchor, constant: 26).isActive = true
        diamondImage.widthAnchor.constraint(equalToConstant: 15).isActive = true
        diamondImage.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        popUpView.addSubview(diamondLabel)
        diamondLabel.translatesAutoresizingMaskIntoConstraints = false
        diamondLabel.topAnchor.constraint(equalTo: chargeLabel.bottomAnchor, constant: 16).isActive = true
        diamondLabel.leadingAnchor.constraint(equalTo: diamondImage.trailingAnchor, constant: 6).isActive = true
        diamondLabel.centerYAnchor.constraint(equalTo: diamondImage.centerYAnchor).isActive = true
        
        popUpView.addSubview(rightButton)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.topAnchor.constraint(equalTo: chargeLabel.bottomAnchor, constant: 16).isActive = true
        rightButton.leadingAnchor.constraint(equalTo: diamondLabel.trailingAnchor, constant: 24).isActive = true

        popUpView.addSubview(paymentLabel)
        paymentLabel.translatesAutoresizingMaskIntoConstraints = false
        paymentLabel.topAnchor.constraint(equalTo: jamNumberLabel.bottomAnchor, constant: 8).isActive = true
        paymentLabel.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 40).isActive = true
        
        popUpView.addSubview(moneyLabel)
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLabel.topAnchor.constraint(equalTo: jamNumberLabel.bottomAnchor, constant: 8).isActive = true
        moneyLabel.leadingAnchor.constraint(equalTo: paymentLabel.trailingAnchor, constant: 90).isActive = true
        
        popUpView.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.topAnchor.constraint(equalTo: paymentLabel.bottomAnchor, constant: 29).isActive = true
        buyButton.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
    }
    
    private func setupPopUpView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let viewController = popUpViewController {
            viewController.view.addSubview(self)
            leadingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
        }
    }
}
