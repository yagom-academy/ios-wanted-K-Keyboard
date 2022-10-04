//
//  ReviewCell.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import UIKit

class ReviewCell: UITableViewCell {
    static var identifier: String { String(describing: self) }
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [ReviewData]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initialize()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func initialize() {
        let reviewItemCellNib = UINib(nibName: ReviewItemCell.identifier, bundle: Bundle(for: self.classForCoder))
        tableView.register(reviewItemCellNib, forCellReuseIdentifier: ReviewItemCell.identifier)
    }
    
    func set(data: [ReviewData]) {
        self.data = data
    }
    
}

extension ReviewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewItemCell.identifier, for: indexPath)
        if let cell = cell as? ReviewItemCell {
            cell.set()
        }
        return cell
    }
}
