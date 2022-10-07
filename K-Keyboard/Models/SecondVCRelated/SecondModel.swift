//
//  SecondModel.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation

class SecondModel {
    
    //input
    
    //output
    @MainThreadActor var routeSubject: ((SceneCategory) -> ())?
    
    var popupViewModel: PopupViewModel {
        return privatePopupViewModel
    }
    
    //properties
    private var privatePopupViewModel: PopupViewModel
    
    init() {
        self.privatePopupViewModel = PopupViewModel()
        
        bind()
    }
    
    private func bind() {
        
        privatePopupViewModel.propergateTapGesture = {
            
        }
        
        privatePopupViewModel.propergateButtonTap = {
            
        }
    }
    
}
