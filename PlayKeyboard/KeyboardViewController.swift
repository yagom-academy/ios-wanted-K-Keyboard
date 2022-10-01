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
    var charLine1Buttons: [KeyboardButton]?
//    var longPressDeleteButtonTimer: Timer?
    //MorseKeyboardView개체 에 대한 참조를 보유하는 속성 입니다.
    var morseKeyboardView: MorseKeyboardView!
    
//    var language:TextString.language = .en
    
    var lastCharacters: [String] = []
    var isPushedShift = false {
        didSet{
            self.changedShiftValue()
        }
    }
    
    let cho: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    let jung: [String] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ","ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
    let jong: [String] = [" ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ","ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    
    //띄어 쓰기
    @IBAction func spaceButton(button: UIButton) {
        insertCharacter(" ")
    }
    //if 문으로 하나씪 지운다? stack?pop?
    @IBAction func backButton (button: UIButton) {
        deleteCharacterBeforeCursor()
    }
    // 문자 입력하기
    @IBAction func buttonPressed(button: UIButton) {
        let string = button.titleLabel?.text
        insertCharacter("\(string!)")
    }
    
    
    func hangul(c1:String,c2:String,c3:String) -> String? {
        var cho_i = 0
        var jung_i = 0
        var jong_i = 0
        for i in 0 ..< cho.count {
            if cho[i] == c1 {
                cho_i = i
            }
        }
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
     
        
        // 인스턴스가 MorseKeyboardView컨트롤러의 루트에 추가됩니다 inputView.
        let nib = UINib(nibName: "MorseKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        morseKeyboardView = objects.first as? MorseKeyboardView
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
        let 모음: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        let 자음: [String] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ","ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
        defer {
            print("함수끝났을대 배열: \(lastCharacters)")
        }
        print("이전배열: \(lastCharacters)")
        if let lastCharacter = lastCharacters.last {
            if 모음.contains(lastCharacter) && 자음.contains(newCharacter) {
                if let johab = hangul(c1: lastCharacter, c2: newCharacter, c3: " ") {
                    deleteCharacterBeforeCursor()
                    lastCharacters.append(newCharacter)
                    textDocumentProxy.insertText(johab)
                    return
                }
            } else if let firstCharacter = lastCharacters.first, 모음.contains(firstCharacter), 자음.contains(lastCharacter) && 모음.contains(newCharacter) {
                if let johab = hangul(c1: firstCharacter, c2: lastCharacter, c3: newCharacter) {
                    deleteCharacterBeforeCursor()
                    lastCharacters.append(newCharacter)
                    textDocumentProxy.insertText(johab)
                    return
                }
            }
        }
        lastCharacters = []
        lastCharacters.append(newCharacter)
        textDocumentProxy.insertText(newCharacter)
    }
    
    
    func changedShiftValue(){
        
    }
    @objc func touchUpDeleteKey() {
        self.deleteCharacterBeforeCursor()
        if isPushedShift { isPushedShift = false }
    }
    @objc func deleteCharacterBeforeCursor() {
        self.textDocumentProxy.deleteBackward()
        UIDevice.current.playInputClick()
    }
    
//    @objc func longTouchDeleteGesture(_ sender:UIGestureRecognizer) {
//        if sender.state == .began {
//            self.longPressDeleteButtonTimer =
//                Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.deleteCharacterBeforeCursor), userInfo: nil, repeats: true)
//        } else if sender.state == .ended || sender.state == .cancelled {
//            self.longPressDeleteButtonTimer?.invalidate()
//            self.longPressDeleteButtonTimer = nil
//        }
//    }
    
    func characterBeforeCursor() -> String? {
        return nil
    }
    
    
    
    
}

