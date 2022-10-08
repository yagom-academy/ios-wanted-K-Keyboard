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
        
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.addSubview(popView)
        popView.translatesAutoresizingMaskIntoConstraints = false
        popView.layer.cornerRadius = 15
        NSLayoutConstraint.activate([
            popView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            popView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            popView.heightAnchor.constraint(equalToConstant: 330),
        ])
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backgroundTapped)))
        popView.addGestureRecognizer(UITapGestureRecognizer())
        
        popView.$purchaseAndUseButtonSelected.sink { [unowned self] isSelected in
            if isSelected {
                self.dismiss(animated: true)
            }
        }.store(in: &cancallables)
    }
    
    @objc func backgroundTapped() {
        self.dismiss(animated: true)
    }
}
