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
    
    var contentViewModel: ContentViewModel {
        return privateContentViewModel
    }
    
    //properties
    private var privateContentViewModel: ContentViewModel
    
    init() {
        self.privateContentViewModel = ContentViewModel()
        
        bind()
    }
    
    private func bind() {
        
        privateContentViewModel.propergateTapGesture = { [weak self] in
            guard let self = self else { return }
            
            self.routeSubject?(.close)
        }
        
        privateContentViewModel.propergateButtonTap = {
            print("propergate button tap")
            let context = SceneContext(dependency: FirstSceneAction.didUserPurchaseGem)
            
            self.routeSubject?(.closeWithAction(.main(.firstViewControllerWithAction(context: context))))
        }
    }
    
}
