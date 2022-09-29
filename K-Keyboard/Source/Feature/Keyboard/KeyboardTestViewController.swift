//
//  Keyboard.swift
//  K-Keyboard
//
//  Created by KangMingyo on 2022/09/29.
//

import UIKit

class KeyboardTestViewController: UIViewController {
    let textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .secondarySystemBackground
        textField.clearButtonMode = .never
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(textField)
        
        let safeArea = view.safeAreaLayoutGuide
        
        textField.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20).isActive = true
        textField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
