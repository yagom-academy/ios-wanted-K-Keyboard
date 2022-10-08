//
//  FourthFloor.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

class ForthFloor : Floor {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundViewForPadding.addSubviews(btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9,btn10)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundViewForPadding.addSubviews(btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9,btn10)
        setConstraints()
        fatalError("init(coder:) has not been implemented")
    }

    lazy var btn1 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅂ", for: .normal)
        btn.originalTitle = "ㅂ"
        btn.shiftedTitle = "ㅃ"
        return btn
    }()
    lazy var btn2 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.originalTitle = "ㅈ"
        btn.shiftedTitle = "ㅉ"
        btn.setTitle("ㅈ", for: .normal)
        return btn
    }()
    lazy var btn3 : KeyboardButton = {
        lazy var btn = KeyboardButton()
        btn.originalTitle = "ㄷ"
        btn.shiftedTitle = "ㄸ"
        btn.setTitle("ㄷ", for: .normal)
        return btn
    }()
    lazy var btn4 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.originalTitle = "ㄱ"
        btn.shiftedTitle = "ㄲ"
        btn.setTitle("ㄱ", for: .normal)
        return btn
    }()
    lazy var btn5 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.originalTitle = "ㅅ"
        btn.shiftedTitle = "ㅆ"
        btn.setTitle("ㅅ", for: .normal)
        return btn
    }()
    lazy var btn6 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅛ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn7 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅕ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn8 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅑ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn9 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅐ", for: .normal)
        btn.originalTitle = "ㅐ"
        btn.shiftedTitle = "ㅒ"
        return btn
    }()
    lazy var btn10 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.originalTitle = "ㅔ"
        btn.shiftedTitle = "ㅖ"
        btn.setTitle("ㅔ", for: .normal)
        return btn
    }()
    
    func setConstraints(){
        setConstraint(btn1, to: self.backgroundViewForPadding, centerX: 0.1, width: typicalWidth)
        setConstraint(btn2, to: self.backgroundViewForPadding, centerX: 0.3, width: typicalWidth)
        setConstraint(btn3, to: self.backgroundViewForPadding, centerX: 0.5, width: typicalWidth)
        setConstraint(btn4, to: self.backgroundViewForPadding, centerX: 0.7, width: typicalWidth)
        setConstraint(btn5, to: self.backgroundViewForPadding, centerX: 0.9, width: typicalWidth)
        setConstraint(btn6, to: self.backgroundViewForPadding, centerX: 1.1, width: typicalWidth)
        setConstraint(btn7, to: self.backgroundViewForPadding, centerX: 1.3, width: typicalWidth)
        setConstraint(btn8, to: self.backgroundViewForPadding, centerX: 1.5, width: typicalWidth)
        setConstraint(btn9, to: self.backgroundViewForPadding, centerX: 1.7, width: typicalWidth)
        setConstraint(btn10, to: self.backgroundViewForPadding, centerX: 1.9, width: typicalWidth)
    }

}
