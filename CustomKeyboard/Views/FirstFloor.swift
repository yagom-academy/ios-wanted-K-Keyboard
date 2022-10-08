//
//  FirstFloor.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

protocol ProtocolForBtnGoto {
    var btnArr : [ShortCutButton] {get}
    var targetView : UIView {get}
}

class FirstFloor : Floor {
    
    var info : ProtocolForBtnGoto?
    
    var isMoved : Bool = false
    
    var titleTemp : String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundViewForPadding.addSubviews(btnNumber,btnGoto,btnSpace,btnEnter)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundViewForPadding.addSubviews(btnNumber,btnGoto,btnSpace,btnEnter)
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
    lazy var btnGoto : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("단축키", for: .normal)
        btn.addTarget(self, action: #selector(insert), for: .touchUpInside)
        press.addTarget(self, action: #selector(self.pressed(_:)))
        btn.addGestureRecognizer(press)
        btn.titleLabel?.minimumScaleFactor = 0.1
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        return btn
    }()
    lazy var btnSpace : KeyboardButton = {
        let btn = KeyboardButton()
        btn.setTitle("스페이스", for: .normal)
        btn.addTarget(self, action: #selector(insertSpace), for: .touchUpInside)
        return btn
    }()
    lazy var btnEnter : KeyboardButton = {
        let btn = KeyboardButton()
        let img = UIImage(systemName: "arrow.turn.down.left")
        btn.setImage(img, for: .normal)
        btn.tintColor = .white
        btn.addTarget(self, action: #selector(insertNextLine), for: .touchUpInside)
        return btn
    }()
  
    func setConstraints(){
        setConstraint(btnNumber, to: self.backgroundViewForPadding, centerX: 0.15, width: numberEnterWidth)
        setConstraint(btnGoto, to: self.backgroundViewForPadding, centerX: 0.4, width: typicalWidth)
        setConstraint(btnSpace, to: self.backgroundViewForPadding, centerX: 1.1, width: spaceWidth + 0.1)
        setConstraint(btnEnter, to: self.backgroundViewForPadding, centerX: 1.85, width: numberEnterWidth)
    }
    //지구본버튼 추가여부를 결정하는 메소드
    func setNextKeyboardVisible(_ visible: Bool) {
        if visible{
            removeConstraints(btnNumber.constraints)
            addSubviews(btnNext)
            setConstraint(btnGoto, to: self.backgroundViewForPadding, centerX: 0.6, width: typicalWidth)
            setConstraint(btnSpace, to: self.backgroundViewForPadding, centerX: 1.2, width: spaceWidth)
            setConstraint(btnNext, to: self.backgroundViewForPadding, centerX: 0.4, width: typicalWidth)
        }
    }
        
    let press = UILongPressGestureRecognizer()
    
    @objc func pressed(_ gesture:UILongPressGestureRecognizer){
        gesture.minimumPressDuration = 0.5
        switch gesture.state{
        case .began :
            delegate?.presentShortCutView()
            isMoved = true
        case .changed :
            isMoved = true
            var f = CGRect()
            let location = gesture.location(in: info?.targetView)
            info?.btnArr.forEach{
                f = $0.frame
                if $0.restorationIdentifier == "second"{
                    f.origin.y = f.size.height
                }
                if f.contains(location){
                    $0.isHighlighted = true
                    titleTemp = $0.currentTitle
                    isMoved = false
    
                }else{
                    $0.isHighlighted = false
                }
            }
        case .ended :
            if !isMoved{
                if let title = titleTemp{
                    btnGoto.setTitle(title, for: .normal)
                }
                info?.btnArr.forEach{$0.isHighlighted = false}
                delegate?.dismissShortCutView()
            }
            isMoved = false
        default : break
        }
    }

}


