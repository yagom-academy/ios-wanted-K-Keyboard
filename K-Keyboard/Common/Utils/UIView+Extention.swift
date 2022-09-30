//
//  UIView+Extention.swift
//  K-Keyboard
//
//  Created by 박호현 on 2022/10/04.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
