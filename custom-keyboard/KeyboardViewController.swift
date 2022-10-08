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
    let shortcutTableView = UITableView()
    
    var isShifted = false {
        didSet{
            self.changedShift()
        }
    }
    
    
    func setup() {
        
        //test view
        keyboardView.backgroundColor = .darkGray
        favoriteSentenceView.backgroundColor = .darkGray
        
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
        
        // 툴바메뉴에 들어갈 버튼
        var buttons: [UIButton] = []
        for (i, name) in ["voice_input", "clipboard", "frequently_used_words", "stickers", "text_emoji" , "emoji"].enumerated() {
            let button = ToggleButton()
            button.setImage(UIImage(named: "ic_toolbar_\(name).png")!.withRenderingMode(.alwaysTemplate), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.tintColor = .white
            button.backgroundColor = .darkGray
            button.tag = i
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(ToggleButtonClicked), for: .touchUpInside)
            buttons.append(button)
        }
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.tag = 99
        stack.backgroundColor = .darkGray
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 0
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.text = "자주 쓰는 말"
//        label.font = UIFont(name: "NotoSansKR-Bold", size: 13)
        label.textColor = UIColor(red: 0/255, green: 178/255, blue: 167/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        shortcutTableView.delegate = self
        shortcutTableView.dataSource = self
    
        shortcutTableView.separatorInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        shortcutTableView.separatorColor = UIColor(cgColor: CGColor(gray: 0.45, alpha: 0.5))
        shortcutTableView.translatesAutoresizingMaskIntoConstraints = false
        shortcutTableView.separatorStyle = .singleLine
        shortcutTableView.backgroundColor = .darkGray
        shortcutTableView.alwaysBounceVertical = false
        
        self.view.addSubview(stack)
        self.view.addSubview(favoriteSentenceView)
        self.view.addSubview(keyboardView)
        
        favoriteSentenceView.addSubview(label)
        favoriteSentenceView.addSubview(shortcutTableView)
        favoriteSentenceView.isHidden = true
        
        NSLayoutConstraint.activate([

            stack.topAnchor.constraint(equalTo: view.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 28),
            //test
            favoriteSentenceView.topAnchor.constraint(equalTo: stack.bottomAnchor),
            favoriteSentenceView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteSentenceView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteSentenceView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: shortcutTableView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: shortcutTableView.trailingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: favoriteSentenceView.topAnchor, constant: 15),
            
            shortcutTableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
            shortcutTableView.leadingAnchor.constraint(equalTo: favoriteSentenceView.leadingAnchor),
            shortcutTableView.trailingAnchor.constraint(equalTo: favoriteSentenceView.trailingAnchor),
            shortcutTableView.bottomAnchor.constraint(equalTo: favoriteSentenceView.bottomAnchor),
            
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
        self.advanceToNextInputMode()
        self.keyboardView.inputViewController?.advanceToNextInputMode()
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
    
    func ToggleButtonsControl(_ tag: Int) {
        // 선택한 버튼의 토글만 변경 시키고 이외버튼은 false
        // 선택한 버튼은 Toggle처리는 ToggleButton 클래스에서 수행
        let stackView = self.view.viewWithTag(99) as? UIStackView
        for view in stackView!.arrangedSubviews {
            let btn = view as! ToggleButton
            btn.isToggled = btn.tag == tag ? btn.isToggled : false
        }
    }
    
    // TODO: 토글 버튼을 그룹화 ( 상태변경시 이외버튼 초기화 ) 필요
    @objc func ToggleButtonClicked(_ button: ToggleButton){
        
        ToggleButtonsControl(button.tag)
        keyboardView.isHidden = button.isToggled
        
        favoriteSentenceView.isHidden = !button.isToggled
        
//        switch button.tag {
//        case 0:
//            favoriteSentenceView.isHidden = !button.isToggled
//        case 1:
//            favoriteSentenceView.isHidden = !button.isToggled
//        default:
//            favoriteSentenceView.isHidden = !button.isToggled
//        }
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

class ToggleButton: UIButton {

    var isToggled: Bool = false {
        didSet {
            backgroundColor = isToggled ? .white : .darkGray
            tintColor = isToggled ? .darkGray : .white
        }
    }

    private func switchingToggle() {
        isToggled = !isToggled
    }

    func resetToggle() {
        isToggled = false
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        switchingToggle()
    }
}

// TEST
extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: CGColor, width: CGFloat) {
        let border = CALayer()
        for edge in arr_edge {
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
        }
        border.backgroundColor = color
        border.borderWidth = width
        self.addSublayer(border)
        self.masksToBounds = true
    }
}

extension KeyboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let customButton = CustomButton(frame: CGRect(), keyType: .shortcut)
            customButton.titleLabel?.text = keyboardView.shortCutList[indexPath.row]
        keyboardButtonClicked(customButton)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyboardView.shortCutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
            cell.backgroundColor = .darkGray
            cell.selectionStyle = .none
        var content = cell.defaultContentConfiguration()
            content.text = "\(keyboardView.shortCutList[indexPath.row])"
            content.textProperties.color = UIColor(white: 1.0, alpha: 0.8)
        cell.contentConfiguration = content
        return cell
    }
}
