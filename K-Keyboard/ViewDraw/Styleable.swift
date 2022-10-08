//
//  Styleable.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation
import UIKit

protocol BasicNavigationBarStyling { }

extension BasicNavigationBarStyling {
    var navigationBarStyle: (UINavigationBar) -> () {
        {
            $0.shadowImage = UIImage() //default: nil
            $0.isTranslucent = true
            $0.titleTextAttributes = [.foregroundColor : UIColor.black]
        }
    }
}

protocol Styleable { }

extension UIView: Styleable { }
extension UIBarButtonItem: Styleable { }
extension UINavigationItem: Styleable { }

extension Styleable {
    @discardableResult
    func addStyles(style: (Self) -> ()) -> Self {
        style(self)
        return self
    }
    
    @discardableResult  //반환된 결과 안쓴다
    func addLableStyle(style: (Self,String) -> (), txt:String) -> Self {
        style(self, txt)
        return self
    }
}
