//
//  UIView+Extensions.swift
//  K-Keyboard
//
//  Created by KangMingyo on 2022/10/07.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
