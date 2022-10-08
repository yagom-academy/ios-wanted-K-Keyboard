//
//  FirstViewControllerRoutable.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation
import UIKit

protocol FirstViewControllerRoutable: Routable, FirstViewControllerSceneBuildable {
    
}

extension FirstViewControllerRoutable where Self: FirstViewController {
    func buildScene(scene: SceneCategory) -> Scenable? {
        var nextScene: Scenable?
        switch scene {
        case .detail(.secondViewController(let context)):
            nextScene = buildSecondScene(context: context)
        case .alert(let context):
            nextScene = buildAlert(context: context)
        default: break
        }
        return nextScene
    }
    
    func route(to Scene: SceneCategory) {
        switch Scene {
        case .detail(.secondViewController):
            let nextScene = buildScene(scene: Scene)
            guard let nextVC = nextScene as? UIViewController else { return }
            
            // TODO: 프리젠테이션이 이게 맞나...다시 확인 필요...
            nextVC.modalPresentationStyle = .overFullScreen //currentcontext?
            nextVC.modalTransitionStyle = .crossDissolve //?이걸 굳이...?
            self.present(nextVC, animated: true)
            
        case .alert:
            guard let scene = buildScene(scene: Scene) else { return }
            guard let nextVC = scene as? UIViewController else { return }
            present(nextVC, animated: true)
        default: break
        }
    }
}

protocol FirstViewControllerSceneBuildable: SceneBuildable {
    
}

extension FirstViewControllerSceneBuildable {
    func buildSecondScene(context: SceneContext<SecondModel>) -> Scenable {
        var nextScene: Scenable
        let secondModel = context.dependency
        let secondVC = SecondViewController(viewModel: secondModel)
        nextScene = secondVC
        
        return nextScene
    }
}

extension FirstViewControllerSceneBuildable {
    func buildAlert(context: AlertDependency) -> Scenable {
        let nextScene: Scenable
        
        let alert = AlertFactory(dependency: context).createAlert()
        nextScene = alert
        return nextScene
    }
}

