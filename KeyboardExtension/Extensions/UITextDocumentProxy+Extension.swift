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
        if self.selectedText != nil {
            self.deleteBackward()
        }
        if let word = self.documentContextBeforeInput {
            for _ in 0..<word.count {
                self.deleteBackward()
            }
        }
    }
    
    func removeLast(_ k: Int) {
        guard
            let context = self.documentContextBeforeInput,
            context.count > k
        else { return }
        if self.selectedText != nil {
            self.deleteBackward()
        }
        for _ in 0..<k {
            self.deleteBackward()
        }
    }
}
