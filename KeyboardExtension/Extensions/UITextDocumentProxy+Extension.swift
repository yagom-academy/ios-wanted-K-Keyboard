//
//  UITextDocumentProxy+Extension.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/03.
//

import Foundation
import UIKit

extension UITextDocumentProxy {
    func clearAll() {
        if let word = self.documentContextBeforeInput {
            for _ in 0..<word.count {
                self.deleteBackward()
            }
        }
    }
}
