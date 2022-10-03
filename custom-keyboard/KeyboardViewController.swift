//
//  KeyboardViewController.swift
//  custom-keyboard
//
//  Created by 신동원 on 2022/09/30.
//

import UIKit

enum KeyType {
    
    case delete
    case enter
    case space
    case shift
    case normal
}

class KeyboardViewController: UIInputViewController {
    
    var nextKeyboardButton: CustomButton!
    var spaceButton: CustomButton!
    var shiftButton: CustomButton!
    var enterButton: CustomButton!
    var deleteButton: CustomButton!
    var numberLineButtons: [CustomButton]!
    var topLineButton: [CustomButton]! //"ㅂ,ㅈ,ㄷ,ㄱ,ㅅ,ㅛ,ㅕ,ㅑ,ㅐ,ㅔ
    var middleLineButtons: [CustomButton]! //"ㅁ,ㄴ,ㅇ,ㄹ,ㅎ,ㅗ,ㅓ,ㅏ,ㅣ
    var lastLineButtons: [CustomButton]! //"ㅋ,ㅌ,ㅊ,ㅍ,ㅠ,ㅜ,ㅡ
    
    /// 직전 입력 텍스트가 담길 변수
    var preChar = " "
    /// backward시 자음, 모음 분해가능 여부
    var isSeparable: Bool = true
    let hangulCombinater = HangulCombinater.shared
    
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
        
        self.nextKeyboardButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.spaceButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .space)
        self.shiftButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .shift)
        self.enterButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .enter)
        self.deleteButton = CustomButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40), keyType: .delete)
        self.setButtonsLayout()
        
        self.shiftButton.setTitle("⇧", for: .normal)
        self.deleteButton.setTitle("", for: .normal)
        self.spaceButton.setTitle("space", for: .normal)
        self.enterButton.setTitle("enter", for: .normal)
        self.nextKeyboardButton.setImage(UIImage(systemName: "globe"), for: .normal)
        self.deleteButton.setImage(UIImage(systemName: "delete.backward"), for: .normal)
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.shiftButton.addTarget(self, action: #selector(keyboardButtonClicked), for: .touchUpInside)
        self.deleteButton.addTarget(self, action: #selector(keyboardButtonClicked), for: .touchUpInside)
        self.spaceButton.addTarget(self, action: #selector(keyboardButtonClicked), for: .touchUpInside)
        self.enterButton.addTarget(self, action: #selector(keyboardButtonClicked), for: .touchUpInside)
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
        // self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
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
        
        let funcLineStackView = UIStackView(arrangedSubviews: [nextKeyboardButton, spaceButton, enterButton])
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
            button.addTarget(self, action: #selector(keyboardButtonClicked(_:)), for: .touchUpInside)
            buttons.append(button)
        }
        return buttons
    }
    
    @objc func keyboardButtonClicked(_ sender: CustomButton) {
        
        //키보드 터치음
        UIDevice.current.playInputClick()
        
        // 키보드 키 타입에 따라 동작
        switch sender.keyType {
            
        case .delete:
            if isSeparable {
                guard let lastInput = textDocumentProxy.documentContextBeforeInput?.last else {
                    return
                }
                
                if String(lastInput) == "" { isSeparable = false }
                
                guard let combined = hangulCombinater.separateJamo(String(lastInput)) else {
                    self.textDocumentProxy.deleteBackward()
                    return
                }
                self.textDocumentProxy.deleteBackward()
                self.textDocumentProxy.insertText(combined)
            } else {
                self.textDocumentProxy.deleteBackward()
            }
            isShifted = false
        case .enter:
            self.textDocumentProxy.insertText("\n")
            isShifted = false
        case .space:
            preChar = " "
            isSeparable = false
            self.textDocumentProxy.insertText(" ")
            isShifted = false
        case .shift:
            isShifted = isShifted ? false : true
        case .normal:
            isSeparable = true
            if var curChar = sender.titleLabel?.text {
            
                defer {
                    self.textDocumentProxy.insertText(curChar)
                    preChar = curChar
                    isShifted = false
                }
                
                if preChar.isEmpty { return }
                
                // 이전 텍스트와 상관없이 출력 및 결합
                if hangulCombinater.replaceJamo(preChar, curChar).count == 1 {
                    curChar = hangulCombinater.replaceJamo(preChar, curChar)[0]
                    if hangulCombinater.getUnicode(curChar) != 0 {
                        textDocumentProxy.deleteBackward()
                    }
                }
                // 이전 텍스트와 연관된 수정 및 추가
                // ex) 간ㅏ -> 가나
                else {
                    textDocumentProxy.deleteBackward()
                    let replaced = hangulCombinater.replaceJamo(preChar, curChar)
                    curChar = replaced[0]
                    preChar = replaced[1]
                    textDocumentProxy.insertText(preChar)
                }
            }
        }
    }
    
    func changedShift(){
        if isShifted {
            for key in self.topLineButton {
                let character = key.titleLabel?.text
                switch character {
                case "ㅂ":
                    key.setTitle("ㅃ", for: .normal)
                case "ㅈ":
                    key.setTitle("ㅉ", for: .normal)
                case "ㄷ":
                    key.setTitle("ㄸ", for: .normal)
                case "ㄱ":
                    key.setTitle("ㄲ", for: .normal)
                case "ㅅ":
                    key.setTitle("ㅆ", for: .normal)
                case "ㅐ":
                    key.setTitle("ㅒ", for: .normal)
                case "ㅔ":
                    key.setTitle("ㅖ", for: .normal)
                default: break
                }
            }
        } else {
            for key in self.topLineButton {
                let character = key.titleLabel?.text
                switch character {
                case "ㅃ":
                    key.setTitle("ㅂ", for: .normal)
                case "ㅉ":
                    key.setTitle("ㅈ", for: .normal)
                case "ㄸ":
                    key.setTitle("ㄷ", for: .normal)
                case "ㄲ":
                    key.setTitle("ㄱ", for: .normal)
                case "ㅆ":
                    key.setTitle("ㅅ", for: .normal)
                case "ㅒ":
                    key.setTitle("ㅐ", for: .normal)
                case "ㅖ":
                    key.setTitle("ㅔ", for: .normal)
                default: break
                }
            }
        }
    }
}
