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
    
    var isActivated: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setState(_ newValue: Bool) {
        self.isActivated = newValue
    }
    
}
