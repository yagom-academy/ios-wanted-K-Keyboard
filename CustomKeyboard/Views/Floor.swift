//
//  Floor.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import UIKit

class Floor : UIView{
    
    weak var delegate: KeyboardViewDelegate?
            
    let backgroundViewForPadding : UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(backgroundViewForPadding)
        setBackgroundViewForPaddingConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews(backgroundViewForPadding)
        setBackgroundViewForPaddingConstraints()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackgroundViewForPaddingConstraints(){
        NSLayoutConstraint.activate([
            backgroundViewForPadding.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundViewForPadding.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundViewForPadding.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundViewForPadding.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Constants.multiplierForHeight),
        ])
    }
    
    @objc func insert(_ sender : UIButton){
        self.delegate?.insertCharacter(sender.currentTitle ?? "")
    }
    
    @objc func deleteBackwards(_ sender : UIButton){
        self.delegate?.deleteCharacterBeforeCursor()
    }

    @objc func insertSpace(_ sender : UIButton){
        self.delegate?.insertSpace()
    }
    
    @objc func insertNextLine(_ sender : UIButton){
        self.delegate?.insertNextLine()
    }
    
    @objc func shortCut(){
        self.delegate?.presentShortCutView()
    }
    
}
