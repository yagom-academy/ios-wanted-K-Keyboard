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
    
    
    var didUserPurchasedGem: Bool = false {
        didSet {
            propergateGemPurchasedEvent(didUserPurchasedGem)
        }
    }
    
    var propergateGemPurchasedEvent: (Bool) -> () = { bool in }
    
    var purchaseButtonViewModel: PurchaseButtonViewModel {
        return privatePurchaseButtonViewModel
    }
    
    var commentInputViewModel: CommentInputViewModel {
        return privateCommentInputViewModel
    }
    
    var purchaseReviewListViewModel: PurchaseReviewListViewModel {
        return privatePurchaseReviewListViewModel
    }
    
    
    //properties
    private var repository: RepositoryProtocol
    private var privatePurchaseButtonViewModel: PurchaseButtonViewModel
    private var privateCommentInputViewModel: CommentInputViewModel
    private var privatePurchaseReviewListViewModel: PurchaseReviewListViewModel
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        self.privatePurchaseButtonViewModel = PurchaseButtonViewModel()
        self.privateCommentInputViewModel = CommentInputViewModel()
        self.privatePurchaseReviewListViewModel = PurchaseReviewListViewModel()
        bind()
    }
    
    private func bind() {
        privatePurchaseButtonViewModel.propergateDidTouchButton = { [weak self] in
            guard let self = self else { return }
            
            let dependency = SecondModel()
            let context: SceneContext<SecondModel> = SceneContext(dependency: dependency)
            
            self.routeSubject?(.detail(.secondViewController(context: context)))
        }
        
        didReceiveSceneAction = { [weak self] action in
            guard let action = action as? FirstSceneAction else { return }
            guard let self = self else { return }
            
            switch action {
            case .didUserPurchaseGem:
                self.didUserPurchasedGem = true
            case .refresh:
                break
            }
        }
        
        privateCommentInputViewModel.propergateEmptyTextInputReceived = { [weak self] in
            guard let self = self else { return }
            let okAction = AlertActionDependency(title: "확인")
            let alertDependancy = AlertDependency(title: nil, message: "내용을 입력해야 합니다.", preferredStyle: .alert, actionSet: [okAction])
            
            self.routeSubject?(.alert(alertDependancy))
        }
        
        privateCommentInputViewModel.propergateTextInput = { [weak self] string in
            guard let self = self else { return }
        }
    }
    
    func populateData() {
        didUserPurchasedGem = false
    }
}
