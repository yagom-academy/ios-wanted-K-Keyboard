//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit
import KoreanKeyboard

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let collectionViewController = ThemeViewController()
        show(collectionViewController, sender: nil)
        navigationItem.backButtonDisplayMode = .minimal
    }

}

