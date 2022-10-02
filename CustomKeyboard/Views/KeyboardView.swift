//
//  KeyboardView.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit
//
//protocol KeyboardDelegate{
//    func keyboardEvent()
//}
//
//
//class KeyboardLayout : UIView {
//
//    private var delegate : KeyboardDelegate?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.commonInit()
//    }
//
//    private func commonInit(){
//        let bundle = Bundle.init(for: self.classForCoder)
//        let view = bundle.loadNibNamed("KeyboardLayout",
//                                       owner: self,
//                                       options: nil)?.first as! UIView
//        self.addSubview(view)
//    }
//
//    @IBAction func tapBtn(_ sender:Any){
//        self.delegate?.keyboardEvent()
//    }
//
//
//}


class KeyboardView : UIView {

    let firstFloor : FirstFloor = {
        let view = FirstFloor()
        return view
    }()
    let secondFloor : SecondFloor = {
        let view = SecondFloor()
        return view
    }()
    let thridFloor : ThirdFloor = {
        let view = ThirdFloor()
        return view
    }()
    let forthFloor : ForthFloor = {
        let view = ForthFloor()
        return view
    }()
    lazy var shiftAvailable = [forthFloor.btn1, forthFloor.btn2, forthFloor.btn3, forthFloor.btn4, forthFloor.btn5, forthFloor.btn9, forthFloor.btn10]
    var isShifted : Bool = false{
        didSet{
            if isShifted{
                shifted()
            }else if oldValue{
                print("called")
                unShifted()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(firstFloor,secondFloor,thridFloor,forthFloor)
        setConstraints()
        addTargetRelatedToShift()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews(firstFloor,secondFloor,thridFloor,forthFloor)
        setConstraints()
        addTargetRelatedToShift()
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            firstFloor.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            firstFloor.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            firstFloor.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            firstFloor.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            firstFloor.topAnchor.constraint(equalTo: secondFloor.bottomAnchor),
            secondFloor.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            secondFloor.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            secondFloor.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            secondFloor.topAnchor.constraint(equalTo: thridFloor.bottomAnchor),
            thridFloor.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            thridFloor.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            thridFloor.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            thridFloor.topAnchor.constraint(equalTo: forthFloor.bottomAnchor),
            forthFloor.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.25),
            forthFloor.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            forthFloor.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    func addTargetRelatedToShift(){
        secondFloor.btnShift.addTarget(self, action: #selector(shift), for: .touchUpInside)
        shiftAvailable.forEach{$0.addTarget(self, action: #selector(insertForShiftAvaialbe), for: .touchUpInside)}
    }
}


extension KeyboardView{
    
    @objc func shift(_ sender : KeyboardButton){
        isShifted.toggle()
    }
    
    @objc func insertForShiftAvaialbe(_ sender: KeyboardButton) {
        self.forthFloor.delegate?.insertCharacter(sender.currentTitle ?? "")
        self.isShifted = false
    }

    func shifted(){
        let target = secondFloor.btnShift
        let img = UIImage(systemName: "shift.fill")
        target.setImage(img, for: .normal)
        target.tintColor = .black
        target.defaultBackgroundColor = .white
        shiftAvailable.forEach{$0.setTitle($0.shiftedTitle, for: .normal)}
    }
    
    func unShifted(){
        let target = secondFloor.btnShift
        let img = UIImage(systemName: "shift")
        target.setImage(img, for: .normal)
        target.tintColor = .white
        target.defaultBackgroundColor = .gray
        shiftAvailable.forEach{$0.setTitle($0.originalTitle, for: .normal)}
    }
}
