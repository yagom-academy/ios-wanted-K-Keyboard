//
//  NSObject+Extension.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/06.
//

import Foundation

extension NSObject {
    static var className: String! {
        return String(describing: self).components(separatedBy: ".").last
    }
}
