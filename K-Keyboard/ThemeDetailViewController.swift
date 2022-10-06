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
        mainView.tableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.identifier)
        
    }
}


extension ThemeDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier) as? DescriptionCell else { return .init() }
        let row = indexPath.row
        return cell
    }
    
}
