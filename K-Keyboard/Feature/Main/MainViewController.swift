//
//  MainViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        dataBinding()
    }

    func initUI() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "emptyCell")
        
//        let ItemCellNib = UINib(nibName: ItemCell.self, bundle: Bundle(for: self.classForCoder))
//        tableView.register(ItemCellNib, forCellReuseIdentifier: ItemCell.identifier)
    }

    func dataBinding() {

    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emptyCell", for: indexPath)
        return cell
    }
}
