//
//  ShiftViewModel.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/04.
//

import Foundation
import UIKit


class ShiftViewModel {
    // MARK: Input
    var didTap: (() -> ())?
    var receiveActivated: ((Bool) -> ())?
    
    // MARK: Output
    var activatedSource: ((Bool) -> ())?
    var propagateDidTap: (() -> ())?
    
    
    // MARK: Properties
    var activated: Bool = false {
        didSet {
            activatedSource?(activated)
        }
    }
    
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
        
        receiveActivated = { [weak self] activated in
            guard let self else { return }
            self.activated = activated
        }
    }
}
