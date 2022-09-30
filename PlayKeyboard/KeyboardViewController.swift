//
//  KeyboardViewController.swift
//  PlayKeyboard
//
//  Created by 김지인 on 2022/09/29.
/*KeyboardViewController.swift : UIInputViewController커스텀 키보드 확장을 위한 기본 뷰 컨트롤러 역할을 하는 서브클래스. MorseKeyboardView여기 에서 에서 수행된 방식과 유사한 키보드에 대한 사용자 지정 논리를 연결 하고 구현합니다 PracticeViewController.
Info.plist : plist확장에 대한 메타데이터를 정의하는 A. NSExtension항목에는 키보드 관련 설정 이 포함되어 있습니다. 튜토리얼 뒷부분에서 이 항목의 중요성을 다룰 것입니다. */

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    //MorseKeyboardView개체 에 대한 참조를 보유하는 속성 입니다.
    var morseKeyboardView: MorseKeyboardView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 인스턴스가 MorseKeyboardView컨트롤러의 루트에 추가됩니다 inputView.
        let nib = UINib(nibName: "MorseKeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: nil, options: nil)
        morseKeyboardView = objects.first as! MorseKeyboardView
//        view = objects[0] as? UIView
        guard let inputview = inputView else { return }
        inputview.addSubview(morseKeyboardView)
        
        //morseKeyboardView상위 뷰에 고정하는 제약 조건 이 추가되고 활성화됩니다.
        morseKeyboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([morseKeyboardView.leftAnchor.constraint(equalTo: inputview.leftAnchor),
                                     morseKeyboardView.topAnchor.constraint(equalTo: inputview.topAnchor),
                                     morseKeyboardView.rightAnchor.constraint(equalTo: inputview.rightAnchor),
                                     morseKeyboardView.bottomAnchor.constraint(equalTo: inputview.bottomAnchor)
                                    ])
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

    }
    
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
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
}
