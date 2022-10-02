//
//  UIView+Extension.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/02.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views:UIView...){
        views.forEach{
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setConstraint(_ btn : UIButton, to view:UIView, centerX multiplier : Double, width : Double){
        NSLayoutConstraint.activate([
            btn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: width),
            btn.heightAnchor.constraint(equalTo: view.heightAnchor),
            btn.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn.centerXAnchor.constraint(equalTo: view.centerXAnchor).constraintWithMultiplier(multiplier),
        ])
    }
    
    var typicalWidth : Double {
        return Constants.multiplierForTypicalButtonWidth
    }
    var spaceWidth : Double {
        return Constants.multiplierForSpaceButtonWidth
    }
    var numberEnterWidth : Double {
        return Constants.multiplierForNumberEnterButtonWidth
    }
    var shiftDeleteWidth : Double {
        return Constants.multiplierForShiftDeleteButtonWidth
    }

}
