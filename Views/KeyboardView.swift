//
//  MorseKeyboardView.swift
//  K-Keyboard
//
//  Created by 1 on 2022/09/29.
//

import UIKit

class KeyboardView: UIView {
    
    
    lazy var button: KeyboardButton = {
        let btn = KeyboardButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        return btn
    }()
    
    func getTitle() -> String {
        return self.button.titleLabel?.text ?? ""
    }

}

