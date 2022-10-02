//
//  FirstFloor.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

class FirstFloor : Floor {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundViewForPadding.addSubviews(btnNumber,btnSpace,btnEnter)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundViewForPadding.addSubviews(btnNumber,btnSpace,btnEnter)
        setConstraints()
        fatalError("init(coder:) has not been implemented")
    }

    lazy var btnNumber : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("123", for: .normal)
        return btn
    }()
    lazy var btnNext : KeyboardButton = {
        let btn = KeyboardButton()
        let img = UIImage(systemName: "globe")
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        return btn
    }()
    lazy var btnSpace : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("스페이스", for: .normal)
        return btn
    }()
    lazy var btnEnter : KeyboardButton = {
        let btn = KeyboardButton()
        let img = UIImage(systemName: "arrow.turn.down.left")
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(inspect), for: .touchUpInside)
        return btn
    }()
  
    func setConstraints(){
        setConstraint(btnNumber, to: self.backgroundViewForPadding, centerX: 0.25, width: numberEnterWidth)
        setConstraint(btnSpace, to: self.backgroundViewForPadding, centerX: 1, width: spaceWidth)
        setConstraint(btnEnter, to: self.backgroundViewForPadding, centerX: 1.75, width: numberEnterWidth)
    }
    //지구본버튼 추가여부를 결정하는 메소드
    func setNextKeyboardVisible(_ visible: Bool) {
        if visible{
            removeConstraints(btnNumber.constraints)
            setConstraint(btnNumber, to: self.backgroundViewForPadding, centerX: 0.15, width: 0.13)
            addSubviews(btnNext)
            setConstraint(btnNext, to: self.backgroundViewForPadding, centerX: 0.4, width: typicalWidth)
        }
    }

}
