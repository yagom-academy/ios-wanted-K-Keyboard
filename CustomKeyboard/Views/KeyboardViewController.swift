//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

protocol KeyboardViewDelegate : AnyObject {
  func insertCharacter(_ newCharacter: String)
  func deleteCharacterBeforeCursor()
  func characterBeforeCursor() -> Character?
    func insertSpace()
}

class KeyboardViewController: UIInputViewController {
    //A UIInputViewController subclass that acts as the primary view controller for custom keyboard extensions. This is where you’ll connect the MorseKeyboardView and implement any custom logic for the keyboard similar to how it’s done in PracticeViewController.

    //the main requirement of a custom keyboard is that it provides a key to switch to other keyboards.

    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    lazy var backView : KeyboardView = {
        let view = KeyboardView(frame: .zero)
        return view
    }()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let heightConstraint = NSLayoutConstraint(item: self.view, attribute: .height, relatedBy: .equal, toItem: nil , attribute: .notAnAttribute, multiplier: 0.0, constant: 200)
//                self.view.addConstraint(heightConstraint)
        
        
        
        // Perform custom UI setup here
//        self.nextKeyboardButton = UIButton(type: .system)
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.backgroundColor = .brown
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
//
//        //handleInputModeList(from:with:), this method provides two different pieces of functionality: 1.Tapping the button will switch to the next keyboard in the list of user-enabled keyboards. 2.Long-pressing the button will present the keyboard list.
//
//        self.view.addSubview(self.nextKeyboardButton)
//
//        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
      
        self.view.addSubviews(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        backView.firstFloor.setNextKeyboardVisible(needsInputModeSwitchKey)
        backView.firstFloor.btnNext.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        backView.firstFloor.delegate = self
        backView.secondFloor.delegate = self
        backView.thridFloor.delegate = self
        backView.forthFloor.delegate = self
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
       // self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        fixKeyboardHeight()
//    }
//
//
    //뚝뚝 끊김
//    override func viewWillAppear(_ animated: Bool) {
//        fixKeyboardHeight()
//    }
////
//    //회전 후 portait으로 돌아오면 키보드 높이가 달라져있음. 그것을 고정
//    func fixKeyboardHeight(){
//        let desiredHeight:CGFloat!
////        if UIDevice.current.userInterfaceIdiom == .phone{
////                desiredHeight = 259
////        }else{
//            if UIDevice.current.orientation == .portrait{
//                desiredHeight = UIScreen.main.bounds.height / 4
//            }else {
//                desiredHeight = UIScreen.main.bounds.height / 3
//            }
// //       }
//        let heightConstraint = NSLayoutConstraint(item: self.view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1.0, constant: desiredHeight)
//        view.addConstraint(heightConstraint)
//    }

}





//Info.plist
//A plist that defines the metadata for your extension. The NSExtension item contains keyboard specific settings. You’ll cover the importance of this item later in the tutorial.



extension KeyboardViewController : KeyboardViewDelegate{
    
    func insertSpace(){
        textDocumentProxy.insertText(" ")
    }
    
    func insertCharacter(_ newCharacter: String) {
        //characterBeforeCursor호출하여 전 글자를 가져온다
        guard let last = characterBeforeCursor(), last != " " else {
            //전 글자가 없다면 그냥 입력
            textDocumentProxy.insertText(newCharacter)
            return
        }
        //전 글자가 있다면 합성할 수 있는지 없는지 검사(같은 프로토콜인지 아닌지 검사)
        let char = Character(newCharacter)
        let (cho,jung,jong) = Hangle.decompose(char: last)
        //newCharacter가 모음인지 자음인지 검사
        if Hangle.isVowel(char){ //newCharacter가 모음
            if jong != " "{//1.종성이 있을 때
                if Hangle.isDoubleFinalConsonant(jong){ // 1.1 종성이 겹받침일 때
                    let oldJong = Hangle.decomposeDoubleFinalConsonant(jong).0
                    let newJong = Hangle.decomposeDoubleFinalConsonant(jong).1
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: jung, c3: oldJong)))
                    textDocumentProxy.insertText(String(Hangle.compose(c1: newJong, c2: char, c3: " ")))
                }else{ //1.2 종성이 겹받침이 아닐 때
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: jung, c3: " ")))
                    textDocumentProxy.insertText(String(Hangle.compose(c1: jong, c2: char, c3: " ")))
                }
            }else if jung != " "{//2.종성은 없고 중성이 있을 때
                if let newJung = Hangle.exceptionForJungSung(jung: jung, input: char){//2.1 중성이 이중모음되는 것이 가능할 때
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: newJung, c3: " ")))
                }else{//2.2 중성이 이중모음되는 것이 불가능할 때
                    textDocumentProxy.insertText(String(Hangle.compose(c1: char, c2: " ", c3: " ")))
                }
            }else{//3.초성만 있을 때
                textDocumentProxy.deleteBackward()
                textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: char, c3: " ")))
            }
        }else{ //newCharacter가 자음
            if jong != " "{//1.종성이 있을 때
                if Hangle.isDoubleFinalConsonant(jong){ // 1.1 종성이 겹받침일 때
                    textDocumentProxy.insertText(String(Hangle.compose(c1: char, c2: " ", c3: " ")))
                }else{ //1.2 종성이 겹받침이 아닐 때
                    if let doubleConsonant = Hangle.exceptionForJongSung(jong: jong, input: char){//1.2.1 새로 입력되는 글자가 겹받침이 가능할 때
                        textDocumentProxy.deleteBackward()
                        textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: jung, c3: doubleConsonant)))
                    }else{//1.2.2 새로 입력되는 글자가 겹받침이 불가능할 때
                        textDocumentProxy.insertText(String(Hangle.compose(c1: char, c2: " ", c3: " ")))
                    }
                }
            }else if jung != " "{//2.종성은 없고 중성이 있을 때
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: jung, c3: char)))
            }else{//3.초성만 있을 때
                textDocumentProxy.insertText(String(Hangle.compose(c1: char, c2:" ",c3:" ")))
            }
        }
    }
    
    func deleteCharacterBeforeCursor() {
        //characterBeforeCursor호출하여 지울 글자를 가져온다
        guard let last = characterBeforeCursor(), last != " " else {
            textDocumentProxy.deleteBackward()
            return
        }
        //가져온 글자를 분석한다
        //만약 공백이면 초성,중성,종성 모두 공백으로 반환
        let (cho,jung,jong) = Hangle.decompose(char: last)
        //1.종성까지 모두 다 있는 상황
        if jong != " "{
            if Hangle.isDoubleFinalConsonant(jong){//1-1.겹받침
                let newJong = Hangle.decomposeDoubleFinalConsonant(jong).0
                textDocumentProxy.deleteBackward()
                textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: jung, c3: newJong)))
            }else{//1-2.일반받침
                textDocumentProxy.deleteBackward()
                textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: jung, c3: " ")))
            }
        }else if jung != " "{//2.중성까지 있는 상황
            textDocumentProxy.deleteBackward()
            textDocumentProxy.insertText(String(Hangle.compose(c1: cho, c2: " ", c3: " ")))
        }else{//3.초성만 있는 상황 && 공백인 상황
            textDocumentProxy.deleteBackward()
        }
    }
    
    func characterBeforeCursor() -> Character? {
        guard let character = textDocumentProxy.documentContextBeforeInput?.last else {
          return nil
        }
        return character
    }
}
