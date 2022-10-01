//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet private weak var tagListStackView: UIStackView!
    @IBOutlet private weak var keywordColletionView: UICollectionView!
    @IBOutlet private weak var themeStackView: UIStackView!
    
    private var tagList = ["이벤트", "캐릭터", "새", "동물", "앙증맞은" ,"동글동글"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTagList()
    }

    private func setTagList() {
        tagList.enumerated().forEach {
            let tagView = TagView()
            tagView.heightAnchor.constraint(equalToConstant: 20).isActive = true
            tagView.configure(title: $1)
            tagListStackView.addArrangedSubview(tagView)
        }
    }
}

