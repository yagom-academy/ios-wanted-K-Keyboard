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
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        
        let ItemCellNib = UINib(nibName: ItemCell.identifier, bundle: Bundle(for: self.classForCoder))
        tableView.register(ItemCellNib, forCellReuseIdentifier: ItemCell.identifier)
        
        let NoticeCellNib = UINib(nibName: NoticeCell.identifier, bundle: Bundle(for: self.classForCoder))
        tableView.register(NoticeCellNib, forCellReuseIdentifier: NoticeCell.identifier)
        
        
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
        guard let dataSource = dto?.dataSource[indexPath.section] else { return UITableViewCell() }
        let section = dataSource.section
        let row = dataSource.items[indexPath.row]
        
        switch section {
        case .item:
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath)
            if let cell = cell as? ItemCell,
               case .item(let itemData) = row {
                cell.set(data: itemData)
            }
            return cell
        case .notice:
            let cell = tableView.dequeueReusableCell(withIdentifier: NoticeCell.identifier, for: indexPath)
            if let cell = cell as? NoticeCell,
               case .notice(let noticeData) = row {
                cell.set(data: noticeData)
            }
            return cell
        default:
            return UITableViewCell()
        }
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
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let dataSource = dto?.dataSource[section] else { return nil }
        let section = dataSource.section
        
        switch section {
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let dataSource = dto?.dataSource[section] else { return nil }
        let section = dataSource.section
        
        switch section {
        case .item:
            return UIView()
        default:
            return nil
        }
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let dataSource = dto?.dataSource[indexPath.section] else { return .zero }
        let section = dataSource.section
        
        let width = UIScreen.main.bounds.width
        
        switch section {
        case .item:
            let height = ((width - 32) / 343 * 264) + 115
            return height
        case .notice:
            return UITableView.automaticDimension
        default:
            return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let dataSource = dto?.dataSource[section] else { return .zero }
        let section = dataSource.section
        
        switch section {
        default:
            return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let dataSource = dto?.dataSource[section] else { return .zero }
        let section = dataSource.section
        
        switch section {
        case .item:
            return 40
        default:
            return .zero
        }
    }
}
