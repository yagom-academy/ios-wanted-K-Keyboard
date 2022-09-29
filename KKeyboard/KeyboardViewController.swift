//
//  KeyboardViewController.swift
//  KKeyboard
//
//  Created by 권준상 on 2022/09/29.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let keyboardView = KeyboardView()
        guard let inputView = inputView else { return }
        inputView.addSubview(keyboardView)
        inputView.allowsSelfSizing = true
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = inputView.heightAnchor.constraint(equalToConstant: 216)
        heightConstraint.priority = UILayoutPriority(rawValue: 999)
        heightConstraint.isActive = true

        NSLayoutConstraint.activate([
            keyboardView.topAnchor.constraint(equalTo: view.topAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}
