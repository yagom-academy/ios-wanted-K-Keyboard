//
//  PurchaseButtonViewModel.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/07.
//

import Foundation

class PurchaseButtonViewModel {
    //input
        
    var didReceiveDidTouchButton = { }
    
    //output
    var propergateDidTouchButton = { }
    
    //properties
    
    init() {
        bind()
    }
    
    private func bind() {
        didReceiveDidTouchButton = { [weak self] in
            guard let self = self else { return }
            self.propergateDidTouchButton()
        }
    }
}
