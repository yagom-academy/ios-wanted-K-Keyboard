//
//  ThirdFloor.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

class ThirdFloor : Floor {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundViewForPadding.addSubviews(btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundViewForPadding.addSubviews(btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9)
        setConstraints()
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var btn1 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅁ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn2 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㄴ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn3 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅇ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn4 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㄹ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn5 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅎ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn6 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅗ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn7 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅓ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn8 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅏ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn9 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅣ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()

    
    func setConstraints(){
        setConstraint(btn1, to: self.backgroundViewForPadding, centerX: 0.2, width: typicalWidth)
        setConstraint(btn2, to: self.backgroundViewForPadding, centerX: 0.4, width: typicalWidth)
        setConstraint(btn3, to: self.backgroundViewForPadding, centerX: 0.6, width: typicalWidth)
        setConstraint(btn4, to: self.backgroundViewForPadding, centerX: 0.8, width: typicalWidth)
        setConstraint(btn5, to: self.backgroundViewForPadding, centerX: 1, width: typicalWidth)
        setConstraint(btn6, to: self.backgroundViewForPadding, centerX: 1.2, width: typicalWidth)
        setConstraint(btn7, to: self.backgroundViewForPadding, centerX: 1.4, width: typicalWidth)
        setConstraint(btn8, to: self.backgroundViewForPadding, centerX: 1.6, width: typicalWidth)
        setConstraint(btn9, to: self.backgroundViewForPadding, centerX: 1.8, width: typicalWidth)
    }

}
