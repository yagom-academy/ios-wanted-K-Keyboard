//
//  ToolBarButtonViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/05.
//

import Foundation
import UIKit


class ToolBarButtonViewModel {
    // MARK: Input
    var receiveSelected: ((Bool) -> ())?
    var didTap: (() -> ())?
    
    // MARK: Output
    var selectedSource: ((Bool) -> ())?
    var propagateTap: (() -> ())?
    
    // MARK: Properties
    var image: UIImage?
    var selected: Bool = false {
        didSet {
            selectedSource?(selected)
        }
    }
    
    // MARK: Life Cycle
    init(_ image: UIImage?) {
        self.image = image
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        didTap = { [weak self] in
            guard let self else { return }
            self.propagateTap?()
        }
        
        receiveSelected = { [weak self] selected in
            guard let self else { return }
            self.selected = selected
        }
    }
}
