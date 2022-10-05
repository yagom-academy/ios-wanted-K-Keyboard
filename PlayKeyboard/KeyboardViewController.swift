//
//  KeyboardViewController.swift
//  PlayKeyboard
//
//  Created by 김지인 on 2022/09/29.
/*KeyboardViewController.swift : UIInputViewController커스텀 키보드 확장을 위한 기본 뷰 컨트롤러 역할을 하는 서브클래스. MorseKeyboardView여기 에서 에서 수행된 방식과 유사한 키보드에 대한 사용자 지정 논리를 연결 하고 구현합니다 PracticeViewController.
 Info.plist : plist확장에 대한 메타데이터를 정의하는 A. NSExtension항목에는 키보드 관련 설정 이 포함되어 있습니다. 튜토리얼 뒷부분에서 이 항목의 중요성을 다룰 것입니다. */

import UIKit

class KeyboardViewController: UIInputViewController {
    var spaceButton: KeyboardButton?
    var deleteButton: KeyboardButton?
    
    //MorseKeyboardView개체 에 대한 참조를 보유하는 속성 입니다.
    var morseKeyboardView: KeyboardView!
    var lastCharacters: [String] = []
    
    //    var lastCharacters1: [String] = []
    
    
    
    
    //띄어 쓰기
    @IBAction func spaceButton(button: UIButton) {
        insertCharacter(" ")
    }
    //if 문으로 하나씪 지운다? stack?pop?
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
        morseKeyboardView = objects.first as? KeyboardView
        //        view = objects[0] as UIView
        guard let inputview = inputView else { return }
        inputview.addSubview(morseKeyboardView)
        
        //morseKeyboardView상위 뷰에 고정하는 제약 조건 이 추가되고 활성화됩니다.
        morseKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([morseKeyboardView.leftAnchor.constraint(equalTo: inputview.leftAnchor),
                                     morseKeyboardView.topAnchor.constraint(equalTo: inputview.topAnchor),
                                     morseKeyboardView.rightAnchor.constraint(equalTo: inputview.rightAnchor),
                                     morseKeyboardView.bottomAnchor.constraint(equalTo: inputview.bottomAnchor)
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
        //        self.nextKeyboardButton.setTitleColor(textColor, for: [])
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
            if 자음.contains(lastCharacter) && 모음.contains(newCharacter) {
                // 자음 + 모음이 합친다.
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
                        deleteCharacterBeforeCursor() // 지우는거
                        lastCharacters.append(newCharacter) //빈배열에 합친다
                        textDocumentProxy.insertText(johab)
                        return            // 가나다라 마다바사 이렇게 자+모음
                    }
                }
            }
            else if let firstCharacter = lastCharacters.first, 자음.contains(firstCharacter),
                    모음.contains(lastCharacter) && 받침.contains(newCharacter)   {   //처음에 모음이 있다면 자음+모음이 여야한다
                if let johab = hangul(c1: firstCharacter, c2: lastCharacter, c3: newCharacter) {
                    deleteCharacterBeforeCursor()   // 여기가  받침을 받아주는거
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
            if 자음.contains(lastCharacter) && 받침.contains(newCharacter) {
                if lastCharacter == "ㄴ" {
                    if newCharacter == "ㅈ" {
                        if let firstCharacter = lastCharacters.first {
                            if firstCharacter == lastCharacter {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄵ")
                                textDocumentProxy.insertText("ㄵ")
                                return
                            } else if let johab = hangul(c1: firstCharacter, c2: "ㄵ", c3: " ") {
                                deleteCharacterBeforeCursor()
                                lastCharacters.removeLast()
                                lastCharacters.append("ㄵ")
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

