//
//  KeyboardViewController.swift
//  KorKeyboard
//
//  Created by Subin Kim on 2022/10/05.
//

import UIKit

class KeyboardViewController: UIInputViewController {

//    @IBOutlet var nextKeyboardButton: UIButton!
    let keyboardView = KorKeyboardView()
    let shortcutView = ShortcutView()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        setConstraints()

        // Perform custom UI setup here
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
    
    override func viewWillLayoutSubviews() {
//        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
//        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
//        var textColor: UIColor
//        let proxy = self.textDocumentProxy
//        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
//            textColor = UIColor.white
//        } else {
//            textColor = UIColor.black
//        }
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}

extension KeyboardViewController {
    func addViews() {
        guard let inputView = inputView else { return }

        [keyboardView, shortcutView].forEach { inputView.addSubview($0) }

        keyboardView.delegate = self
        shortcutView.delegate = self
        shortcutView.isHidden = true
    }

    func setConstraints() {
        guard let inputView = inputView else { return }

        [keyboardView, shortcutView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            keyboardView.topAnchor.constraint(equalTo: inputView.topAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: inputView.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: inputView.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
            shortcutView.centerXAnchor.constraint(equalTo: inputView.centerXAnchor),
            shortcutView.centerYAnchor.constraint(equalTo: inputView.centerYAnchor),
            shortcutView.leadingAnchor.constraint(equalTo: inputView.leadingAnchor, constant: 20),
            shortcutView.trailingAnchor.constraint(equalTo: inputView.trailingAnchor, constant: -20),
            shortcutView.heightAnchor.constraint(equalTo: inputView.heightAnchor, multiplier: 0.5)
        ])
    }
}

extension KeyboardViewController: KorKeyboardViewDelegate {
    func insertCharacter(_ input: String) {
        textDocumentProxy.insertText(input)
    }

    func deleteCharacterBeforeCursor() {
        textDocumentProxy.deleteBackward()
    }

    func showShortcutView() {
        shortcutView.isHidden = false
    }
}

extension KeyboardViewController: ShortcutViewDelegate {
    func updateShortcut() {
        keyboardView.shortcutButton.setTitle(ShortcutData.now, for: .normal)
    }
}
