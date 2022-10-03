//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class FirstViewController: UIViewController {
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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        firstTableView.delegate = self
        firstTableView.dataSource = self
        firstTableView.separatorStyle = .none
        
        addViews()
        setConstraints()
    }
}

extension FirstViewController {
    func addViews() {
        [gemImage, gemPrice, gemCount, buyButton].forEach { firstFooterView.addSubview($0) }
        [backButton, firstTableView, firstFooterView].forEach { self.view.addSubview($0) }
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
    }

    func setConstraints() {
        [gemImage, gemPrice, gemCount, buyButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        [backButton, firstTableView, firstFooterView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

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

    @objc func buyButtonPressed(_ sender: UIButton) {
        print("button pressed")
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1:
            // MARK: Tag 수에 따라서 높이 계산해서 따로 설정해줘야 함
            return CGFloat(144)
        default:
            return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(TestTableViewCellOne.self, forCellReuseIdentifier: TestTableViewCellOne.identifier)
        tableView.register(FirstSectionCell.self, forCellReuseIdentifier: FirstSectionCell.identifier)
        tableView.register(SecondSectionCell.self, forCellReuseIdentifier: SecondSectionCell.identifier)
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCellOne.identifier, for: indexPath) as? TestTableViewCellOne else {
                return UITableViewCell()
            }

            cell.backgroundColor = .blue
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

            return cell
        default:
            return UIView()
        }
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


