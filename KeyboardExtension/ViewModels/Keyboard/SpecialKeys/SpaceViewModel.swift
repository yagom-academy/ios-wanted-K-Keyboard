//
//  SpaceBarViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/06.
//

import Foundation
import UIKit


class SpaceViewModel {
    // MARK: Input
    var didTap: (() -> ())?
    
    // MARK: Output
    var propagateDidTap: (() -> ())?
    
    // MARK: Properties
    
    // MARK: Life Cycle
    init() {
        bind()
    }
    
    
    // MARK: Binding
    func bind() {
        didTap = { [weak self] in
            guard let self else { return }
            self.propagateDidTap?()
        }
    }
}
