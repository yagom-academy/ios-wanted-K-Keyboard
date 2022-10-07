//
//  UILabel+extension.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/07.
//

import UIKit

extension UILabel {
    
    //label text중 특정 문자만 속성을 변경하는 기능
    func asFontColor(targetString: String, font: UIFont?, color: UIColor?) {
        
        guard let fullText = text else { return }
        
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: targetString)
        
        attributedString.addAttributes([.font: font as Any, .foregroundColor: color as Any], range: range)
        attributedText = attributedString
    }
}


