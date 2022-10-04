//
//  PopupViewController.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/04.
//

import UIKit

class PopupViewController: UIViewController {

    let popupView = PopupView()
    var delegate: PopupViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        setConstraints()
        popupView.delegate = self

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
}

extension PopupViewController {
    func addViews() {
        view.addSubview(popupView)
    }

    func setConstraints() {
        popupView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            popupView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            popupView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            popupView.widthAnchor.constraint(equalToConstant: view.frame.width - 80),
            popupView.heightAnchor.constraint(equalToConstant: 330)
            // FIXME: - 동적으로 어떻게 할까
//            popupView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
    }
}

extension PopupViewController: PopupViewDelegate {
    func buyAndUseButtonPressed() {
        self.delegate?.activateTextField()
        self.dismiss(animated: true)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct PopupVC_Preview: PreviewProvider {
    static var previews: some View {
        PopupViewController().showPreview()
    }
}
#endif
