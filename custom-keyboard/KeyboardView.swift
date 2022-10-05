//
//  KeyboardView.swift
//  custom-keyboard
//
//  Created by 신동원 on 2022/10/04.
//

import UIKit

class KeyboardView: UIView {
    
    var nextKeyboardButton: CustomButton!
    var spaceButton: CustomButton!
    var shiftButton: CustomButton!
    var enterButton: CustomButton!
    var deleteButton: CustomButton!
    var numberLineButtons: [CustomButton]!
    var topLineButton: [CustomButton]! //"ㅂ,ㅈ,ㄷ,ㄱ,ㅅ,ㅛ,ㅕ,ㅑ,ㅐ,ㅔ
    var middleLineButtons: [CustomButton]! //"ㅁ,ㄴ,ㅇ,ㄹ,ㅎ,ㅗ,ㅓ,ㅏ,ㅣ
    var lastLineButtons: [CustomButton]! //"ㅋ,ㅌ,ㅊ,ㅍ,ㅠ,ㅜ,ㅡ
    var shortCutButton: CustomButton! // 단축키
    var shortCutList: [String] = ["안녕하세요~","감사합니다!","지금 가능 중이야!","휘양", "크롱"] // 단축어가 담길 변수

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        
        self.numberLineButtons = self.makeButtons(keyboardLine: .number)
        self.topLineButton = self.makeButtons(keyboardLine: .qwerty)
        self.middleLineButtons = self.makeButtons(keyboardLine: .asdfgh)
        self.lastLineButtons = self.makeButtons(keyboardLine: .zxcvbn)
        
        self.nextKeyboardButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.spaceButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .space)
        self.shiftButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .shift)
        self.enterButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .enter)
        self.deleteButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .delete)
        self.shortCutButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .shortcut)
        self.setupConstraints()
        
        self.shiftButton.setTitle("⇧", for: .normal)
        self.deleteButton.setTitle("", for: .normal)
        self.spaceButton.setTitle("space", for: .normal)
        self.enterButton.setTitle("enter", for: .normal)
        self.shortCutButton.setTitle(shortCutList[0], for: .normal)
        self.nextKeyboardButton.setImage(UIImage(systemName: "globe"), for: .normal)
        self.deleteButton.setImage(UIImage(systemName: "delete.backward"), for: .normal)
        self.shortCutButton.addMenu(keyTitle: shortCutList) { menu in
            
            self.shortCutButton.setTitle(menu.title, for: .normal)
        }
    }
    
    func setupConstraints() {
        let numberLineStackView = makeStackView(buttons: numberLineButtons)
        let topLineButton = makeStackView(buttons: topLineButton)
        let middleLineButton = makeStackView(buttons: middleLineButtons)
        let lastLineButton = makeStackView(buttons: lastLineButtons)
        
        let lastLineStackView = UIStackView(arrangedSubviews: [shiftButton, lastLineButton, deleteButton])
        lastLineStackView.alignment = .fill
        lastLineStackView.axis = .horizontal
        lastLineStackView.distribution = .fill
        lastLineStackView.spacing = 16
        lastLineStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let funcLineStackView = UIStackView(arrangedSubviews: [nextKeyboardButton, shortCutButton, spaceButton, enterButton])
        funcLineStackView.alignment = .fill
        funcLineStackView.axis = .horizontal
        funcLineStackView.distribution = .fill
        funcLineStackView.spacing = 4
        funcLineStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(numberLineStackView)
        self.addSubview(topLineButton)
        self.addSubview(middleLineButton)
        self.addSubview(lastLineStackView)
        self.addSubview(funcLineStackView)
        
        let safeGuide = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            numberLineStackView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 6),
            numberLineStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 4),
            numberLineStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            numberLineStackView.heightAnchor.constraint(equalToConstant: 40),
            
            topLineButton.topAnchor.constraint(equalTo: numberLineStackView.bottomAnchor, constant: 6),
            topLineButton.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor,constant: 4),
            topLineButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            topLineButton.heightAnchor.constraint(equalToConstant: 40),
            
            middleLineButton.topAnchor.constraint(equalTo: topLineButton.bottomAnchor, constant: 6),
            middleLineButton.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor,constant: 24),
            middleLineButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -24),
            middleLineButton.heightAnchor.constraint(equalToConstant: 40),
            
            shiftButton.widthAnchor.constraint(equalToConstant: 45),
            deleteButton.widthAnchor.constraint(equalToConstant: 45),
            
            lastLineStackView.topAnchor.constraint(equalTo: middleLineButton.bottomAnchor, constant: 6),
            lastLineStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor,constant: 4),
            lastLineStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            lastLineStackView.heightAnchor.constraint(equalToConstant: 40),
            
            
            nextKeyboardButton.widthAnchor.constraint(equalToConstant: 40),
            nextKeyboardButton.heightAnchor.constraint(equalToConstant: 40),
            enterButton.widthAnchor.constraint(equalToConstant: 92),
            shortCutButton.widthAnchor.constraint(equalToConstant: 44),
            
            funcLineStackView.topAnchor.constraint(equalTo: lastLineStackView.bottomAnchor, constant: 6),
            funcLineStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 4),
            funcLineStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            funcLineStackView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor)
        ])
    }
    
    func makeStackView(buttons:[CustomButton]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    func makeButtons(keyboardLine: KeyboardLine) -> [CustomButton] {
        
        var buttons = [CustomButton]()
        
        let list = KeyboardCharacter.getLineText(keyboardLine: keyboardLine)
        for character in list  {
            let button = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            button.setTitle(character, for: .normal)
            //button.addTarget(self, action: #selector(keyboardButtonClicked(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        return buttons
    }
}

