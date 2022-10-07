//
//  KeyboardView.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/09/29.
//

import UIKit

protocol UITextDocumentProxyDelegate: AnyObject {
    func insertText(_ button: KeyButton)
    func deleteBackward()
}


public class KeyboardView: UIView {
    var delegate: UITextDocumentProxyDelegate?
    let shiftKeyBoardValues: [String] = ["ㅃ", "ㅉ", "ㄸ", "ㄲ", "ㅆ", "ㅛ", "ㅕ", "ㅑ", "ㅒ", "ㅖ"]
    let firstKeyBoardValues: [String] = ["ㅂ", "ㅈ", "ㄷ", "ㄱ", "ㅅ", "ㅛ", "ㅕ", "ㅑ", "ㅐ", "ㅔ"]
    let secondKeyBoardValues: [String] = ["ㅁ", "ㄴ", "ㅇ", "ㄹ", "ㅎ", "ㅗ", "ㅓ", "ㅏ", "ㅣ"]
    let thirdKeyBoardValues: [String] = ["⇧", "ㅋ", "ㅌ", "ㅊ", "ㅍ", "ㅠ", "ㅜ", "ㅡ", "⌫"]
    let fourthKeyBoardValues: [String] = ["123", "스페이스", "↩︎"]
    
    var isShiftKeyClicked: Bool = false {
        didSet {
            let buttons = [qButton, wButton, eButton, rButton, tButton, yButton, uButton, iButton, oButton, pButton]

            if isShiftKeyClicked {
                for i in 0..<buttons.count {
                    buttons[i].setTitle(shiftKeyBoardValues[i], for: .normal)
                    buttons[i].keyValue = shiftKeyBoardValues[i]
                }
            } else {
                for i in 0..<buttons.count {
                    buttons[i].setTitle(firstKeyBoardValues[i], for: .normal)
                    buttons[i].keyValue = firstKeyBoardValues[i]
                }
            }
        }
    }
    
    // 첫째 줄
    let qButton = KeyButton(keyType: .consonant, keyValue: "ㅂ")
    let wButton = KeyButton(keyType: .consonant, keyValue: "ㅈ")
    let eButton = KeyButton(keyType: .consonant, keyValue: "ㄷ")
    let rButton = KeyButton(keyType: .consonant, keyValue: "ㄱ")
    let tButton = KeyButton(keyType: .consonant, keyValue: "ㅅ")
    let yButton = KeyButton(keyType: .vowel, keyValue: "ㅛ")
    let uButton = KeyButton(keyType: .vowel, keyValue: "ㅕ")
    let iButton = KeyButton(keyType: .vowel, keyValue: "ㅑ")
    let oButton = KeyButton(keyType: .vowel, keyValue: "ㅐ")
    let pButton = KeyButton(keyType: .vowel, keyValue: "ㅔ")
    
    // 둘째 줄
    let aButton = KeyButton(keyType: .consonant, keyValue: "ㅁ")
    let sButton = KeyButton(keyType: .consonant, keyValue: "ㄴ")
    let dButton = KeyButton(keyType: .consonant, keyValue: "ㅇ")
    let fButton = KeyButton(keyType: .consonant, keyValue: "ㄹ")
    let gButton = KeyButton(keyType: .consonant, keyValue: "ㅎ")
    let hButton = KeyButton(keyType: .vowel, keyValue: "ㅗ")
    let jButton = KeyButton(keyType: .vowel, keyValue: "ㅓ")
    let kButton = KeyButton(keyType: .vowel, keyValue: "ㅏ")
    let lButton = KeyButton(keyType: .vowel, keyValue: "ㅣ")
    
    // 셋째 줄
    let shiftButton = KeyButton(keyType: .shift, keyValue: "⇧")
    let zButton = KeyButton(keyType: .consonant, keyValue: "ㅋ")
    let xButton = KeyButton(keyType: .consonant, keyValue: "ㅌ")
    let cButton = KeyButton(keyType: .consonant, keyValue: "ㅊ")
    let vButton = KeyButton(keyType: .consonant, keyValue: "ㅍ")
    let bButton = KeyButton(keyType: .vowel, keyValue: "ㅠ")
    let nButton = KeyButton(keyType: .vowel, keyValue: "ㅜ")
    let mButton = KeyButton(keyType: .vowel, keyValue: "ㅡ")
    let backButton = KeyButton(keyType: .back, keyValue: "⌫")
    
    // 넷째 줄
    let numberButton = KeyButton(keyType: .number, keyValue: "123")
    let spaceButton = KeyButton(keyType: .space, keyValue: "스페이스")
    let enterButton = KeyButton(keyType: .enter, keyValue: "↩︎")
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    let firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
    }()
    
    let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
    }()
    
    let thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
    }()
    
    let fourthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray4
        setViewHierarchy()
        setConstraints()
        registerButtonTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchy() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubviews(firstStackView,
                    secondStackView,
                    thirdStackView,
                    fourthStackView)
        firstStackView.addArrangedSubviews(
            qButton,
            wButton,
            eButton,
            rButton,
            tButton,
            yButton,
            uButton,
            iButton,
            oButton,
            pButton
        )
        secondStackView.addArrangedSubviews(
            aButton,
            sButton,
            dButton,
            fButton,
            gButton,
            hButton,
            jButton,
            kButton,
            lButton
        )
        thirdStackView.addArrangedSubviews(
            shiftButton,
            zButton,
            xButton,
            cButton,
            vButton,
            bButton,
            nButton,
            mButton,
            backButton
        )
        fourthStackView.addArrangedSubviews(
            numberButton,
            spaceButton,
            enterButton
        )
    }
    
    func setConstraints() {
        [mainStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            mainStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func registerButtonTarget() {
        [qButton, wButton, eButton, rButton, tButton, yButton, uButton, iButton, oButton, pButton, aButton, sButton, dButton, fButton, gButton, hButton, jButton, kButton, lButton, zButton, xButton, cButton, vButton, bButton, nButton, mButton, spaceButton].forEach {
            $0.addTarget(self, action: #selector(koreanKeyButtonTapAction), for: .touchUpInside)
        }
        
        backButton.addTarget(self, action: #selector(backKeyButtonTapAction), for: .touchUpInside)
        shiftButton.addTarget(self, action: #selector(shiftKeyButtonTapAction), for: .touchUpInside)
    }
    
    @objc func koreanKeyButtonTapAction(_ sender: KeyButton) {
        delegate?.insertText(sender)
        if shiftKeyBoardValues.contains(sender.keyValue) && !["ㅛ", "ㅕ", "ㅑ"].contains(sender.keyValue) {
            shiftKeyButtonTapAction(shiftButton)
        }
    }
    
    @objc func backKeyButtonTapAction() {
        delegate?.deleteBackward()
    }
    
    @objc func shiftKeyButtonTapAction(_ sender: KeyButton) {
        isShiftKeyClicked = !isShiftKeyClicked
        sender.isSelected = !sender.isSelected
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
