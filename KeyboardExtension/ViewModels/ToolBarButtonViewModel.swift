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
    
    // MARK: Output
    
    // MARK: Properties
    var image: UIImage?
    
    // MARK: Life Cycle
    init(_ image: UIImage?) {
        self.image = image
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        
    }
}
