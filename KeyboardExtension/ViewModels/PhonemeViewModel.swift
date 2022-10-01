//
//  PhonemeViewModel.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation
import UIKit


class PhonemeViewModel {
    // MARK: Input
    
    // MARK: Output
    var phonemeSource: ((Phoneme) -> ())?
    
    // MARK: Properties
    var phoneme: Phoneme {
        didSet {
            phonemeSource?(phoneme)
        }
    }
    
    // MARK: Life Cycle
    init(_ phoneme: Phoneme) {
        self.phoneme = phoneme
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        
    }
}
