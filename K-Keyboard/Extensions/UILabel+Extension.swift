//
//  UILabel+Extension.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/04.
//

import Foundation
import UIKit

extension UILabel {
    func color(targetString: String) {
        let color = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        self.attributedText = attributedString
    }
}
