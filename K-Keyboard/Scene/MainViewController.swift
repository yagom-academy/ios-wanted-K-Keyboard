//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

final class MainViewController: UIViewController {

    @IBOutlet private weak var tagListCollectionView: UICollectionView!
    @IBOutlet private weak var keywordColletionView: UICollectionView!
    @IBOutlet private weak var themeStackView: UIStackView!
    
    private var tagList = ["이벤트", "캐릭터", "새", "동물", "앙증맞은" ,"동글동글"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tagListCollectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.tagListCollectionView.dataSource = self
    }

   
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as? TagCell else { return UICollectionViewCell() }
        cell.titleLabel.text = tagList[indexPath.item]
        return cell
    }
    
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel()
        label.text = "dsfsd"
        return CGSize(width: label.frame.size.width + 10,  height: label.frame.size.width + 10)
    }
}
