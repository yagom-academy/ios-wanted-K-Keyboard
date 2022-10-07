//
//  UIStackView+Extensions.swift
//  K-Keyboard
//
//  Created by KangMingyo on 2022/10/07.
//

import UIKit.UIStackView

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
