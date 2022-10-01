//
//  TestButtonViewModel.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation

class TestButtonViewModel {
    
    //input
    
    var didReceiveDidTouchButton = { }
    
    //output
    var propergateDidTouchButton = { }
    
    //properties
    
    init() {
        
    }
    
    private func bind() {
        didReceiveDidTouchButton = { [weak self] in
            guard let self = self else { return }
            self.propergateDidTouchButton()
        }
    }
}
