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
        view.addTarget(nil, action: #selector(purchase), for: .touchUpInside)
        return view
    }()
    
    @objc func purchase() {
        UserDefaults.standard.set(true, forKey: "isPurchased")
        NotificationCenter.default.post(name: NSNotification.Name("purchased"), object: nil, userInfo: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        self.backgroundColor = .white
        tableView.backgroundColor = .gray
        tableView.separatorStyle = .none
        addSubview(tableView)
        addSubview(bottomView)
        bottomView.addSubview(gemImageView)
        bottomView.addSubview(gemPriceLabel)
        bottomView.addSubview(myGemLabel)
        bottomView.addSubview(buyButton)
    }
    
    func setupConstraints() {
        
        let safeGuide = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -64),
            
            bottomView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 64),
            
            gemImageView.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 16),
            gemImageView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 16),
            
            gemPriceLabel.centerYAnchor.constraint(equalTo: gemImageView.centerYAnchor),
            gemPriceLabel.leadingAnchor.constraint(equalTo: gemImageView.trailingAnchor, constant: 6),
            
            myGemLabel.topAnchor.constraint(equalTo: gemImageView.bottomAnchor, constant: 6),
            myGemLabel.leadingAnchor.constraint(equalTo: gemImageView.leadingAnchor),
            
            buyButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 12),
            buyButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -16),
            buyButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 144/375),
            buyButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -12)
            
            
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        gemImageView.translatesAutoresizingMaskIntoConstraints = false
        gemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        myGemLabel.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
