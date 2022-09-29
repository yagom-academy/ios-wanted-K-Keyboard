//
//  KeyboardView.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/09/29.
//

import UIKit

public class KeyboardView: UIView {
    // 첫째 줄
    let qButton = KeyButton(keyType: .korean, keyValue: "ㅂ")
    let wButton = KeyButton(keyType: .korean, keyValue: "ㅈ")
    let eButton = KeyButton(keyType: .korean, keyValue: "ㄷ")
    let rButton = KeyButton(keyType: .korean, keyValue: "ㄱ")
    let tButton = KeyButton(keyType: .korean, keyValue: "ㅅ")
    let yButton = KeyButton(keyType: .korean, keyValue: "ㅛ")
    let uButton = KeyButton(keyType: .korean, keyValue: "ㅕ")
    let iButton = KeyButton(keyType: .korean, keyValue: "ㅑ")
    let oButton = KeyButton(keyType: .korean, keyValue: "ㅐ")
    let pButton = KeyButton(keyType: .korean, keyValue: "ㅔ")
    
    // 둘째 줄
    let aButton = KeyButton(keyType: .korean, keyValue: "ㅁ")
    let sButton = KeyButton(keyType: .korean, keyValue: "ㄴ")
    let dButton = KeyButton(keyType: .korean, keyValue: "ㅇ")
    let fButton = KeyButton(keyType: .korean, keyValue: "ㄹ")
    let gButton = KeyButton(keyType: .korean, keyValue: "ㅎ")
    let hButton = KeyButton(keyType: .korean, keyValue: "ㅗ")
    let jButton = KeyButton(keyType: .korean, keyValue: "ㅓ")
    let kButton = KeyButton(keyType: .korean, keyValue: "ㅏ")
    let lButton = KeyButton(keyType: .korean, keyValue: "ㅣ")
    
    // 셋째 줄
    let shiftButton = KeyButton(keyType: .shift, keyValue: "⇧")
    let zButton = KeyButton(keyType: .korean, keyValue: "ㅋ")
    let xButton = KeyButton(keyType: .korean, keyValue: "ㅌ")
    let cButton = KeyButton(keyType: .korean, keyValue: "ㅊ")
    let vButton = KeyButton(keyType: .korean, keyValue: "ㅍ")
    let bButton = KeyButton(keyType: .korean, keyValue: "ㅠ")
    let nButton = KeyButton(keyType: .korean, keyValue: "ㅜ")
    let mButton = KeyButton(keyType: .korean, keyValue: "ㅡ")
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
    
    let firstKeyBoardValues: [String] = ["ㅂ", "ㅈ", "ㄷ", "ㄱ", "ㅅ", "ㅛ", "ㅕ", "ㅑ", "ㅐ", "ㅔ"]
    let secondKeyBoardValues: [String] = ["ㅁ", "ㄴ", "ㅇ", "ㄹ", "ㅎ", "ㅗ", "ㅓ", "ㅏ", "ㅣ"]
    let thirdKeyBoardValues: [String] = ["⇧", "ㅋ", "ㅌ", "ㅊ", "ㅍ", "ㅠ", "ㅜ", "ㅡ", "⌫"]
    let fourthKeyBoardValues: [String] = ["123", "스페이스", "↩︎"]

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray4
        setViewHierarchy()
        setConstraints()
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
