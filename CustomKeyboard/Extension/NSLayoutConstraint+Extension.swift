//
//  NSLayoutConstraint+Extension.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import Foundation
import UIKit

extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier:CGFloat) -> NSLayoutConstraint{
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}

