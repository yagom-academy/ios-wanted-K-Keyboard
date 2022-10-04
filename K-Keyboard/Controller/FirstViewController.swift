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
        view.backgroundColor = .green

        return view
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
        [backButton, firstTableView, firstFooterView].forEach { self.view.addSubview($0) }
    }

    func setConstraints() {
        [backButton, firstTableView, firstFooterView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        firstFooterView.backgroundColor = .darkGray

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
            firstFooterView.heightAnchor.constraint(equalToConstant: 64)
        ])

        firstTableView.register(FifthSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: FifthSectionHeaderView.identifier)

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
