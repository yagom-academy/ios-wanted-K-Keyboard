//
//  ShortenView.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/10/08.
//

import UIKit

protocol ShortenDelegate: AnyObject {
    func insertShortenText(text: String)
}

class ShortenView: UIView {
    
    var delegate: ShortenDelegate?

    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    let shortenButton1: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 10)
        button.setTitleColor(.systemColor, for: .normal)
        button.setBackgroundColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        return button
    }()
    
    let shortenButton2: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 10)
        button.setTitleColor(.systemColor, for: .normal)
        button.setBackgroundColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        return button
    }()
    
    let shortenButton3: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 10)
        button.setTitleColor(.systemColor, for: .normal)
        button.setBackgroundColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        return button
    }()
    
    let shortenButton4: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 10)
        button.setTitleColor(.systemColor, for: .normal)
        button.setBackgroundColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 4
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        self.clipsToBounds = true
        self.layer.cornerRadius = 10

        setViewHierarchy()
        setConstraints()
        registerButtonTarget()
    }
    
    func setViewHierarchy() {
        addSubviews(mainStackView)
        mainStackView.addArrangedSubviews(shortenButton1, shortenButton2, shortenButton3, shortenButton4)
    }
    
    func setConstraints() {
        [mainStackView, shortenButton1, shortenButton2, shortenButton3, shortenButton4].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            shortenButton1.heightAnchor.constraint(equalToConstant: 35),
            shortenButton2.heightAnchor.constraint(equalToConstant: 35),
            shortenButton3.heightAnchor.constraint(equalToConstant: 35),
            shortenButton4.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func registerButtonTarget() {
        [shortenButton1, shortenButton2, shortenButton3, shortenButton4].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction), for: .touchUpInside)
        }
    }
    
    @objc func buttonTapAction(_ sender: UIButton) {
        delegate?.insertShortenText(text: sender.titleLabel?.text ?? "")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
