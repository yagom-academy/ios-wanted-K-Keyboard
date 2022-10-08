//
//  UIStackView+Extenstion.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/04.
//

import UIKit

extension UIStackView {
    func addArrangeSubViews(_ views: UIView...) {
        views.forEach{ self.addArrangedSubview($0) }
    }
}
