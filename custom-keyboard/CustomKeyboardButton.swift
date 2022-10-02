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
    
    override open var isHighlighted: Bool {
        didSet {
            tintColor = isHighlighted ? buttonHighlightTextColor : buttonTextColor
            backgroundColor = isHighlighted ? buttonHighlightBackgroundColor : buttonBackgroundColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = buttonBackgroundColor
        tintColor = buttonTextColor
        setTitleColor(buttonTextColor, for: .normal)
        setTitleColor(buttonHighlightTextColor, for: .highlighted)
        adjustsImageWhenHighlighted = false
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
}
extension UIInputView: UIInputViewAudioFeedback {
    public var enableInputClicksWhenVisible: Bool {
        return true
    }
}

