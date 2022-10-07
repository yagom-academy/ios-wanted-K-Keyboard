//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class ThemeDetailViewController: UIViewController {
    
    let mainView = ThemeDetailView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.rowHeight = UITableView.automaticDimension
        mainView.tableView.register(DescriptionTableViewCell.self, forCellReuseIdentifier: DescriptionTableViewCell.identifier)
        mainView.tableView.register(TagTableViewCell.self, forCellReuseIdentifier: TagTableViewCell.identifier)
        mainView.tableView.register(KeywordTableViewCell.self, forCellReuseIdentifier: KeywordTableViewCell.identifier)
    }
}


extension ThemeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
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
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = .blue
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
