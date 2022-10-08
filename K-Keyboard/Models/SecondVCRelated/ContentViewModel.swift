//
//  ContentViewModel.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/07.
//

import Foundation

class ContentViewModel {
    //input
    var didReceiveTapGesture = { }
    
    //output
    var popupViewModel: PopupViewModel {
        return privatePopupViewModel
    }
    
    var propergateTapGesture = { }
    var propergateButtonTap = { }
    
    //properties
    private var privatePopupViewModel: PopupViewModel
    
    init() {
        self.privatePopupViewModel = PopupViewModel()
        bind()
    }
    
    private func bind() {
        didReceiveTapGesture = { [weak self] in
            guard let self = self else { return }
            self.propergateTapGesture()
        }

        privatePopupViewModel.propergateButtonTap = { [weak self] in
            guard let self = self else { return }
            self.propergateButtonTap()
        }
    }
}

