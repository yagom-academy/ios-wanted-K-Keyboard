//
//  PopupViewModel.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/07.
//

import Foundation

class PopupViewModel {
    
    //input
    var didReceiveTapGesture = { }
    var didReceiveButtonTap = { }
    
    //output
    var propergateTapGesture = { }
    var propergateButtonTap = { }
    
    //properties
    
    init() {
        
    }
    
    private func bind() {
        didReceiveTapGesture = { [weak self] in
            guard let self = self else { return }
            self.propergateTapGesture()
        }
        
        didReceiveButtonTap = { [weak self] in
            guard let self = self else { return }
            self.propergateButtonTap()
        }
    }
    
}
