//
//  UIView+Extension.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/10/07.
//

import UIKit.UIView

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
