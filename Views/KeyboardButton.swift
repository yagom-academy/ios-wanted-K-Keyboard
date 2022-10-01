//
//  KeyboardButton.swift
//  K-Keyboard
//
//  Created by 1 on 2022/09/30.
//

import UIKit

class KeyboardButton: UIButton {
    private var optionText:String = ""
    func setOptionText(_ text:String?) {
        self.optionText = text ?? ""
    }
    func getOptionText() -> String {
        return self.optionText
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
}
