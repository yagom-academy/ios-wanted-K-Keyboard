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
    var receiveAssemblingText: ((String) -> ())?
    var receiveWord: ((String) -> ())?
    var receiveRemovePrefix: (() -> ())?
    var receiveAddSpace: (() -> ())?
    var receiveAddNewLine: (() -> ())?
    var textContentDidChange: ((String) -> ())?
    
    // MARK: Output
    var selectedSource: ((Int?) -> ())?
    var textSource: ((String) -> ())?
    var prefixTextChanged: (() -> ())?
    
    // MARK: Properties
    var selected: Int? {
        didSet {
            selectedSource?(selected)
        }
    }
    
    var prefixText: String = "" {
        didSet {
            prefixTextChanged?()
        }
    }
    
    var text: String = ""
    
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
        
        receiveAssemblingText = { [weak self] assemblingText in
            guard let self else { return }
            self.text = self.prefixText + assemblingText
            self.textSource?(self.text)
        }
        
        receiveWord = { [weak self] word in
            guard let self else { return }
            self.prefixText = self.text + word
            self.text = self.prefixText
            self.textSource?(self.text)
        }
        
        receiveRemovePrefix = { [weak self] in
            guard let self else { return }
            if !self.prefixText.isEmpty {
                self.prefixText.removeLast()
            }
            self.text = self.prefixText
            self.textSource?(self.text)
        }
        
        receiveAddSpace = { [weak self] in
            guard let self else { return }
            self.prefixText = self.text + " "
            self.text = self.prefixText
            self.textSource?(self.text)
        }
        
        receiveAddNewLine = { [weak self] in
            guard let self else { return }
            self.prefixText = self.text + "\n"
            self.text = self.prefixText
            self.textSource?(self.text)
        }
        
        textContentDidChange = { [weak self] prefixText in
            guard let self else { return }
            self.prefixText = prefixText
            self.text = self.prefixText
        }
    }
}
