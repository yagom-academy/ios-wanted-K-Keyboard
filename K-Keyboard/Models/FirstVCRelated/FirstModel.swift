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
    var testButtonViewModel: TestButtonViewModel {
        return privateTestButtonViewModel
    }
    
    //properties
    private var repository: RepositoryProtocol
    private var privateTestButtonViewModel : TestButtonViewModel
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
        self.privateTestButtonViewModel = TestButtonViewModel()
        bind()
    }
    
    private func bind() {
        privateTestButtonViewModel.propergateDidTouchButton = { [weak self] in
            guard let self = self else { return }
            
            let dependency = SecondModel()
            let context: SceneContext<SecondModel> = SceneContext(dependency: dependency)
            
            self.routeSubject?(.detail(.secondViewController(context: context)))
        }
    }
    
    func populateData() {
        
    }
}
