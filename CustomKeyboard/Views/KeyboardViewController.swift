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
  func characterBeforeCursor() -> String?
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
    func insertCharacter(_ newCharacter: String) {
        textDocumentProxy.insertText(newCharacter)
    }
    
    func deleteCharacterBeforeCursor() {
        textDocumentProxy.deleteBackward()
    }
    
    func characterBeforeCursor() -> String? {
        guard let character = textDocumentProxy.documentContextBeforeInput?.last else {
          return nil
        }
        return String(character)
    }
}
