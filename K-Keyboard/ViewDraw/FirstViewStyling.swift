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
    var backButtonStyling: (UIBarButtonItem) -> () {
        {
            $0.image = UIImage(systemName: "chevron.left")
            $0.tintColor = .black
        }
    }
    
    var saveButtonStyling: (UIBarButtonItem) -> () {
        {
            $0.title = "저장"
        }
    }
}

extension FirstViewStyling {

    var labelStyling : (UILabel,String) -> () {
        {
            $0.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
            $0.font = .notoSans(weight: .kr_Medium, size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.99
            $0.attributedText = NSMutableAttributedString(string: $1, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var titleLabelStyling : (UILabel,String) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 20)
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
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.16
            $0.attributedText = NSMutableAttributedString(string: $1, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var bodyLabelStyling  : (UILabel,String) -> () {
        {
            $0.textColor = UIColor(red: 0.294, green: 0.306, blue: 0.341, alpha: 1)
            $0.font = .notoSans(weight: .kr_Regular, size: 14)
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.18
            $0.attributedText = NSMutableAttributedString(string: $1, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
}

extension FirstViewStyling {
    var tagCellViewStyle: (UIView) -> () {
        {
            $0.layer.backgroundColor = UIColor(red: 0.922, green: 0.929, blue: 0.961, alpha: 1).cgColor
            $0.layer.cornerRadius = 14
        }
    }
    
    var tagTitleStyle: (UILabel) -> () {
        {
            $0.backgroundColor = .white

            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 16)
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
            $0.font = .notoSans(weight: .kr_Medium, size: 14)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 0.99

            // Line height: 20 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "이벤트", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
}

extension FirstViewStyling {
    
    var keywordTitleLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 16)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.01

            // Line height: 24 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "이런 키워드에 반응해요", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var keywordCellViewStyle: (UIView) -> () {
        {
            $0.backgroundColor = .white
            $0.layer.shadowColor = UIColor(red: 0.271, green: 0.357, blue: 0.388, alpha: 0.2).cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowOffset = CGSize(width: 0, height: 1)
            $0.layer.shadowRadius = 8

            $0.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        }
    }
    
    var keywordDescLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .kr_Medium, size: 14)
            
            // Line height: 20 pt

            $0.textAlignment = .center
        }
    }
}

extension FirstViewStyling {
    
    var themeTitleLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 16)
            
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
            $0.font = .notoSans(weight: .kr_Regular, size: 30)
            
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
            $0.font = .notoSans(weight: .kr_Regular, size: 12)
            
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
            $0.font = .notoSans(weight: .kr_Regular, size: 10)
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

// TODO: Notosans Font install and set
extension FirstViewStyling {
    var profileImageViewStyle: (UIImageView) -> () {
        {
            $0.image = UIImage(named: "img_profile dummy 3")
        }
    }
    
    var creatorLabelStyle: (UILabel) -> () {
        {
            $0.layer.backgroundColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1).cgColor
            $0.layer.cornerRadius = 10
            
            $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            $0.textAlignment = .center
            $0.font = .notoSans(weight: .kr_Medium, size: 10)

            // Line height: 14 pt
            // (identical to box height)

            $0.text = "크리에이터"
        }
    }
    
    var nickNameLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .kr_Medium, size: 12)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.04

            // Line height: 18 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "크리에이터명", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var commentLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.314, green: 0.325, blue: 0.361, alpha: 1)
            $0.font = .notoSans(weight: .kr_Regular, size: 14)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.18

            // Line height: 24 pt
            // (identical to box height)
            $0.numberOfLines = 0
            $0.attributedText = NSMutableAttributedString(string: "구매해주셔서 감사합니다💖", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var timeLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
            $0.font = .notoSans(weight: .kr_Regular, size: 12)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.04

            // Line height: 18 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "1일", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var reportButtonStyle: (UIButton) -> () {
        {
            let color = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
            let font: UIFont = .notoSans(weight: .cjkkr_Bold, size: 12)
            let attrString = NSAttributedString(string: "신고", attributes: [.foregroundColor: color, .font : font])
            
            $0.setAttributedTitle(attrString, for: .normal)
        }
    }
    
    var bubbleViewStyle: (UIView) -> () {
        {
            $0.layer.backgroundColor = UIColor(red: 0.949, green: 0.953, blue: 0.969, alpha: 1).cgColor
            $0.layer.cornerRadius = 20
        }
    }
}

extension FirstViewStyling {
    
    var reviewTitleLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 16)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.01

            // Line height: 24 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "구매 리뷰", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var reviewCountLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 16)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.01

            // Line height: 24 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "10", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var annotationImageViewStyle: (UIImageView) -> () {
        {
            $0.image = UIImage(named: "annotation")
        }
    }
    
    var chevronImageViewStyle: (UIImageView) -> () {
        {
            $0.image = UIImage(named: "chevron")
        }
    }
    
    var themeInfoLabelStyle: (UILabel) -> () {
        {
            $0.textColor = UIColor(red: 0.314, green: 0.325, blue: 0.361, alpha: 1)
            $0.font = .notoSans(weight: .kr_Regular, size: 14)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.18

            // Line height: 24 pt
            // (identical to box height)

            $0.attributedText = NSMutableAttributedString(string: "테마를 구매해야 리뷰를 남길 수 있어요.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
}

extension FirstViewStyling {
    var sendCommentButtonStyle: (UIButton) -> () {
        {
            $0.layer.backgroundColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1).cgColor
            $0.layer.cornerRadius = 20
            
            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineHeightMultiple = 1.16
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            let font: UIFont = .notoSans(weight: .cjkkr_Bold, size: 14)
            let attrString = NSAttributedString(string: "전송",
                                                attributes: [.foregroundColor: color,
                                                                             .font : font,
                                                                             .paragraphStyle : paragraphStyle])
            
            $0.setAttributedTitle(attrString, for: .normal)
            
        }
    }
    
    var commentTextFieldStyle: (UITextField) -> () {
        {
            $0.placeholder = "type a comment"
            $0.borderStyle = .roundedRect
            $0.layer.cornerRadius = 10.0
        }
    }
}

extension FirstViewStyling {
    
    // TODO: 디자인 반영하여 수정
    //근데 암만 봐도 피그마 디자인은 피그마 자동완성코드로 그냥 만든거 같은데...
    //UIButton이 확실해 보이는게 UILabel인것도 그렇고...
    var gemIconStyle: (UIImageView) -> () {
        {
            let image0 = UIImage(named: "ic_charge_gem_type1")
            $0.image = image0
        }
    }
    
    var gemStatusLabelStyle: (UILabel) -> () {
        {
            $0.backgroundColor = .white

            $0.textColor = UIColor(red: 0.667, green: 0.671, blue: 0.702, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Medium, size: 12)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.01

            $0.attributedText = NSMutableAttributedString(string: "0젬 보유 중", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var gemCountLabelStyle: (UILabel) -> () {
        {
            $0.backgroundColor = .white

            $0.textColor = UIColor(red: 0.49, green: 0.788, blue: 0.988, alpha: 1)
            $0.font = .notoSans(weight: .cjkkr_Bold, size: 16)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = 1.01

            $0.attributedText = NSMutableAttributedString(string: "5", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        }
    }
    
    var purchaseButtonStyle: (UIButton) -> () {
        {
            $0.layer.backgroundColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1).cgColor
            $0.layer.cornerRadius = 20
            
            let paragraphStyle = NSMutableParagraphStyle()
//            paragraphStyle.lineHeightMultiple = 1.16
            let color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            let font: UIFont = .notoSans(weight: .cjkkr_Bold, size: 14)
            let attrString = NSAttributedString(string: "구매하기",
                                                attributes: [.foregroundColor: color,
                                                                             .font : font,
                                                                             .paragraphStyle : paragraphStyle])
            
            $0.setAttributedTitle(attrString, for: .normal)
            
        }
    }
}
