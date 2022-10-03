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
    
    lazy var model: KeyboardModel = KeyboardModel(textDocumentProxy: self.textDocumentProxy)
    
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
        initViewHierarchy()
        configureView()
        bind()
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
        
        // TODO: 얘는 어떻게 쓰는 건지 확인을 해봐야...
        var textColor: UIColor
        if model.textDocumentProxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
    }

}

// TODO: Presentable
//LoadView를 넣으니 앱이 죽음...익스텐션은 다른가 좀 확인 필요...
extension KeyboardViewController: Presentable {
    func initViewHierarchy() {
        self.view.addSubviews(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        backView.firstFloor.setNextKeyboardVisible(needsInputModeSwitchKey)
    }
    
    func configureView() {
        
    }
    
    func bind() {
        backView.firstFloor.btnNext.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        backView.firstFloor.delegate = self.model
        backView.secondFloor.delegate = self.model
        backView.thridFloor.delegate = self.model
        backView.forthFloor.delegate = self.model
    }
}

