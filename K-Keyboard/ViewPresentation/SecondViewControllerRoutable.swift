//
//  SecondViewControllerRoutable.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation
import UIKit

protocol SecondViewControllerRoutable: Routable, SecondViewControllerSceneBuildable, SceneActionSendable {
    
}

extension SecondViewControllerRoutable where Self: SecondViewController {
    func buildScene(scene: SceneCategory) -> Scenable? {
        var nextScene: Scenable?
        switch scene {
        case .alert(let context):
            nextScene = buildAlert(context: context)
        default: break
        }
        
        return nextScene
    }
    
    func route(to Scene: SceneCategory) {
        switch Scene {
        case .close:
            self.dismiss(animated: true, completion: nil)
        case .closeWithAction(let scene):
            sendAction(scene: scene)
            self.dismiss(animated: true, completion: nil)
        case .alert:
            guard let scene = buildScene(scene: Scene) else { return }
            guard let nextVC = scene as? UIViewController else { return }
            present(nextVC, animated: true)
        default: break
        }
    }
    
    func sendAction(scene: SceneCategory) {
        switch scene {
        case .main(.firstViewControllerWithAction(let context)):
            guard let navi = self.presentingViewController as? BasicNavigationController else { return }
            guard let firstVC = navi.viewControllers.first(where: { $0 is FirstViewController }) as? FirstViewController else { return }
            
            let action = context.dependency
            firstVC.model.didReceiveSceneAction(action)
            break
        default: break
        }
    }
}

protocol SecondViewControllerSceneBuildable: SceneBuildable {
    
}

extension SecondViewControllerSceneBuildable {
    func buildAlert(context: AlertDependency) -> Scenable {
        let nextScene: Scenable
        
        let alert = AlertFactory(dependency: context).createAlert()
        nextScene = alert
        return nextScene
    }
}
