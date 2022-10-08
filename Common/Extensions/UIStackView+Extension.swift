//
//  UIStackView+Extension.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/04.
//

import Foundation
import UIKit

extension UIStackView {
    func setCustomSpacing(_ spacing: CGFloat, before arrangedSubview: UIView) {
        for (index, view) in self.arrangedSubviews.enumerated() {
            if view == arrangedSubview {
                let previousView = self.arrangedSubviews[index-1]
                self.setCustomSpacing(spacing, after: previousView)
                break
            }
        }
    }
}
