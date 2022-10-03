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
        
        let ItemCellNib = UINib(nibName: "ItemCell", bundle: Bundle(for: self.classForCoder))
        tableView.register(ItemCellNib, forCellReuseIdentifier: "ItemCell")
    }
    
    func dataBinding() {
        
    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemCell else { return UITableViewCell() }
        return cell
    }
    
}
