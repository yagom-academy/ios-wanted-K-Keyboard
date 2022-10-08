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
    
    var popupViewStyle: (UIView) -> () {
        {
            $0.backgroundColor = .white
            $0.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            $0.layer.cornerRadius = 24
            $0.clipsToBounds = false
        }
    }
    
    var purchaseButtonStyle: (UIButton) -> () {
        {
            $0.layer.backgroundColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1).cgColor
            $0.layer.cornerRadius = 24
            
            let paragraphStyle = NSMutableParagraphStyle()
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            let font: UIFont = .notoSans(weight: .cjkkr_Bold, size: 14)
            let attrString = NSAttributedString(string: "충전하고 바로 사용하기",
                                                attributes: [.foregroundColor: color,
                                                                             .font : font,
                                                                             .paragraphStyle : paragraphStyle])
            $0.setAttributedTitle(attrString, for: .normal)
        }
    }
    
    var imageViewStyle: (UIImageView) -> () {
        {
            $0.image = UIImage(named: "Image")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    var gemImageViewStyle: (UIImageView) -> () {
        {
            $0.image = UIImage(named: "Gem")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    var leftButtonImageViewStyle: (UIImageView) -> () {
        {
            $0.image = UIImage(named: "Left")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    var rightButtonImageViewStyle: (UIImageView) -> () {
        {
            $0.image = UIImage(named: "Right")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    var messageLabelStyle: (UILabel) -> () {
        {
            $0.text = "N젬이 부족해요\n빠르게 충전해 보세요!"
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 16)
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.01
            $0.textAlignment = .center
            let color = UIColor(red: 0.49, green: 0.788, blue: 0.988, alpha: 1)
            let fullText = $0.text ?? ""
            let range = (fullText as NSString).range(of: "N젬")
            let attributedString = NSMutableAttributedString(string: fullText)
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
            $0.attributedText = attributedString
        }
    }
    
    var gemCountInfoLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.16
            $0.textAlignment = .center
            $0.attributedText = NSMutableAttributedString(string: "젬 수량", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var purchaseAmountInfoLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.16
            $0.textAlignment = .center
            $0.attributedText = NSMutableAttributedString(string: "결제 금액", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var currencyLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)
            $0.font = .notoSans(weight: .kr_Medium, size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.99
            $0.textAlignment = .center
            $0.attributedText = NSMutableAttributedString(string: "₩ 1,100", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    
}
