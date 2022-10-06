//
//  PurchaseAlertViewController.swift
//  K-Keyboard
//
//  Created by so on 2022/10/05.
//

import Combine
import UIKit

class PurchaseAlertViewController: UIViewController {
    private var cancallables: Set<AnyCancellable> = []
    let popView = PopView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray.withAlphaComponent(0.4)
        view.addSubview(popView)
        popView.translatesAutoresizingMaskIntoConstraints = false
        let height = NSLayoutConstraint(item: popView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 330)
        let width = NSLayoutConstraint(item: popView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 295)
        popView.addConstraint(height)
        popView.addConstraint(width)
        popView.layer.cornerRadius = 15
        popView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        popView.$purchaseAndUseButtonSelected.sink { [unowned self] isSelected in
            if isSelected {
                self.dismiss(animated: true)
            }
        }.store(in: &cancallables)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
