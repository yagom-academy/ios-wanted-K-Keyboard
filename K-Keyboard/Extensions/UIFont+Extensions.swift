//
//  UIFont+Extensions.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import UIKit

extension UIFont {
    enum AppleSDGothicNeo: String {
        case thin = "AppleSDGothicNeo-Thin"
        case light = "AppleSDGothicNeo-Light"
        case regular = "AppleSDGothicNeo-Regular"
        case medium = "AppleSDGothicNeo-Medium"
        case semiBold = "AppleSDGothicNeo-SemiBold"
        case bold = "AppleSDGothicNeo-Bold"
    }
    
    enum NotoSans: String {
        case kr_Medium = "NotoSansKR-Medium"
        case kr_Regular = "NotoSansKR-Regular"
        case cjkkr_Bold = "NotoSansCJKKR-Bold"
        case cjkkr_Medium = "NotoSansCJKKR-Medium"
    }
    
    static func notoSans(weight: NotoSans, size: CGFloat) -> UIFont! {
        return UIFont(name: weight.rawValue, size: size)
    }
    
    static func appleSDGothicNeo(weight: AppleSDGothicNeo, size: CGFloat) -> UIFont! {
        return UIFont(name: weight.rawValue, size: size)
    }
}
