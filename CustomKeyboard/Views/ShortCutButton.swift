//
//  ShortCutButton.swift
//  CustomKeyboard
//
//  Created by 엄철찬 on 2022/10/06.
//

import UIKit

class ShortCutButton : UIButton {
    var defaultBackgroundColor: UIColor = .darkGray
    var highlightBackgroundColor: UIColor = .lightGray
    var originalTitle : String?
    var shiftedTitle : String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel?.minimumScaleFactor = 0.1
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.tintColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = isHighlighted ? highlightBackgroundColor : defaultBackgroundColor
    }
}

