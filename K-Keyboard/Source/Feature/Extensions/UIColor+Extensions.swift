//
//  UIColor+Extensions.swift
//  K-Keyboard
//
//  Created by KangMingyo on 2022/10/07.
//

import UIKit.UIColor

extension UIColor {
    private static func color(light: UIColor, dark: UIColor? = nil) -> UIColor {
       if let dark = dark  {
           if #available(iOS 13.0, *) {
               return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
           }
           return light
       } else {
           return light
       }
    }

    static let systemColor: UIColor = {
        let color = UIColor.color(light: .black, dark: .white)
        return color
    }()
}
