//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class FirstViewController: UIViewController {
    var comments = [
        CommentModel(isCreator: true, userName: "크리에이터", comment: "구매해주셔서 감사합니다", time: "1일"),
        CommentModel(isCreator: false, userName: "o달빔o", comment: "아 진짜 귀여워요!!!!", time: "5시간"),
        CommentModel(isCreator: false, userName: "Channy", comment: "잘 쓰겠습니다", time: "30분"),
        CommentModel(isCreator: false, userName: "Beeem", comment: "굳", time: "30초")
    ]

    let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(named: "IcToolbarBack"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        return button
    }()
    
    let firstTableView = UITableView()

    let firstFooterView: UIView = {
        let view = UIView()
        view.backgroundColor = .white

        return view
    }()

    let gemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gem")

        return imageView
    }()

    let gemPrice: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = UIFont(name: Const.Font.notoBold, size: 16)
        label.textColor = UIColor(red: 0.49, green: 0.788, blue: 0.988, alpha: 1)

        return label
    }()

    let gemCount: UILabel = {
        let label = UILabel()
        label.text = "0젬 보유 중"
        label.font = UIFont(name: Const.Font.notoMedium, size: 12)
        label.textColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)

        let text = label.text!
        let attributeStr = NSMutableAttributedString(string: text)

        attributeStr.addAttribute(.foregroundColor,
                                  value: UIColor(red: 0.667, green: 0.671, blue: 0.702, alpha: 1),
                                  range: (text as NSString).range(of: "보유 중"))

        label.attributedText = attributeStr

        return label
    }()

    let buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("구매하기", for: .normal)
        button.titleLabel?.font = UIFont(name: Const.Font.notoBold, size: 14)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "pinkButton"), for: .normal)
        button.titleLabel?.baselineAdjustment = .alignCenters

        return button
    }()

    let inputBar: UITextField = {
        let bar = UITextField()
        bar.placeholder = "내용을 입력해주세요"

        return bar
    }()

    let saveButton: UIButton = {
        let button = UIButton()
        button.contentMode = .center
        button.backgroundColor = UIColor(red: 0.92, green: 0.32, blue: 0.49, alpha: 1)
        button.layer.cornerRadius = 18
        button.setTitle("등록", for: .normal)
        button.titleLabel?.font = UIFont(name: Const.Font.notoBold, size: 14)
        button.titleLabel?.baselineAdjustment = .alignCenters

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        firstTableView.delegate = self
        firstTableView.dataSource = self
        firstTableView.separatorStyle = .none
        if #available(iOS 15, *) {
            firstTableView.sectionHeaderTopPadding = 0
        }
        inputBar.delegate = self

        addViews()
        setConstraints()
        setActions()
    }
}

extension FirstViewController {
    func addViews() {
        [gemImage, gemPrice, gemCount, buyButton, inputBar, saveButton].forEach { firstFooterView.addSubview($0) }
        [backButton, firstTableView, firstFooterView].forEach { self.view.addSubview($0) }
    }

    func setConstraints() {
        [gemImage, gemPrice, gemCount, buyButton, inputBar, saveButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        [backButton, firstTableView, firstFooterView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        inputBar.isHidden = true
        saveButton.isHidden = true

        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            firstTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            firstTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstFooterView.topAnchor.constraint(equalTo: firstTableView.bottomAnchor),
            firstFooterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstFooterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstFooterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            firstFooterView.heightAnchor.constraint(equalToConstant: 64),

            gemPrice.topAnchor.constraint(equalTo: firstFooterView.topAnchor, constant: 11),
            gemPrice.leadingAnchor.constraint(equalTo: firstFooterView.leadingAnchor, constant: 36),
            gemPrice.bottomAnchor.constraint(equalTo: firstFooterView.bottomAnchor, constant: -29),
            gemImage.centerYAnchor.constraint(equalTo: gemPrice.centerYAnchor),
            gemImage.trailingAnchor.constraint(equalTo: gemPrice.leadingAnchor, constant: -6.33),
            gemCount.leadingAnchor.constraint(equalTo: firstFooterView.leadingAnchor, constant: 16),
            gemCount.topAnchor.constraint(equalTo: gemPrice.bottomAnchor),
            gemCount.bottomAnchor.constraint(equalTo: firstFooterView.bottomAnchor, constant: -11),
            buyButton.topAnchor.constraint(equalTo: firstFooterView.topAnchor, constant: 12),
            buyButton.trailingAnchor.constraint(equalTo: firstFooterView.trailingAnchor, constant: -16),
            buyButton.bottomAnchor.constraint(equalTo: firstFooterView.bottomAnchor, constant: -12),
            buyButton.widthAnchor.constraint(equalToConstant: 144)
        ])

        firstTableView.register(FifthSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: FifthSectionHeaderView.identifier)
    }

    func updateConstraints() {
        [gemImage, gemCount, gemPrice, buyButton].forEach { $0.isHidden = true }
        [inputBar, saveButton].forEach { $0.isHidden = false }

        NSLayoutConstraint.activate([
            inputBar.topAnchor.constraint(equalTo: firstFooterView.topAnchor),
            inputBar.leadingAnchor.constraint(equalTo: firstFooterView.leadingAnchor, constant: 20),
            inputBar.bottomAnchor.constraint(equalTo: firstFooterView.bottomAnchor),
            saveButton.leadingAnchor.constraint(equalTo: inputBar.trailingAnchor, constant: 10),
            saveButton.trailingAnchor.constraint(equalTo: firstFooterView.trailingAnchor, constant: -20),
            saveButton.centerYAnchor.constraint(equalTo: inputBar.centerYAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 48),
            saveButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    func setActions() {
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)

        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(FirstViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func addComment(comment: String) {
        comments.append(CommentModel(isCreator: false,
                                     userName: "Unknown",
                                     comment: comment,
                                    time: "1초"))

        firstTableView.reloadData()
    }

    @objc func buyButtonPressed(_ sender: UIButton) {
        let nextVC = PopupViewController()
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.delegate = self
        self.present(nextVC, animated: true)
    }

    @objc func saveButtonPressed(_ sender: UIButton) {
        if inputBar.text != "" {
            addComment(comment: inputBar.text!)
        }
        inputBar.endEditing(true)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }

        self.view.frame.origin.y = 0 - keyboardSize.height
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y = 0
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - TableView Delegate & DataSource
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 4:
            return comments.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            return CGFloat(160)
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(FirstSectionCell.self, forCellReuseIdentifier: FirstSectionCell.identifier)
        tableView.register(SecondSectionCell.self, forCellReuseIdentifier: SecondSectionCell.identifier)
        tableView.register(ThirdSectionCell.self, forCellReuseIdentifier: ThirdSectionCell.identifier)
        tableView.register(FourthSectionCell.self, forCellReuseIdentifier: FourthSectionCell.identifier)
        tableView.register(FifthSectionCell.self, forCellReuseIdentifier: FifthSectionCell.identifier)

        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstSectionCell.identifier, for: indexPath) as? FirstSectionCell else {
                return UITableViewCell()
            }

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondSectionCell.identifier, for: indexPath) as? SecondSectionCell else {
                return UITableViewCell()
            }
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThirdSectionCell.identifier, for: indexPath) as? ThirdSectionCell else {
                return UITableViewCell()
            }

            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FourthSectionCell.identifier, for: indexPath) as? FourthSectionCell else {
                return UITableViewCell()
            }

            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FifthSectionCell.identifier, for: indexPath) as? FifthSectionCell else {
                return UITableViewCell()
            }

            cell.commentView.configure(nickNameStr: comments[indexPath.row].userName,
                                       commentStr: comments[indexPath.row].comment)
            cell.setUserType(isCreator: comments[indexPath.row].isCreator)
            cell.timeLabel.text = comments[indexPath.row].time

            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCellOne.identifier, for: indexPath) as? TestTableViewCellOne else {
                return UITableViewCell()
            }

            cell.backgroundColor = .black
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 4:
            guard let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: FifthSectionHeaderView.identifier) as? FifthSectionHeaderView else {
                return UIView()
            }

            cell.reviewCount.text = String(comments.count)

            return cell
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 4:
            return 70
        default:
            return 0
        }
    }
}

// MARK: - PopupViewController Delegate
extension FirstViewController: PopupViewControllerDelegate {
    func activateTextField() {
        updateConstraints()
    }
}

// MARK: - UITextField Delegate
extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            addComment(comment: inputBar.text!)
        }
        textField.endEditing(true)
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = ""
    }
}

class TestTableViewCellOne: UITableViewCell {
    static let identifier = "testCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
extension UIViewController {
    struct ViewControllerPreview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

        }
    }

    func showPreview() -> some View {
        ViewControllerPreview(viewController: self)
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
struct FirstVC_Preview: PreviewProvider {
    static var previews: some View {
        FirstViewController().showPreview()
    }
}
#endif
