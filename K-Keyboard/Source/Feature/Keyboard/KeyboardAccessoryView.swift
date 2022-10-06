//
//  KeyboardAccessoryView.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/10/06.
//

import UIKit

protocol ChangeKeyboardDelegate: AnyObject {
    func changeToMainKeyboard()
    func changeToOftenUsedKeyboard()
}

class KeyboardAccessoryView: UIView {
    
    var delegate: ChangeKeyboardDelegate?

    let toolBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    let mainKeyboardButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "keyboard"), for: .normal)
        button.setImage(UIImage(systemName: "keyboard.fill"), for: .selected)
        button.tintColor = .darkGray
        button.isSelected = true
        return button
    }()
    
    let oftenUsedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "speaker"), for: .normal)
        button.setImage(UIImage(systemName: "speaker.fill"), for: .selected)
        button.tintColor = .darkGray
        button.isSelected = false
        return button
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        setViewHierarchy()
        setConstraints()
        registerButtonTarget()
    }
    
    func setViewHierarchy() {
        addSubviews(toolBarStackView, lineView)
        toolBarStackView.addArrangedSubviews(mainKeyboardButton, oftenUsedButton)
    }
    
    func setConstraints() {
        [toolBarStackView, lineView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            toolBarStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            toolBarStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            toolBarStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            toolBarStackView.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -9),
            lineView.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale),
            lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func registerButtonTarget() {
        [mainKeyboardButton, oftenUsedButton].forEach {
            $0.addTarget(self, action: #selector(toolButtonTapAction), for: .touchUpInside)
        }
    }
    
    @objc func toolButtonTapAction(_ sender: UIButton) {
        switch sender {
        case mainKeyboardButton:
            mainKeyboardButton.isSelected = !mainKeyboardButton.isSelected
            oftenUsedButton.isSelected = !oftenUsedButton.isSelected
            delegate?.changeToMainKeyboard()
        case oftenUsedButton:
            mainKeyboardButton.isSelected = !mainKeyboardButton.isSelected
            oftenUsedButton.isSelected = !oftenUsedButton.isSelected
            delegate?.changeToOftenUsedKeyboard()
        default:
            delegate?.changeToMainKeyboard()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
