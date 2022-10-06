//
//  KeyboardViewController.swift
//  KKeyboard
//
//  Created by 권준상 on 2022/09/29.
//

import UIKit

class KeyboardViewController: UIInputViewController, UITextDocumentProxyDelegate, ChangeKeyboardDelegate {
    func changeToMainKeyboard() {
        print("change")
    }
    
    func changeToOftenUsedKeyboard() {
        print("often")
    }
    

    @IBOutlet var nextKeyboardButton: UIButton!
    let keyboardView = KeyboardView()
    let keyboardAccessoryView = KeyboardAccessoryView()
    var keyBoardState: KeyboardState = .start
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayouts()
    }
    
    func setLayouts() {
        setProperties()
        setViewHierarchy()
        setConstraints()
    }
    
    func setProperties() {
        guard let inputView = inputView else { return }
        keyboardView.delegate = self
        keyboardAccessoryView.delegate = self
        inputView.allowsSelfSizing = true
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        keyboardAccessoryView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setViewHierarchy() {
        guard let inputView = inputView else { return }
        inputView.addSubviews(keyboardAccessoryView, keyboardView)
    }
    
    func setConstraints() {
        guard let inputView = inputView else { return }
        let heightConstraint = inputView.heightAnchor.constraint(equalToConstant: 256)
        heightConstraint.priority = UILayoutPriority(rawValue: 999)
        heightConstraint.isActive = true

        NSLayoutConstraint.activate([
            keyboardAccessoryView.topAnchor.constraint(equalTo: view.topAnchor),
            keyboardAccessoryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardAccessoryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardAccessoryView.heightAnchor.constraint(equalToConstant: 40),
            keyboardView.topAnchor.constraint(equalTo: keyboardAccessoryView.bottomAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func updateConstraints() {
    
        NSLayoutConstraint.deactivate([
            keyboardView.topAnchor.constraint(equalTo: keyboardAccessoryView.bottomAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func insertText(_ button: KeyButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        let (state, text, shouldDeleted) = KoreanAutomata.shared.insertLogic(state: keyBoardState,
                                                     text: button.keyValue,
                                                     keyType: button.keyType)
        keyBoardState = state
        if shouldDeleted {
            proxy.deleteBackward()
        }
        proxy.insertText(text)
    }
    
    func deleteBackward() {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        let (state, text) = KoreanAutomata.shared.deleteLogic(state: keyBoardState)
        keyBoardState = state
        proxy.deleteBackward()
        proxy.insertText(text)
    }

}
