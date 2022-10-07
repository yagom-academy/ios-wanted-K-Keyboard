//
//  KeyboardViewController.swift
//  PlayKeyboard
//
//  Created by 김지인 on 2022/09/29.

import UIKit

class KeyboardViewController: UIInputViewController {
    var spaceButton: KeyboardButton?
    var deleteButton: KeyboardButton?
    var boolvalue: Bool = true
    var buttoncount = 0
    
    //MorseKeyboardView개체 에 대한 참조를 보유하는 속성 입니다.
    var KeyboardView: KeyboardView!
    var lastCharacters: [String] = []
    
    
    @IBAction func shiftButton(_ sender: Any) {
        buttoncount += 1
        if buttoncount % 2 != 0 {
            
            print("if\(buttoncount)")
        } else {
            
            print("else\(buttoncount)")
        }
    }
    
    //띄어 쓰기
    @IBAction func spaceButton(button: UIButton) {
        insertCharacter(" ")
    }
    // back
    @IBAction func backButton (button: UIButton) {
        deleteCharacterBeforeCursor()
        if !lastCharacters.isEmpty {
            lastCharacters.removeLast()
            if lastCharacters.count == 1 {
                textDocumentProxy.insertText(lastCharacters[0])
            } else if lastCharacters.count == 2 {
                if let johab = hangul(c1: lastCharacters[0], c2: lastCharacters[1], c3: " ") {
                    textDocumentProxy.insertText(johab)
                }
            }
        } else {
            lastCharacters = []
        }
    }
    // 문자 입력하기
    @IBAction func buttonPressed(button: UIButton) {
        let string = button.titleLabel?.text
        insertCharacter("\(string!)")
    }
    
    let cho: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    let jung: [String] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ","ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
    let jong: [String] = [" ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ","ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    
    func hangul(c1:String,c2:String,c3:String) -> String? {
        var cho_i = 0
        var jung_i = 0
        var jong_i = 0
        for i in 0 ..< cho.count {
            if cho[i] == c1 {
                cho_i = i
            }
        }
        guard c2 != " " else { return c1 }
        
        for i in 0 ..< jung.count {
            if jung[i] == c2 {
                jung_i = i
            }
        }
        for i in 0 ..< jong.count {
            if jong[i] == c3 {
                jong_i = i
            }
        }
        let uniValue:Int = (cho_i * 21 * 28) + (jung_i * 28) + (jong_i) + 0xAC00;
        if let uni = Unicode.Scalar(uniValue) {
            return String(uni)
        }
        
        return nil
    }
    
    
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeRoundCorners()
      
        //        morseKeyboardView.setNextKeyboardVisible(needsInputModeSwitchKey)
        
        
        // 인스턴스가 MorseKeyboardView컨트롤러의 루트에 추가됩니다 inputView.
        let nib = UINib(nibName: "MorseKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        KeyboardView = objects.first as? KeyboardView
        //        view = objects[0] as UIView
        guard let inputview = inputView else { return }
        inputview.addSubview(KeyboardView)
        
        //morseKeyboardView상위 뷰에 고정하는 제약 조건 이 추가되고 활성화됩니다.
        KeyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([KeyboardView.leftAnchor.constraint(equalTo: inputview.leftAnchor),
                                     KeyboardView.topAnchor.constraint(equalTo: inputview.topAnchor),
                                     KeyboardView.rightAnchor.constraint(equalTo: inputview.rightAnchor),
                                     KeyboardView.bottomAnchor.constraint(equalTo: inputview.bottomAnchor)
                                    ])
        
        //        // Perform custom UI setup here
        //        self.nextKeyboardButton = UIButton(type: .system)
        //
        //        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        //        self.nextKeyboardButton.sizeToFit()
        //        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        //
        //        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        //
        //        self.view.addSubview(self.nextKeyboardButton)
        //
        //        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        //        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
    }
    
    func makeRoundCorners() {
        for button in self.view.subviews {
            if button is UIButton {
                (button as! UIButton).backgroundColor = UIColor.black
                button.layer.cornerRadius = 3
                button.layer.masksToBounds = true
            }
        }
    }
    
    
    override func viewWillLayoutSubviews() {
        //        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    override func textWillChange(_ textInput: UITextInput?) {
    }
    override func textDidChange(_ textInput: UITextInput?) {
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
    }
    
    
    func insertCharacter(_ newCharacter: String) {
        let 자음: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        let 모음: [String] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ","ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
        let 받침: [String] = ["ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ","ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
        defer {
            print("함수끝났을대 배열: \(lastCharacters)")
        }
        print("이전배열: \(lastCharacters)")
        
        if let lastCharacter = lastCharacters.last {
            // 자음 + 모음이 합친다.
            if 자음.contains(lastCharacter) && 모음.contains(newCharacter) {
                
                if lastCharacters.count > 1 {
                    if let johab = hangul(c1: lastCharacter, c2: newCharacter, c3: " ") {
                        deleteCharacterBeforeCursor()
                        if let johab2 = hangul(c1: lastCharacters[0], c2: lastCharacters[1], c3: " ") {
                            textDocumentProxy.insertText(johab2)
                        }
                        lastCharacters = []
                        lastCharacters.append(lastCharacter)
                        lastCharacters.append(newCharacter)
                        textDocumentProxy.insertText(johab)
                        return
                    }
                } else {
                    if let johab = hangul(c1: lastCharacter, c2: newCharacter, c3: " ") {
                        deleteCharacterBeforeCursor()
                        lastCharacters.append(newCharacter)
                        textDocumentProxy.insertText(johab)
                        return
                    }
                }
            }
            else if let firstCharacter = lastCharacters.first, 자음.contains(firstCharacter),
                    모음.contains(lastCharacter) && 받침.contains(newCharacter)   {
                if let johab = hangul(c1: firstCharacter, c2: lastCharacter, c3: newCharacter) {
                    deleteCharacterBeforeCursor()
                    lastCharacters.append(newCharacter)
                    textDocumentProxy.insertText(johab)
                    return
                }
            } else if 모음.contains(lastCharacter) && 모음.contains(newCharacter) {
                if lastCharacter == "ㅗ" {
                    if newCharacter == "ㅏ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅘ")
                                textDocumentProxy.insertText("ㅘ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: "ㅘ", c3: " ") {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅘ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅐ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅙ")
                                textDocumentProxy.insertText("ㅙ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: "ㅙ", c3: " ") {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅙ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅣ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅚ")
                                textDocumentProxy.insertText("ㅚ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: "ㅚ", c3: " ") {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅚ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    }
                } else if lastCharacter == "ㅜ" {
                    if newCharacter == "ㅓ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast() //ㅗ ㅏ  ㅏ를 합쳐주지못했었다
                                lastCharacters.append("ㅝ")
                                textDocumentProxy.insertText("ㅝ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: "ㅝ", c3: " ") {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅝ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅔ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅞ")
                                textDocumentProxy.insertText("ㅞ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: "ㅞ", c3: " ") {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅞ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅣ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅟ")
                                textDocumentProxy.insertText("ㅟ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: "ㅟ", c3: " ") {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅟ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    }
                } else if lastCharacter == "ㅡ" {
                    if newCharacter == "ㅣ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅢ")
                                textDocumentProxy.insertText("ㅢ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: "ㅢ", c3: " ") {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅢ")
                                textDocumentProxy.insertText(johab)
                                return
                                
                            }
                        }
                    }
                }
            }
            // "ㄵ"  "ㄶ"
            else if let firstCharacter = lastCharacters.first, 자음.contains(firstCharacter),
                    모음.contains(lastCharacters[1]) && 받침.contains(newCharacter) {
                if lastCharacters[2] == "ㄴ" {
                    if newCharacter == "ㅈ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㄵ")
                                textDocumentProxy.insertText("ㄵ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㄵ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄵ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    }
                    else if newCharacter == "ㅎ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㄶ")
                                textDocumentProxy.insertText("ㄶ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㄶ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄶ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    }
                }  //   "ㅄ"
                else if lastCharacter == "ㅂ" {
                    if newCharacter == "ㅅ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㅄ")
                                textDocumentProxy.insertText("ㅄ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㅄ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅄ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    }
                }
                //   "ㄺ"  "ㄻ"  "ㄼ"  "ㄽ"  "ㄾ"  "ㄿ"  "ㅀ"
                else if lastCharacter == "ㄹ" {
                    if newCharacter == "ㄱ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㄺ")
                                textDocumentProxy.insertText("ㄺ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㄺ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄺ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅁ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㄻ")
                                textDocumentProxy.insertText("ㄻ")
                                return
                            }  else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㄻ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄻ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅂ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㄼ")
                                textDocumentProxy.insertText("ㄼ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㄼ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄼ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅅ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㄽ")
                                textDocumentProxy.insertText("ㄽ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㄽ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄽ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅌ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㄾ")
                                textDocumentProxy.insertText("ㄾ")
                                return
                            }  else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㄾ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄾ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅍ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㄿ")
                                textDocumentProxy.insertText("ㄿ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㄿ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄿ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    } else if newCharacter == "ㅎ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters[3].removeLast()
                                lastCharacters.append("ㅀ")
                                textDocumentProxy.insertText("ㅀ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: lastCharacters[1], c3: "ㅀ" ) {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㅀ")
                                textDocumentProxy.insertText(johab)
                                return
                            }
                        }
                    }
                }
            }
        }
        lastCharacters = []
        lastCharacters.append(newCharacter)
        textDocumentProxy.insertText(newCharacter)
    }
    
    @objc func deleteCharacterBeforeCursor() {
        self.textDocumentProxy.deleteBackward()
        UIDevice.current.playInputClick()
    }
    
    func characterBeforeCursor() -> String? {
        return nil
    }
    
    
    
}

