//
//  CustomKeyboardButton.swift
//  custom-keyboard
//
//  Created by 신동원 on 2022/09/30.
//

import UIKit

class CustomButton: UIButton {
    
    var buttonTextColor = UIColor.white
    var buttonBackgroundColor = UIColor.systemGray
    var buttonHighlightBackgroundColor = UIColor.systemGray2
    var buttonHighlightTextColor = UIColor.blue
    var keyType: KeyType
    
    override open var isHighlighted: Bool {
        didSet {
            tintColor = isHighlighted ? buttonHighlightTextColor : buttonTextColor
            backgroundColor = isHighlighted ? buttonHighlightBackgroundColor : buttonBackgroundColor
        }
    }
    
    init(frame: CGRect, keyType: KeyType = .normal) {
        self.keyType = keyType
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = buttonBackgroundColor
        tintColor = buttonTextColor
        setTitleColor(buttonTextColor, for: .normal)
        setTitleColor(buttonHighlightTextColor, for: .highlighted)
        adjustsImageWhenHighlighted = false
        titleLabel?.adjustsFontSizeToFitWidth = true
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
    func addMenu(keyTitle: [String], handler: @escaping (UIAction) -> () ) {
        
        var menuElement: [UIMenuElement] = []
        for title in keyTitle {
            menuElement.append(UIAction(title: title, handler: handler))
        }
        
        menu = UIMenu(title: "단축키", image: nil, identifier: nil, children: menuElement)
    }
}
extension UIInputView: UIInputViewAudioFeedback {
    public var enableInputClicksWhenVisible: Bool {
        return true
    }
}

