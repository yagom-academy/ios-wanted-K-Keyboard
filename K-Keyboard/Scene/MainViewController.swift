//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit


final class MainViewController: UIViewController {

    @IBOutlet private weak var mainScrollView: UIScrollView!
    @IBOutlet private weak var tagListCollectionView: UICollectionView!
    @IBOutlet private weak var keywordColletionView: UICollectionView!
    @IBOutlet private weak var themeCollectionView: UICollectionView!
    @IBOutlet private weak var reviewCollectionView: UICollectionView!
    @IBOutlet private weak var reviewFoldButton: UIButton!
    @IBOutlet private weak var bottomView: BottomView!
    @IBOutlet private weak var bottomViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet private weak var scrollViewBottomConstraint: NSLayoutConstraint!
    
    private var reviewCollectionViewIsHidden: Bool = false
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
    private var reviewList = [
        ReviewModel(userType: .creater, nickname: "julia", content: "dfsdsffsd"),
        ReviewModel(userType: .user, nickname: "유저", content: "111"),
        ReviewModel(userType: .user, nickname: "유저", content: "dfsds22ffsd"),
        ReviewModel(userType: .user, nickname: "유저", content: "3333"),
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
        //review
        self.reviewCollectionView.dataSource = self
        //buttom
        self.bottomView.delegate = self
        keyboardSetting()
        scrollViewFold()
    }
    
    private func scrollViewFold() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyTapMethod(sender:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        mainScrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    @objc func MyTapMethod(sender: UITapGestureRecognizer) {
        self.bottomViewBottomConstraint.constant = CGFloat(30)
        self.scrollViewBottomConstraint.constant = CGFloat(0)
        self.view.endEditing(true)
    }
    
    @IBAction func reviewFoldButtonDidTap(_ sender: UIButton) {
        reviewCollectionViewIsHidden.toggle()
        self.reviewCollectionView.isHidden = self.reviewCollectionViewIsHidden
        let imageName = self.reviewCollectionViewIsHidden ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
        self.reviewFoldButton.setImage(imageName, for: .normal)
    }

}
// MARK: - Datasource
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
        else if collectionView == reviewCollectionView {
            return reviewList.count
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
        else if collectionView == reviewCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCell", for: indexPath) as? ReviewCell else { fatalError("Could not create new cell") }
            cell.configure(reviewList[indexPath.row])
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
}
// MARK: - Delegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ThemeCell else { return }
        cell.count += 1
        self.themeList[indexPath.row].count += 1
    }
}

extension MainViewController: ReviewCellProtocol {
    func reportButtonDidTap() {
        let alertVC = UIAlertController(title: nil, message: "신고되었습니다.", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        alertVC.addAction(confirm)
        self.present(alertVC, animated: true)
    }
}

extension MainViewController: BottomViewDelegate {
    func buyJamButtonDidTap() {
        guard let popUpVC = self.storyboard?.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
        popUpVC.modalPresentationStyle = .fullScreen
        popUpVC.delegate = self
        self.present(popUpVC, animated: true)
    }
    
    func senderReviewText(_ review: String) {
        let model = ReviewModel(userType: .user, nickname: "유저", content: review)
        reviewList.append(model)
        reviewCollectionView.reloadData()
    }
}

extension MainViewController: PopUpViewControllerDelegate {
    func rechargeAndUseButtonDidTap() {
        //바텀뷰의 입력창으로 바껴야함
        bottomView.jamStateStackView.isHidden = true
        bottomView.buyJamButton.isHidden = true
        bottomView.reviewTextField.isHidden = false
        bottomView.reviewInputButton.isHidden = false
    }
}

// MARK: - ColletionLayout
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

extension MainViewController {
    func keyboardSetting() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3, animations: {
                self.bottomViewBottomConstraint.constant = keyboardSize.height
                self.view.layoutIfNeeded()
            })
        }
    }

}

