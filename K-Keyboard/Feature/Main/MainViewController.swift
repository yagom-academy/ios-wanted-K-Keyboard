//
//  MainViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let repository = MainViewRepository()
    private var dto: MainViewDTO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        dataBinding()
    }

    func initUI() {
//        let ItemCellNib = UINib(nibName: ItemCell.self, bundle: Bundle(for: self.classForCoder))
//        tableView.register(ItemCellNib, forCellReuseIdentifier: ItemCell.identifier)
    }

    func dataBinding() {
        repository.fetchMainView() { dto in
            self.dto = dto
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dto?.dataSource.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dto?.dataSource[section].items.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = dto?.dataSource[indexPath.section].section else {
            return UITableViewCell()
        }
        
        guard let row = dto?.dataSource[indexPath.section].items[indexPath.row] else {
            return UITableViewCell()
        }
        
//        switch section {
//        case .item:
//            let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath)
//            return cell
//
//        case .notice:
//            let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.identifier, for: indexPath)
//            return cell
//
//        case .tags:
//            let cell = tableView.dequeueReusableCell(withIdentifier: TagCell.identifier, for: indexPath)
//            if let cell = cell as? TagCell,
//               case .tags(let tag) = row {
//                cell.set(data: )
//            }
//            return cell
//
//        case .previews:
//            let cell = tableView.dequeueReusableCell(withIdentifier: PreviewCell.identifier, for: indexPath)
//            return cell
//
//        case .aboutThemes:
//            let cell = tableView.dequeueReusableCell(withIdentifier: AboutThemeCell.identifier, for: indexPath)
//            return cell
//
//        case .ads:
//            let cell = tableView.dequeueReusableCell(withIdentifier: AdsCell.identifier, for: indexPath)
//            return cell
//
//        case .reviews:
//            let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier, for: indexPath)
//            return cell
//        }
        return UITableViewCell()
    }
}
