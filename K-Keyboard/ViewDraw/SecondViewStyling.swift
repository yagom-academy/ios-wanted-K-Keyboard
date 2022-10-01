//
//  SecondViewStyling.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation
import UIKit

protocol SecondViewStyling { }

extension SecondViewStyling {
    var saveButtonStyling: (UIBarButtonItem) -> () {
        {
            $0.title = "저장"
        }
    }
    
    var backButtonStyling: (UIBarButtonItem) -> () {
        {
            $0.image = UIImage(systemName: "chevron.left")
            $0.tintColor = .black
        }
    }
    
    var segmentControlStyling: (UISegmentedControl) -> () {
        {
            $0.backgroundColor = .grayFourth
            $0.insertSegment(withTitle: "Acc", at: 0, animated: true)
            $0.insertSegment(withTitle: "Gyro", at: 1, animated: true)
            $0.setEnabled(true, forSegmentAt: 0)
            $0.selectedSegmentTintColor = .white
        }
    }
    
    var controlStackViewStyling: (UIStackView) -> () {
        {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.spacing = 16
        }
    }
}
