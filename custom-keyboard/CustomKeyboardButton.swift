//
//  CustomKeyboardButton.swift
//  custom-keyboard
//
//  Created by 신동원 on 2022/09/30.
//

import UIKit

class CustomButton: UIButton {
    
}

class KeyboardButton: UIView {
    //var defaultBackgroundColor: UIColor = .white
    //var highlightBackgroundColor: UIColor = .lightGray
    
    var buttonTextColor = UIColor.white
    var buttonBackgroundColor = UIColor.systemGray5
    var buttonHighlightColor = UIColor.systemGray2
    
    lazy var button: CustomButton = {
        let btn = CustomButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = buttonBackgroundColor
        btn.setTitleColor(buttonTextColor, for: .normal)
        btn.tintColor = buttonTextColor
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    //custom views should override this to return true if
    //they cannot layout correctly using autoresizing.
    //from apple docs https://developer.apple.com/documentation/uikit/uiview/1622549-requiresconstraintbasedlayout
    override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        layer.cornerRadius = 10.0
        layer.masksToBounds = true

        addSubview(button)
        button.setTitleColor(buttonTextColor, for: .normal)
        button.tintColor = buttonTextColor
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setTitle(text:String?, for state: UIControl.State) {
        DispatchQueue.main.async {
            self.button.setTitle(text, for: state)
        }
    }
    
    func getTitle() -> String {
        return self.button.titleLabel?.text ?? ""
    }
    
    func setTitleColor(_ color: UIColor?, for state: UIControl.State) {
        self.button.setTitleColor(color, for: .normal)
    }
}
extension UIInputView: UIInputViewAudioFeedback {
    public var enableInputClicksWhenVisible: Bool {
        return true
    }
}

