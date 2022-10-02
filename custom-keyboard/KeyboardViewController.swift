//
//  KeyboardViewController.swift
//  custom-keyboard
//
//  Created by 신동원 on 2022/09/30.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var nextKeyboardButton: KeyboardButton!
    var spaceButton: KeyboardButton!
    var shiftButton: KeyboardButton!
    var returnButton: KeyboardButton!
    var deleteButton: KeyboardButton!
    var numberLineButtons: [KeyboardButton]!
    var topLineButton: [KeyboardButton]! //"ㅂ,ㅈ,ㄷ,ㄱ,ㅅ,ㅛ,ㅕ,ㅑ,ㅐ,ㅔ
    var middleLineButtons: [KeyboardButton]! //"ㅁ,ㄴ,ㅇ,ㄹ,ㅎ,ㅗ,ㅓ,ㅏ,ㅣ
    var lastLineButtons: [KeyboardButton]! //"ㅋ,ㅌ,ㅊ,ㅍ,ㅠ,ㅜ,ㅡ
    
    var isShifted = false {
        didSet{
            self.changedShift()
        }
    }
    
    func setup() {
        
        self.numberLineButtons = self.makeButtons(keyboardLine: .number)
        self.topLineButton = self.makeButtons(keyboardLine: .qwerty)
        self.middleLineButtons = self.makeButtons(keyboardLine: .asdfgh)
        self.lastLineButtons = self.makeButtons(keyboardLine: .zxcvbn)
        
        self.nextKeyboardButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.spaceButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.shiftButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.returnButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.deleteButton = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.setButtonsLayout()
        
        self.shiftButton.setTitle(text: "⇧", for: .normal)
        self.deleteButton.setTitle(text: "", for: .normal)
        self.spaceButton.setTitle(text: "space", for: .normal)
        self.returnButton.setTitle(text: "enter", for: .normal)
        self.nextKeyboardButton.button.setImage(UIImage(systemName: "globe"), for: .normal)
        self.deleteButton.button.setImage(UIImage(systemName: "delete.backward"), for: .normal)
        
        self.nextKeyboardButton.button.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.shiftButton.button.addTarget(self, action: #selector(touchUpShiftKey), for: .touchUpInside)
        self.deleteButton.button.addTarget(self, action: #selector(touchUpDeleteKey), for: .touchUpInside)
        self.spaceButton.button.addTarget(self, action: #selector(touchUpSpaceKey), for: .touchUpInside)
        self.returnButton.button.addTarget(self, action: #selector(touchUpReturnKey), for: .touchUpInside)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillLayoutSubviews() {
        //        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    func setButtonsLayout() {
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
        
        let funcLineStackView = UIStackView(arrangedSubviews: [nextKeyboardButton, spaceButton, returnButton])
        funcLineStackView.alignment = .fill
        funcLineStackView.axis = .horizontal
        funcLineStackView.distribution = .fill
        funcLineStackView.spacing = 4
        funcLineStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(numberLineStackView)
        self.view.addSubview(topLineButton)
        self.view.addSubview(middleLineButton)
        self.view.addSubview(lastLineStackView)
        self.view.addSubview(funcLineStackView)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            numberLineStackView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            numberLineStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 4),
            numberLineStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            numberLineStackView.heightAnchor.constraint(equalToConstant: 40),
            
            topLineButton.topAnchor.constraint(equalTo: numberLineStackView.bottomAnchor, constant: 4),
            topLineButton.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor,constant: 4),
            topLineButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            topLineButton.heightAnchor.constraint(equalToConstant: 40),
            
            middleLineButton.topAnchor.constraint(equalTo: topLineButton.bottomAnchor, constant: 4),
            middleLineButton.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor,constant: 24),
            middleLineButton.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -24),
            middleLineButton.heightAnchor.constraint(equalToConstant: 40),
            
            shiftButton.widthAnchor.constraint(equalToConstant: 45),
            deleteButton.widthAnchor.constraint(equalToConstant: 45),
            
            lastLineStackView.topAnchor.constraint(equalTo: middleLineButton.bottomAnchor, constant: 4),
            lastLineStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor,constant: 4),
            lastLineStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            lastLineStackView.heightAnchor.constraint(equalToConstant: 40),
            
            
            nextKeyboardButton.widthAnchor.constraint(equalToConstant: 40),
            nextKeyboardButton.heightAnchor.constraint(equalToConstant: 40),
            returnButton.widthAnchor.constraint(equalToConstant: 92),
            
            funcLineStackView.topAnchor.constraint(equalTo: lastLineStackView.bottomAnchor, constant: 4),
            funcLineStackView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: 4),
            funcLineStackView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -4),
            //funcLineStackView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor)
        ])
    }
    
    func makeStackView(buttons:[KeyboardButton]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    func makeButtons(keyboardLine: KeyboardLine) -> [KeyboardButton] {
        
        var buttons = [KeyboardButton]()
        
        let list = KeyboardCharacter.getLineText(keyboardLine: keyboardLine)
        for character in list  {
            let button = KeyboardButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            button.setTitle(text: character, for: .normal)
            button.button.addTarget(self, action: #selector(keyboardButtonClicked(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        return buttons
    }
    
    @objc func keyboardButtonClicked(_ sender: CustomButton) {
        
        if let character = sender.titleLabel?.text {
            UIDevice.current.playInputClick()
            self.textDocumentProxy.insertText(character)
        }
        isShifted = isShifted ? false : true
    }
    
    @objc func touchUpSpaceKey() {
        self.textDocumentProxy.insertText(" ")
        UIDevice.current.playInputClick()
        isShifted = isShifted ? false : true
    }
    
    @objc func touchUpReturnKey() {
        self.textDocumentProxy.insertText("\n")
        UIDevice.current.playInputClick()
        isShifted = isShifted ? false : true
    }
    
    @objc func touchUpDeleteKey() {
        self.textDocumentProxy.deleteBackward()
        UIDevice.current.playInputClick()
        isShifted = isShifted ? false : true
    }
    
    @objc func touchUpShiftKey() {
        UIDevice.current.playInputClick()
        isShifted = isShifted ? false : true
    }
    
    func changedShift(){
        if isShifted {
            for key in self.topLineButton {
                let character = key.getTitle()
                switch character {
                case "ㅂ":
                    key.button.setTitle("ㅃ", for: .normal)
                case "ㅈ":
                    key.button.setTitle("ㅉ", for: .normal)
                case "ㄷ":
                    key.button.setTitle("ㄸ", for: .normal)
                case "ㄱ":
                    key.button.setTitle("ㄲ", for: .normal)
                case "ㅅ":
                    key.button.setTitle("ㅆ", for: .normal)
                case "ㅐ":
                    key.button.setTitle("ㅒ", for: .normal)
                case "ㅔ":
                    key.button.setTitle("ㅖ", for: .normal)
                default: break
                }
            }
        } else {
            for key in self.topLineButton {
                let character = key.getTitle()
                switch character {
                case "ㅃ":
                    key.button.setTitle("ㅂ", for: .normal)
                case "ㅉ":
                    key.button.setTitle("ㅈ", for: .normal)
                case "ㄸ":
                    key.button.setTitle("ㄷ", for: .normal)
                case "ㄲ":
                    key.button.setTitle("ㄱ", for: .normal)
                case "ㅆ":
                    key.button.setTitle("ㅅ", for: .normal)
                case "ㅒ":
                    key.button.setTitle("ㅐ", for: .normal)
                case "ㅖ":
                    key.button.setTitle("ㅔ", for: .normal)
                default: break
                }
            }
        }
    }
}
