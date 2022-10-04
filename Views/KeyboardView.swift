//
//  MorseKeyboardView.swift
//  K-Keyboard
//
//  Created by 1 on 2022/09/29.
//

import UIKit

class KeyboardView: UIView {
    
    
    lazy var button: KeyboardButton = {
        let btn = KeyboardButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        return btn
    }()
    
    func getTitle() -> String {
        return self.button.titleLabel?.text ?? ""
    }
    /*setNextKeyboardVisible(_:).이것은 다음 키보드 키를 숨기거나 표시하기 위해 특정 제약 조건을 활성화 및 비활성화하는 사용자 정의 방법입니다. 키를 숨겨야 하는 상황이 있기 때문에 존재합니다.
     */
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

