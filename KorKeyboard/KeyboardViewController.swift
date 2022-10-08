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
    let toolbarView = KorKeyboardToolbarView()
    let favoritesView = FavoritesView()
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        setConstraints()

        // Perform custom UI setup here
        self.keyboardView.nextButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        if !self.needsInputModeSwitchKey {
            self.keyboardView.shortcutButton.leadingAnchor.constraint(equalTo: self.keyboardView.leadingAnchor, constant: 4).isActive = true
        }
    }
    
    override func viewWillLayoutSubviews() {
        self.keyboardView.nextButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
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

        [toolbarView, keyboardView, shortcutView, favoritesView].forEach { inputView.addSubview($0) }

        keyboardView.delegate = self
        shortcutView.delegate = self
        toolbarView.delegate = self
        favoritesView.delegate = self
        
        shortcutView.isHidden = true
        favoritesView.isHidden = true
    }

    func setConstraints() {
        guard let inputView = inputView else { return }

        [toolbarView, keyboardView, shortcutView, favoritesView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            toolbarView.topAnchor.constraint(equalTo: inputView.topAnchor, constant: 10),
            toolbarView.leadingAnchor.constraint(equalTo: inputView.leadingAnchor),
            toolbarView.trailingAnchor.constraint(equalTo: inputView.trailingAnchor),
            toolbarView.heightAnchor.constraint(equalToConstant: 30),
            keyboardView.topAnchor.constraint(equalTo: toolbarView.bottomAnchor, constant: 10),
            keyboardView.leadingAnchor.constraint(equalTo: inputView.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: inputView.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
            favoritesView.topAnchor.constraint(equalTo: toolbarView.bottomAnchor, constant: 10),
            favoritesView.leadingAnchor.constraint(equalTo: inputView.leadingAnchor),
            favoritesView.trailingAnchor.constraint(equalTo: inputView.trailingAnchor),
            favoritesView.bottomAnchor.constraint(equalTo: inputView.bottomAnchor),
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

extension KeyboardViewController: KorKeyboardToolbarViewDelegate {
    @objc func keyboardButtonPressed() {
        keyboardView.isHidden = false
        favoritesView.isHidden = true
    }
    
    @objc func favoritesButtonPressed() {
        keyboardView.isHidden = true
        favoritesView.isHidden = false
    }
}

extension KeyboardViewController: FavoritesViewDelegate {
    func insertPhrase(_ input: String) {
        textDocumentProxy.insertText(input)
    }
}
