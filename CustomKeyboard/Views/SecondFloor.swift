//
//  SecondFloor.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

class SecondFloor : Floor {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundViewForPadding.addSubviews(btnShift,btn1,btn2,btn3,btn4,btn5,btn6,btn7,btnDelete)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundViewForPadding.addSubviews(btnShift,btn1,btn2,btn3,btn4,btn5,btn6,btn7,btnDelete)
        setConstraints()
        fatalError("init(coder:) has not been implemented")
    }

    lazy var btnShift : KeyboardButton = {
        let btn = KeyboardButton()
        let img = UIImage(systemName: "shift")
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
       // btn.addTarget(self, action: #selector(shift), for: .touchUpInside)
        return btn
    }()
    lazy var btn1 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅋ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn2 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅌ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn3 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅊ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn4 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅍ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn5 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅠ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn6 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅜ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btn7 : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("ㅡ", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        return btn
    }()
    lazy var btnDelete : KeyboardButton = {
        let btn = KeyboardButton()
        let img = UIImage(named: "Backspace")
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(deleteBackwards), for: .touchUpInside)
        return btn
    }()
    
    func setConstraints(){
        setConstraint(btnShift, to: self.backgroundViewForPadding, centerX: 0.12, width: shiftDeleteWidth)
        setConstraint(btn1, to: self.backgroundViewForPadding, centerX: 0.4, width: typicalWidth)
        setConstraint(btn2, to: self.backgroundViewForPadding, centerX: 0.6, width: typicalWidth)
        setConstraint(btn3, to: self.backgroundViewForPadding, centerX: 0.8, width: typicalWidth)
        setConstraint(btn4, to: self.backgroundViewForPadding, centerX: 1, width: typicalWidth)
        setConstraint(btn5, to: self.backgroundViewForPadding, centerX: 1.2, width: typicalWidth)
        setConstraint(btn6, to: self.backgroundViewForPadding, centerX: 1.4, width: typicalWidth)
        setConstraint(btn7, to: self.backgroundViewForPadding, centerX: 1.6, width: typicalWidth)
        setConstraint(btnDelete, to: self.backgroundViewForPadding, centerX: 1.88, width: shiftDeleteWidth)
    }

}

