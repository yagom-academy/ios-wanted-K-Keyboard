//
//  PopUpViewController.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/04.
//

import UIKit

protocol PopUpViewControllerDelegate: AnyObject {
    func rechargeAndUseButtonDidTap()
}

class PopUpViewController: UIViewController {
    weak var delegate: PopUpViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.view {
            self.dismiss(animated: true, completion: nil)
            
        }
    }

    @IBAction func rechargeAndUseButtonDidTap(_ sender: UIButton) {
        delegate?.rechargeAndUseButtonDidTap()
        self.dismiss(animated: true)
    }
}

