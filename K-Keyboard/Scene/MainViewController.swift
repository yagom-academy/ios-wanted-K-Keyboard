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
    
    private var viewModel: MainViewModel = .init()
    
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
        //keyboard
        self.keyboardSetting()
        
    }
    
    @IBAction func reviewFoldButtonDidTap(_ sender: UIButton) {
        viewModel.reviewCollectionViewIsHidden.toggle()
        self.reviewCollectionView.isHidden = viewModel.reviewCollectionViewIsHidden
        let imageName = viewModel.reviewCollectionViewIsHidden ? UIImage(systemName: "chevron.up") : UIImage(systemName: "chevron.down")
        self.reviewFoldButton.setImage(imageName, for: .normal)
    }
    
}
// MARK: - Datasource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagListCollectionView {
            return viewModel.tagList.count
        }
        else if collectionView == keywordColletionView  {
            return viewModel.keywordList.count
        }
        else if collectionView == themeCollectionView {
            return viewModel.themeList.count
        }
        else if collectionView == reviewCollectionView {
            return viewModel.reviewList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagListCollectionView {
            let cell = collectionView.dequeuReusableCell(type: TagCell.self, for: indexPath)
            cell.configure(title: viewModel.tagList[indexPath.row])
            return cell
        }
        else if collectionView == keywordColletionView {
            let cell = collectionView.dequeuReusableCell(type: KeywordCell.self, for: indexPath)
            cell.configure(viewModel.keywordList[indexPath.row])
            return cell
        }
        else if collectionView == themeCollectionView {
            let cell = collectionView.dequeuReusableCell(type: ThemeCell.self, for: indexPath)
            cell.configure(viewModel.themeList[indexPath.row])
            return cell
        }
        else if collectionView == reviewCollectionView {
            let cell = collectionView.dequeuReusableCell(type: ReviewCell.self, for: indexPath)
            cell.configure(viewModel.reviewList[indexPath.row])
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
        viewModel.themeList[indexPath.row].count += 1
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
        popUpVC.modalPresentationStyle = .overCurrentContext
        popUpVC.delegate = self
        self.present(popUpVC, animated: true)
    }
    
    func senderReviewText(_ review: String) {
        if !review.isEmpty {
            let model = ReviewModel(userType: .user, nickname: "유저", content: review)
            reviewCollectionView.performBatchUpdates {
                viewModel.reviewList.append(model)
            }
            reviewCollectionView.reloadData()
            let indexPathItem = IndexPath(item: viewModel.reviewList.count - 1, section: 0)
            self.reviewCollectionView.scrollToItem(at: indexPathItem, at: .bottom, animated: true)
        }
    }
}

extension MainViewController: PopUpViewControllerDelegate {
    func rechargeAndUseButtonDidTap() {
        bottomView.jamStateStackView.isHidden = true
        bottomView.buyJamButton.isHidden = true
        bottomView.reviewTextField.isHidden = false
        bottomView.reviewInputButton.isHidden = false
    }
}
// MARK: - Keyboard up/down
extension MainViewController {
    func keyboardSetting() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        scrollViewFold()
    }
    
    private func scrollViewFold() {
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MyTapMethod(sender:)))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        mainScrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func keyboardWillShow(_ sender: Notification) {
        if let keyboardSize = (sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3, animations: {
                let bottomOffset = CGPoint(x: 0, y: self.mainScrollView.contentSize.height - self.mainScrollView.bounds.height + self.mainScrollView.contentInset.bottom + 310)
                self.mainScrollView.setContentOffset(bottomOffset, animated: true)
                self.bottomViewBottomConstraint.constant = keyboardSize.height
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func MyTapMethod(sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.3, animations: {
            self.mainScrollView.setContentOffset(CGPoint(x: 0, y: self.mainScrollView.contentSize.height - self.mainScrollView.bounds.height + self.mainScrollView.contentInset.bottom + 10), animated: true)
            self.bottomViewBottomConstraint.constant = CGFloat(30)
            self.view.layoutIfNeeded()
            self.view.endEditing(true)
        })
    }

}

