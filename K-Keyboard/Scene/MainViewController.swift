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
    
    private var tagList = ["이벤트", "캐릭터", "새", "동물", "앙ㅇㄴㅇㄴㄴㅇ증맞은" ,"동글동글", "마루", "귀여웡", "배고파","동글동글", "마루", "귀여웡", "배고파"]
    private var keywordList = [
        Keyword(title: "신나 🎉", imageName: "keyword_fun"),
        Keyword(title: "기대 ✨", imageName: "keyword_expect"),
        Keyword(title: "기대 ✨", imageName: "keyword_expect"),
        Keyword(title: "기대 ✨", imageName: "keyword_expect")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tagListCollectionView.dataSource = self
        self.tagListCollectionView.collectionViewLayout = generateTagListLayout()
        self.keywordColletionView.dataSource = self
    }

   
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagListCollectionView {
            return tagList.count
        } else {
            return keywordList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagListCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as? TagCell else { fatalError("Could not create new cell") }
            cell.configure(title: tagList[indexPath.row])
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeywordCell", for: indexPath) as? KeywordCell else { fatalError("Could not create new cell") }
            print(keywordList.count)
            print(keywordList[indexPath.row])
            cell.configure(keywordList[indexPath.row])
            return cell
        }
    }
}

extension MainViewController {
    func generateTagListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(60),
            heightDimension: .absolute(28)
        )
        let tagItem = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.35))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [tagItem])
        group.interItemSpacing = .fixed(8)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}
