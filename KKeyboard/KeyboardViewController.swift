//
//  KeyboardViewController.swift
//  KKeyboard
//
//  Created by 권준상 on 2022/09/29.
//

import UIKit

class KeyboardViewController: UIInputViewController, UITextDocumentProxyDelegate, ChangeKeyboardDelegate {

    @IBOutlet var nextKeyboardButton: UIButton!
    let keyboardView = KeyboardView()
    let keyboardAccessoryView = KeyboardAccessoryView()
    let oftenUsedView = OftenUsedView()
    var keyBoardState: KeyboardState = .start
    var oftenUsedWordList: [String] = ["안녕하세요~", "감사합니다!", "지금 가는 중이야!"]
    
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
        oftenUsedView.tableView.delegate = self
        oftenUsedView.tableView.dataSource = self
        inputView.allowsSelfSizing = true
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        keyboardAccessoryView.translatesAutoresizingMaskIntoConstraints = false
        oftenUsedView.translatesAutoresizingMaskIntoConstraints = false
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
    
    func changeToMainKeyboard() {
        oftenUsedView.removeFromSuperview()
        
        NSLayoutConstraint.deactivate([
            oftenUsedView.topAnchor.constraint(equalTo: keyboardAccessoryView.bottomAnchor),
            oftenUsedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            oftenUsedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            oftenUsedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        guard let inputView = inputView else { return }
        inputView.addSubview(keyboardView)
        
        NSLayoutConstraint.activate([
            keyboardView.topAnchor.constraint(equalTo: keyboardAccessoryView.bottomAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func changeToOftenUsedKeyboard() {
        keyboardView.removeFromSuperview()
        
        NSLayoutConstraint.deactivate([
            keyboardView.topAnchor.constraint(equalTo: keyboardAccessoryView.bottomAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        guard let inputView = inputView else { return }
        inputView.addSubview(oftenUsedView)
        
        NSLayoutConstraint.activate([
            oftenUsedView.topAnchor.constraint(equalTo: keyboardAccessoryView.bottomAnchor),
            oftenUsedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            oftenUsedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            oftenUsedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        oftenUsedView.tableView.reloadData()
    }

}

extension KeyboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oftenUsedWordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? OftenUsedCell else { return UITableViewCell() }
        cell.titleLabel.text = oftenUsedWordList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "자주 쓰는 말"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(oftenUsedWordList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
