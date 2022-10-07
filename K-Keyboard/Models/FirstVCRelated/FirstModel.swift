//
//  FirstModel.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation

class FirstModel {
    
    //input
    var didReceiveSceneAction: (SceneAction) -> () = { action in }
    
    //output
    @MainThreadActor var routeSubject: ((SceneCategory) -> ())?
    
    var purchaseButtonViewModel: PurchaseButtonViewModel {
        return privatePurchaseButtonViewModel
    }
    
    
    //properties
    private var repository: RepositoryProtocol
    private var privatePurchaseButtonViewModel: PurchaseButtonViewModel
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        self.privatePurchaseButtonViewModel = PurchaseButtonViewModel()
        bind()
    }
    
    private func bind() {
        privatePurchaseButtonViewModel.propergateDidTouchButton = { [weak self] in
            guard let self = self else { return }
            
            let dependency = SecondModel()
            let context: SceneContext<SecondModel> = SceneContext(dependency: dependency)
            
            self.routeSubject?(.detail(.secondViewController(context: context)))
        }
    }
    
    func populateData() {
        
    }
}
