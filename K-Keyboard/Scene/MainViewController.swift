//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

protocol ThemeProtocol: AnyObject {
    func cellDidTap()
}

final class MainViewController: UIViewController {

    @IBOutlet private weak var tagListCollectionView: UICollectionView!
    @IBOutlet private weak var keywordColletionView: UICollectionView!
    @IBOutlet private weak var themeCollectionView: UICollectionView!
    
    weak var delegate: ThemeProtocol?
    
    private var tagList = ["이벤트", "캐릭터", "새", "동물", "앙ㅇㄴㅇㄴㄴㅇ증맞은" ,"동글동글", "마루", "귀여웡", "배고파","동글동글", "마루", "귀여웡", "배고파"]
    private var keywordList = [
        KeywordModel(title: "신나 🎉", imageName: "keyword_fun"),
        KeywordModel(title: "기대 ✨", imageName: "keyword_expect"),
        KeywordModel(title: "기대 ✨", imageName: "keyword_expect"),
        KeywordModel(title: "기대 ✨", imageName: "keyword_expect")
    ]
    
    private var themeList = [
        ThemeModel(emoji: "😄", title: "맘에들어요", count: 0),
        ThemeModel(emoji: "😍", title: "심쿵했어요", count: 0),
        ThemeModel(emoji: "😉", title: "응원해요", count: 0),
        ThemeModel(emoji: "😂", title: "갖고싶어요", count: 0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tag
        self.tagListCollectionView.dataSource = self
        self.tagListCollectionView.collectionViewLayout = generateTagListLayout()
        //keyword
        self.keywordColletionView.dataSource = self
        //theme
        self.themeCollectionView.dataSource = self
        self.themeCollectionView.delegate = self
        self.themeCollectionView.collectionViewLayout = generateThemeListLayout()
    }
    
   
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagListCollectionView {
            return tagList.count
        }
        else if collectionView == keywordColletionView  {
            return keywordList.count
        }
        else if collectionView == themeCollectionView {
            return themeList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagListCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as? TagCell else { fatalError("Could not create new cell") }
            cell.configure(title: tagList[indexPath.row])
            return cell
        }
        else if collectionView == keywordColletionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeywordCell", for: indexPath) as? KeywordCell else { fatalError("Could not create new cell") }
            cell.configure(keywordList[indexPath.row])
            return cell
        }
        else if collectionView == themeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemeCell", for: indexPath) as? ThemeCell else { fatalError("Could not create new cell") }
            cell.configure(themeList[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ThemeCell else { return }
        cell.count += 1
        self.themeList[indexPath.row].count += 1
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
    
    func generateThemeListLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(75), heightDimension: .absolute(110))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(12)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}

