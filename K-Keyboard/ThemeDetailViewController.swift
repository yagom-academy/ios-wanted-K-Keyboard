//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class ThemeDetailViewController: UIViewController {
    
    let mainView = ThemeDetailView()
    
    // MARK: Sample Data
    var reviewSample = [ReviewDataModel]()
    struct ReviewDataModel {
        var isCreator: Bool = false
        var profileImage: UIImage = UIImage(named: "profile")!
        var name: String
        var content: String
        var writeBefore: String
    }

    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {
                return
        }
        let contentInset = UIEdgeInsets(
                top: 0.0,
                left: 0.0,
                bottom: keyboardFrame.size.height - 30,
                right: 0.0)

        mainView.tableView.contentInset = contentInset
        mainView.tableView.scrollIndicatorInsets = contentInset
        mainView.bottomView.removeConstraint(mainView.constraint)
        mainView.constraint = mainView.bottomView.heightAnchor.constraint(equalToConstant: 366)
        mainView.constraint.isActive = true
        
    }

    @objc private func keyboardWillHide() {
        let contentInset = UIEdgeInsets.zero

        mainView.tableView.contentInset = contentInset
        mainView.tableView.scrollIndicatorInsets = contentInset
        mainView.bottomView.removeConstraint(mainView.constraint)
        mainView.constraint = mainView.bottomView.heightAnchor.constraint(equalToConstant: 64)
        mainView.constraint.isActive = true
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func purchased() {
        mainView.reviewBarView.isHidden = false
        mainView.purchaseBarView.isHidden = true
        mainView.tableView.reloadData()
    }
    
    @objc func purchase() {
        let vc = BuyModalViewController()
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: false)
    }
    
    @objc func addReview(_ notification: Notification) {
        let review = notification.object as! String
        reviewSample.insert(ReviewDataModel(name: "유저", content: review, writeBefore: "1초전"), at: 1)
        mainView.tableView.reloadData()
        view.endEditing(true)
    }
    
    func setup() {
        
        UserDefaults.standard.set(0, forKey: "gem")
        UserDefaults.standard.set(false, forKey: "isPurchased")
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(purchased),
            name: Notification.Name("purchased"),
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(addReview(_:)),
            name: Notification.Name("addReview"),
            object: nil)
        
        mainView.buyButton.addTarget(self, action: #selector(purchase), for: .touchUpInside)

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.rowHeight = UITableView.automaticDimension
        mainView.tableView.backgroundColor = .systemBackground
        mainView.tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        mainView.tableView.register(TagTableViewCell.self, forCellReuseIdentifier: TagTableViewCell.identifier)
        mainView.tableView.register(KeywordTableViewCell.self, forCellReuseIdentifier: KeywordTableViewCell.identifier)
        mainView.tableView.register(EvaluationTableViewCell.self, forCellReuseIdentifier: EvaluationTableViewCell.identifier)
        mainView.tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: BannerTableViewCell.identifier)
        mainView.tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        
        // MARK: Sample data
        reviewSample.append(ReviewDataModel(isCreator: true, profileImage: UIImage(named: "emoji2")!, name: "몰랑_크리에이터", content: "구매해주셔서 감사합니다♥", writeBefore: "1일"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "30초"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워", writeBefore: "1분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "맘에드네요!", writeBefore: "1분"))
        reviewSample.append(ReviewDataModel(profileImage: UIImage(named: "emoji1")!, name: "유저1", content: "정말 귀여워요..", writeBefore: "10분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "23분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "25분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "25분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "25분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "25분"))
    }
}

extension ThemeDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 + reviewSample.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        print(row)
        switch row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionTableViewCell.identifier) as? DescriptionTableViewCell else { return .init() }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TagTableViewCell.identifier) as? TagTableViewCell else { return .init() }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: KeywordTableViewCell.identifier) as? KeywordTableViewCell else { return .init() }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: EvaluationTableViewCell.identifier) as? EvaluationTableViewCell else { return .init() }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BannerTableViewCell.identifier) as? BannerTableViewCell else { return .init() }
            cell.bannerImageView.image = UIImage(named: "banner")!
            cell.keywordLabel.text = UserDefaults.standard.bool(forKey: "isPurchased") ? "리뷰 작성 \(reviewSample.count)" : "구매 리뷰 \(reviewSample.count)"
//            cell.keywordLabel.asFontColor(targetString: "\(reviewSample.count)", font: nil, color: UIColor.customPink())
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier) as? ReviewTableViewCell else { return .init() }
            let review =  reviewSample[indexPath.row - 5]
            cell.profileTagLabel.isHidden = !review.isCreator
            cell.userNameLabel.text = review.name
            cell.profileImageView.image = review.profileImage
            cell.reviewContentLabel.text = review.content
            cell.writeBeforeLabel.text = review.writeBefore
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
