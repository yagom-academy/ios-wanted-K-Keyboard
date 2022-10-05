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
        let tableSectionHeaderViewNib = UINib(nibName: TableSectionHeaderView.identifier, bundle: Bundle(for: self.classForCoder))
        tableView.register(tableSectionHeaderViewNib, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.identifier)
        
        let itemCellNib = UINib(nibName: ItemCell.identifier, bundle: Bundle(for: self.classForCoder))
        tableView.register(itemCellNib, forCellReuseIdentifier: ItemCell.identifier)
        
        let noticeCellNib = UINib(nibName: NoticeCell.identifier, bundle: Bundle(for: self.classForCoder))
        tableView.register(noticeCellNib, forCellReuseIdentifier: NoticeCell.identifier)
        
        let reviewCellNib = UINib(nibName: ReviewCell.identifier, bundle: Bundle(for: self.classForCoder))
        tableView.register(reviewCellNib, forCellReuseIdentifier: ReviewCell.identifier)
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
        case .reviews:
            let cell = tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier, for: indexPath)
            if let cell = cell as? ReviewCell,
               case .reviews(let reviewsData) = row {
                cell.set(data: reviewsData)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let dataSource = dto?.dataSource[section] else { return nil }
        let section = dataSource.section
        let row = dataSource.items.first
        
        switch section {
        case .reviews:
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.identifier)
            if let view = view as? TableSectionHeaderView,
               case .reviews(let reviewsData) = row {
                view.set(sectionName: SectionListType.review.rawValue, rowCount: reviewsData.count)
            }
            return view
        default:
            return UIView()
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
        case .reviews:
            return 1000
        default:
            return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let dataSource = dto?.dataSource[section] else { return .zero }
        let section = dataSource.section
        
        switch section {
        case .reviews:
            return 40
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
        case .notice:
            return 48
        default:
            return .zero
        }
    }
}
