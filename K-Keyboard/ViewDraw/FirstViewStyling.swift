//
//  FirstViewStyling.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation
import UIKit

protocol FirstViewStyling { }

extension FirstViewStyling {
    var cellTimeLabelStyling: (UILabel) -> () {
        {
            $0.textColor = .graySecondary
            $0.font = .appleSDGothicNeo(weight: .regular, size: 12)
            $0.textAlignment = .left
            $0.text = "2022/09/08 14:50:43"
        }
    }
    
    var cellMeasureTypelabelStyling: (UILabel) -> () {
        {
            $0.textColor = .grayPrimary
            $0.font = .appleSDGothicNeo(weight: .regular, size: 18)
            $0.textAlignment = .left
            $0.text = "GYRO"
        }
    }
    
    var cellAmountTypeLabelStyling: (UILabel) -> () {
        {
            $0.textColor = .grayPrimary
            $0.font = .appleSDGothicNeo(weight: .regular, size: 28)
            $0.textAlignment = .center
            $0.text = "60.0"
        }
    }
    
    var cellActivityIndicatorViewStyling: (UIActivityIndicatorView) -> () {
        {
            $0.style = .large
            $0.color = .grayPrimary
            $0.isHidden = false
        }
    }
    
    //TODO: 테스트 후 필요없을 시 삭제
    var testButtonStyling: (UIButton) -> () {
        {
            //TODO: 버전 관련 분기 더 나은 방법으로 처리 및 리팩토링
            if #available(iOS 15.0, *) {
                $0.configuration = .plain()
                $0.configuration?.contentInsets = .zero
                $0.configuration?.title = "테스트"
                $0.configuration?.background.backgroundColor = .grayPrimary
                $0.configuration?.baseForegroundColor = .white
            } else {
                $0.setTitle("테스트", for: .normal)
                $0.setTitleColor(.orange, for: .normal)
            }
            
        }
    }
}
