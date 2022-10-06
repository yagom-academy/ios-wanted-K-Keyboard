//
//  ShortCutView.swift
//  CustomKeyboard
//
//  Created by 엄철찬 on 2022/10/05.
//

import UIKit

protocol DelieverTitleProtocol {
    func changeTitle(_ :String)
}

class ShortCutView : UIView {
    
    var delegate : DelieverTitleProtocol?
    
    let tap = UITapGestureRecognizer()
    
    @objc func tapGesture(_ gesture:UITapGestureRecognizer){
        self.removeFromSuperview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(stackV)
        stackV.addSubviews(stackH1,stackH2)
        setConstraints()
        configuration()
        tap.addTarget(self, action: #selector(tapGesture))
        self.addGestureRecognizer(tap)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            stackV.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.6),
            stackV.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.4),
            stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).constraintWithMultiplier(1.1),
            stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).constraintWithMultiplier(1.2)
        ])
    }
    
    func configuration(){
        
        let img = UIImage(systemName: "mic.fill")
        btn1.setImage(img, for: .normal)

        btn2.setTitle("ㅋㅋㅋㅋ", for: .normal)
        btn2.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        
        
        btn3.setTitle("ㅠㅠㅠㅠ", for: .normal)
        btn3.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        
        btn4.setTitle("안녕하세요", for: .normal)
        btn4.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        
        btn5.setTitle("감사합니다", for: .normal)
        btn5.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        
        btn6.setTitle("한자", for: .normal)
        btn6.titleLabel?.font = .boldSystemFont(ofSize: 12)


        let img7 = UIImage(systemName: "gearshape.fill")
        btn7.setImage(img7, for: .normal)
        
        btn8.setTitle("?", for: .normal)
        btn8.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        
        btn9.setTitle("❤️", for: .normal)
        btn9.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)
        
        btn10.setTitle("😂", for: .normal)
        btn10.addTarget(self, action: #selector(changeTitle), for: .touchUpInside)

        btn6.restorationIdentifier = "second"
        btn7.restorationIdentifier = "second"
        btn8.restorationIdentifier = "second"
        btn9.restorationIdentifier = "second"
        btn10.restorationIdentifier = "second"
    }

    
    lazy var stackV : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [stackH1,stackH2])
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()
    lazy var stackH1 : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [btn1,btn2,btn3,btn4,btn5])
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    lazy var stackH2 : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [btn6,btn7,btn8,btn9,btn10])
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    let btn1 = ShortCutButton()
    let btn2 = ShortCutButton()
    let btn3 = ShortCutButton()
    let btn4 = ShortCutButton()
    let btn5 = ShortCutButton()
    let btn6 = ShortCutButton()
    let btn7 = ShortCutButton()
    let btn8 = ShortCutButton()
    let btn9 = ShortCutButton()
    let btn10 = ShortCutButton()
    
    @objc func changeTitle(_ sender:ShortCutButton){
        delegate?.changeTitle(sender.currentTitle!)
    }
}

