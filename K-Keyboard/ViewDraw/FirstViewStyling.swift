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
 
    var labelStyling : (UILabel,String) -> () {
        {
            $0.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Medium", size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.99
            $0.attributedText = NSMutableAttributedString(string: $1, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var titleLabelStyling : (UILabel,String) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = UIFont(name: "NotoSansCJKKR-Bold", size: 20)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.95
            $0.attributedText = NSMutableAttributedString(string: $1, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var keyboardImageStyling : (UIImageView) -> () {
        {
            let img = UIImage(named: "keyboardImage")
            $0.image = img
            $0.contentMode = .scaleAspectFit
            let layer0 = CALayer()
            layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0))
            layer0.bounds = $0.bounds
            layer0.position = $0.center
            $0.layer.addSublayer(layer0)
        }
    }
    
    var headerLabelStyling : (UILabel,String) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = UIFont(name: "NotoSansCJKKR-Bold", size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.16
            $0.attributedText = NSMutableAttributedString(string: $1, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var bodyLabelStyling  : (UILabel,String) -> () {
        {
            $0.textColor = UIColor(red: 0.294, green: 0.306, blue: 0.341, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 14)
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
            var paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.18
            $0.attributedText = NSMutableAttributedString(string: $1, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var tagCellViewStyle: (UIView) -> () {
        {
            $0.layer.backgroundColor = UIColor(red: 0.922, green: 0.929, blue: 0.961, alpha: 1).cgColor
            $0.layer.cornerRadius = 18
        }
    }
    
    var tagTitleStyle: (UILabel) -> () {
        {
            $0.backgroundColor = .white

            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.01

            // Line height: 24 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "태그", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var tagNameStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.294, green: 0.306, blue: 0.341, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Medium", size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.99

            // Line height: 20 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "이벤트", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var titleLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.01

            // Line height: 24 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var emojiLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 30)
            $0.textAlignment = .center
        }
    }
    
    var emojiParagraphStyle: (UILabel) -> () {
        {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.55
            $0.attributedText = NSMutableAttributedString(string: "0", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var descLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 12)
            $0.textAlignment = .center
        }
    }
    
    var descLabelParagraphStyle: (UILabel) -> () {
        {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.04
            $0.attributedText = NSMutableAttributedString(string: "맘에들어요", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var countLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
            $0.font = UIFont(name: "NotoSansKR-Regular", size: 10)
            $0.textAlignment = .center
        }
    }
    
    var countLabelParagraphStyle: (UILabel) -> () {
        {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.97
            $0.attributedText = NSMutableAttributedString(string: "0", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
}
