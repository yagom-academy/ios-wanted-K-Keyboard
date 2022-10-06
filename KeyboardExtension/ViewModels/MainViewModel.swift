//
//  MainViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/05.
//

import Foundation
import UIKit


class MainViewModel {
    // MARK: Input
    var receiveSelected: ((Int?) -> ())?
    var receiveText: ((String) -> ())?
    
    // MARK: Output
    var selectedSource: ((Int?) -> ())?
    var textSource: ((String) -> ())?
    
    // MARK: Properties
    var selected: Int? {
        didSet {
            selectedSource?(selected)
        }
    }
    
    var text: String = "" {
        didSet {
            textSource?(text)
        }
    }
    
    // MARK: Life Cycle
    init() {
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        receiveSelected = { [weak self] selected in
            guard let self else { return }
            self.selected = selected
        }
        
        receiveText = { [weak self] text in
            guard let self else { return }
            self.text = text
        }
    }
}
