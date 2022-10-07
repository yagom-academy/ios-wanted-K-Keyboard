//
//  KeyButton.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/09/29.
//

import UIKit

enum KeyType {
    case consonant
    case vowel
    case shift
    case back
    case number
    case space
    case enter
}

class KeyButton: UIButton {
    var keyType: KeyType
    var keyValue: String
    
    init(keyType: KeyType, keyValue: String) {
        self.keyType = keyType
        self.keyValue = keyValue
        super.init(frame: .zero)
        
        setupView(keyValue)
        
        switch keyType {
        case .consonant, .vowel:
            widthAnchor.constraint(equalToConstant: 30).isActive = true
            backgroundColor = .white
        case .shift:
            setBackgroundColor(.lightGray, for: .normal)
            setBackgroundColor(.white, for: .selected)
            widthAnchor.constraint(equalToConstant: 35).isActive = true
        case .back:
            backgroundColor = .lightGray
            widthAnchor.constraint(equalToConstant: 35).isActive = true
        case .number, .enter:
            backgroundColor = .lightGray
            widthAnchor.constraint(equalToConstant: 80).isActive = true
        case .space:
            backgroundColor = .white
            widthAnchor.constraint(equalToConstant: 150).isActive = true
        }
        
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(_ value: String) {
        setTitle(value, for: .normal)
        setTitleColor(.black, for: .normal)
        layer.cornerRadius = 4
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}
