//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class FirstViewController: UIViewController {
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

        addViews()
        setConstraints()
    }
}

extension FirstViewController {
    func addViews() {
        [firstTableView, firstFooterView].forEach { self.view.addSubview($0) }
    }

    func setConstraints() {
        [firstTableView, firstFooterView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        firstFooterView.backgroundColor = .darkGray

        NSLayoutConstraint.activate([
            firstTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstFooterView.topAnchor.constraint(equalTo: firstTableView.bottomAnchor),
            firstFooterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstFooterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstFooterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            firstFooterView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(TestTableViewCellOne.self, forCellReuseIdentifier: TestTableViewCellOne.identifier)
        tableView.register(FourthSectionCell.self, forCellReuseIdentifier: FourthSectionCell.identifier)

        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCellOne.identifier, for: indexPath) as? TestTableViewCellOne else {
                return UITableViewCell()
            }

            cell.backgroundColor = .gray
            return cell
        case 1:
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
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCellOne.identifier, for: indexPath) as? TestTableViewCellOne else {
                return UITableViewCell()
            }

            cell.backgroundColor = .black
            return cell
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
