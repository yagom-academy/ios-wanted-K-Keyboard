//
//  PopUpViewController.swift
//  K-Keyboard
//
//  Created by KangMingyo on 2022/10/01.
//

import UIKit

class PopUpViewController: UIViewController {
    
    let popUpView: PopUpView = {
       let view = PopUpView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .clear
        popUpView.popUpViewController = self
        popUpView.buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
    }
     override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
         presentingViewController?.viewWillAppear(true)
     }
    
    @objc func buyButtonPressed() {
        let prevVC = ViewController()
        prevVC.toolbarState = false
        print(prevVC.toolbarState!)
        self.dismiss(animated: true)
    }
}
