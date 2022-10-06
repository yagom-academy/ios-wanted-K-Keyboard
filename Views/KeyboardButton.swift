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
        // 현재 상태 변경
        self.isActivated = newValue
        // 변경된 상태에따른 이미지 변겅
    }
  
}
