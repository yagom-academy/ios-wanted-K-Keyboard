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

final class PopUpViewController: UIViewController {
    
    @IBOutlet private weak var PopUpView: UIView!
    weak var delegate: PopUpViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
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

