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
    case shortcut
    
}

public func customPrint(_ str: String) {
#if DEBUG
    print(str)
#endif
}

class KeyboardViewController: UIInputViewController {
    
    let mainView = UIView()
    let favoriteSentenceView = UIView()
    let keyboardView = KeyboardView()
    /// 직전 입력 텍스트가 담길 변수
    var preChar: [String] = []
    /// backward시 자음, 모음 분해가능 여부
    var isSeparable: Bool = true
    let hangulCombinater = HangulCombinater.shared
    
    var isShifted = false {
        didSet{
            self.changedShift()
        }
    }
    
    
    func setup() {
        
        //test view
        favoriteSentenceView.backgroundColor = .cyan
        
        //버튼에 action handler 추가
        [keyboardView.numberLineButtons, keyboardView.topLineButton, keyboardView.middleLineButtons, keyboardView.lastLineButtons].forEach {
            addButtonHandler($0)
        }
        [keyboardView.shiftButton, keyboardView.deleteButton,keyboardView.spaceButton, keyboardView.enterButton, keyboardView.shortCutButton].forEach {
            $0.addTarget(self, action: #selector(keyboardButtonClicked(_:)), for: .touchUpInside)
        }
        keyboardView.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)

    }
    
    func setupConstraints() {
        
        //툴바메뉴에 들어갈 버튼
        var buttons: [UIButton] = []
        for i in 0...5 {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
            switch i {
            case 0:
                button.backgroundColor = .red
                button.tag = i
                button.addTarget(self, action: #selector(toolBarButtonClicked), for: .touchUpInside)
            case 1:
                button.backgroundColor = .green
                button.tag = i
                button.addTarget(self, action: #selector(toolBarButtonClicked), for: .touchUpInside)
            case 2: button.backgroundColor = .blue
            case 3: button.backgroundColor = .yellow
            case 4: button.backgroundColor = .brown
            case 5: button.backgroundColor = .cyan
            default:
                button.backgroundColor = .black
            }
            buttons.append(button)
        }
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(stack)
        
        //test
        self.view.addSubview(favoriteSentenceView)
        favoriteSentenceView.isHidden = true
        self.view.addSubview(keyboardView)
        NSLayoutConstraint.activate([
            
            stack.topAnchor.constraint(equalTo: view.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 20),
            //test
            favoriteSentenceView.topAnchor.constraint(equalTo: stack.bottomAnchor),
            favoriteSentenceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteSentenceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteSentenceView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            keyboardView.topAnchor.constraint(equalTo: stack.bottomAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        favoriteSentenceView.translatesAutoresizingMaskIntoConstraints = false
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addButtonHandler(_ buttons: [CustomButton]) {
        
        for button in buttons {
            button.addTarget(self, action: #selector(keyboardButtonClicked(_:)), for: .touchUpInside)
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        self.view.backgroundColor = .systemGray4
        
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
        keyboardView.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    @objc func toolBarButtonClicked(_ sender: UIButton){
        
        switch sender.tag {
        case 0:
            keyboardView.isHidden = false
            favoriteSentenceView.isHidden = true
        case 1:
            keyboardView.isHidden = true
            favoriteSentenceView.isHidden = false
        default:
            keyboardView.isHidden = false
            favoriteSentenceView.isHidden = false
        }
        //self.view.updateConstraints()
    }
    
    
    @objc func keyboardButtonClicked(_ sender: CustomButton) {
        
        //키보드 터치음
        UIDevice.current.playInputClick()
        
        // 키보드 키 타입에 따라 동작
        switch sender.keyType {
            
        case .delete:
            if isSeparable {
                guard let lastInput = textDocumentProxy.documentContextBeforeInput?.last else {
                    if !preChar.isEmpty { preChar.removeLast() }
                    customPrint("prev 1. = \(preChar)")
                    return
                }
                
                if String(lastInput) == "" { isSeparable = false }
                
                guard let combined = hangulCombinater.separateJamo(String(lastInput)) else {
                    if !preChar.isEmpty { preChar.removeLast() }
                    customPrint("prev 2. = \(preChar)")
                    self.textDocumentProxy.deleteBackward()
                    return
                }
                customPrint(combined)
                if !preChar.isEmpty { preChar.removeLast() }
                preChar.append(combined)
                customPrint("prev 2. = \(preChar)")
                self.textDocumentProxy.deleteBackward()
                self.textDocumentProxy.insertText(combined)
            } else {
                if !preChar.isEmpty { preChar.removeLast() }
                customPrint("prev 4. = \(preChar)")
                self.textDocumentProxy.deleteBackward()
            }
            isShifted = false
        case .enter:
            self.textDocumentProxy.insertText("\n")
            isShifted = false
        case .space:
            preChar.append(" ")
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
                    preChar.append(curChar)
                    customPrint("1. \(preChar)")
                    isShifted = false
                }
                
                if preChar.isEmpty { return }
                
                if hangulCombinater.replaceJamo(preChar.last!, curChar).count == 1 {
                    curChar = hangulCombinater.replaceJamo(preChar.last!, curChar)[0]
                    if hangulCombinater.getUnicode(curChar) != 0 {
                        if !preChar.isEmpty { preChar.removeLast() }
                        textDocumentProxy.deleteBackward()
                    }
                    customPrint("2. \(preChar)")
                }
                else {
                    textDocumentProxy.deleteBackward()
                    let replaced = hangulCombinater.replaceJamo(preChar.last!, curChar)
                    curChar = replaced[0]
                    customPrint("charChar: \(replaced[0])")
                    customPrint("preChar: \(replaced[1])")
                    if !preChar.isEmpty { preChar.removeLast() }
                    preChar.append(replaced[1])
                    customPrint("3. \(preChar)")
                    textDocumentProxy.insertText(preChar.last!)
                }
            }
        case .shortcut:
            preChar.append(" ")
            isSeparable = false
            guard let text = sender.titleLabel?.text else { return }
            self.textDocumentProxy.insertText(text)
            isShifted = false
        }
    }
    
    func changedShift(){
        if isShifted {
            for key in keyboardView.topLineButton {
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
            for key in keyboardView.topLineButton {
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
