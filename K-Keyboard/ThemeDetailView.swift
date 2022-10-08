//
//  ThemeDetailView.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/06.
//

import UIKit

class ThemeDetailView: UIView, ViewRepresent {
    
    weak var delegate: ThemeDetailView!

    let tableView = UITableView()
    
    var constraint = NSLayoutConstraint()
    
    let purchaseBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.customLightGray().cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 2
        return view
    }()
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.customLightGray().cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 2
        return view
    }()
    let gemImageView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "diamond")
        return view
    }()
    let gemPriceLabel: UILabel = {
        let view = UILabel()
        view.font = .NotoSanKR(weight: .Bold, size: 16)
        view.text = "5"
        view.textColor = .customBlue()
        return view
    }()
    let myGemLabel: UILabel = {
        let view = UILabel()
        view.text = "0젬 보유 중"
        view.textColor = .customLightGray()
        view.asFontColor(targetString: "0젬", font: nil, color: UIColor.customPink())
        view.font = .NotoSanKR(weight: .Medium, size: 12)
        return view
    }()
    let buyButton: UIButton = {
       let view = UIButton()
        view.setTitle("구매하기", for: .normal)
        view.titleLabel?.font = .NotoSanKR(weight: .Bold, size: 14)
        view.layer.cornerRadius = 20
        view.backgroundColor = .customPink()
        return view
    }()
    
    let reviewBarView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.customLightGray().cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 2
        return view
    }()
    let contentbackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .allWhiteGray()
        view.layer.cornerRadius = 21
        view.layer.masksToBounds = true
        return view
    }()
    
    let textInputField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        field.placeholder = "이 테마가 마음에 드시나요?"
        field.font = .NotoSanKR(weight: .Regular, size: 12)
        return field
    }()
    
    let writeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "send"), for: .normal)
        return view
    }()
    
    @objc func purchase() {
        UserDefaults.standard.set(true, forKey: "isPurchased")
        NotificationCenter.default.post(name: NSNotification.Name("purchased"), object: nil, userInfo: nil)
        reviewBarView.isHidden = false
        purchaseBarView.isHidden = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func addReview() {
        NotificationCenter.default.post(name: NSNotification.Name("addReview"), object: textInputField.text!, userInfo: nil)
        textInputField.text = ""
    }
    
    func setupView() {
        self.backgroundColor = .white
        tableView.backgroundColor = .gray
        tableView.separatorStyle = .none
        addSubview(tableView)
        addSubview(bottomView)
        
        bottomView.addSubview(purchaseBarView)
        purchaseBarView.addSubview(gemImageView)
        purchaseBarView.addSubview(gemPriceLabel)
        purchaseBarView.addSubview(myGemLabel)
        purchaseBarView.addSubview(buyButton)
        
        bottomView.addSubview(reviewBarView)
        reviewBarView.addSubview(contentbackgroundView)
        reviewBarView.addSubview(writeButton)
        contentbackgroundView.addSubview(textInputField)
        reviewBarView.isHidden = true
        writeButton.addTarget(self, action: #selector(addReview), for: .touchUpInside)
    }
    
    func setupConstraints() {
        constraint = bottomView.heightAnchor.constraint(equalToConstant: 64)
        let safeGuide = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -64),
            
            bottomView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            constraint,
            
            purchaseBarView.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            purchaseBarView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            purchaseBarView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            purchaseBarView.heightAnchor.constraint(equalTo: bottomView.heightAnchor),
            
            gemImageView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 16),
            gemImageView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            
            gemPriceLabel.centerYAnchor.constraint(equalTo: gemImageView.centerYAnchor),
            gemPriceLabel.leadingAnchor.constraint(equalTo: gemImageView.trailingAnchor, constant: 6),
            
            myGemLabel.topAnchor.constraint(equalTo: gemImageView.bottomAnchor, constant: 6),
            myGemLabel.leadingAnchor.constraint(equalTo: gemImageView.leadingAnchor),
            
            buyButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
            buyButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            buyButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 144/375),
            buyButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -12),
            
            reviewBarView.topAnchor.constraint(equalTo: bottomView.topAnchor),
            reviewBarView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            reviewBarView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            reviewBarView.heightAnchor.constraint(equalToConstant: 64),
            
            contentbackgroundView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            contentbackgroundView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
            contentbackgroundView.widthAnchor.constraint(greaterThanOrEqualToConstant: 50),
            contentbackgroundView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            textInputField.leadingAnchor.constraint(equalTo: contentbackgroundView.leadingAnchor, constant: 12),
            textInputField.centerYAnchor.constraint(equalTo: contentbackgroundView.centerYAnchor),
            textInputField.trailingAnchor.constraint(equalTo: contentbackgroundView.trailingAnchor, constant: -12),
            
            writeButton.widthAnchor.constraint(equalToConstant: 35),
            writeButton.heightAnchor.constraint(equalToConstant: 35),
            writeButton.centerYAnchor.constraint(equalTo: contentbackgroundView.centerYAnchor),
            writeButton.leadingAnchor.constraint(equalTo: contentbackgroundView.trailingAnchor, constant: 5),
            writeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        gemImageView.translatesAutoresizingMaskIntoConstraints = false
        gemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        myGemLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        purchaseBarView.translatesAutoresizingMaskIntoConstraints = false
        reviewBarView.translatesAutoresizingMaskIntoConstraints = false
        contentbackgroundView.translatesAutoresizingMaskIntoConstraints = false
        writeButton.translatesAutoresizingMaskIntoConstraints = false
        textInputField.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
