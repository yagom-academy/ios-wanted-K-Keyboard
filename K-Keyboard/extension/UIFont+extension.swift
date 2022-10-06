//
//  UIFont+extension.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/07.
//

import UIKit

enum fontWeight: String {
    case Bold
    case Regular
    case Medium
}

extension UIFont {
    
    static func NotoSanKR(weight: fontWeight, size: CGFloat) -> UIFont {
        
        print("NotoSansKR-\(weight.rawValue)")
        return UIFont(name: "NotoSansKR-\(weight.rawValue)", size: size) ?? UIFont()
    }
}
