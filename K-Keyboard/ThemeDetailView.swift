//
//  ThemeDetailView.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/06.
//

import UIKit

class ThemeDetailView: UIView, ViewRepresent {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        self.backgroundColor = .white
        tableView.backgroundColor = .gray
        tableView.separatorStyle = .none
        addSubview(tableView)
    }
    
    func setupConstraints() {
        
        let safeGuide = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor)
        ])
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
