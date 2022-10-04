//
//  TableSectionHeaderView.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/04.
//

import Foundation
import UIKit

class TableSectionHeaderView: UITableViewHeaderFooterView {
    static var identifier: String { String(describing: self) }
    
    @IBOutlet weak var sectionNameLabel: UILabel!
    @IBOutlet weak var rowCountLabel: UILabel!
    
    init() {
        super.init(reuseIdentifier: TableSectionHeaderView.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(sectionName: String, rowCount: Int? = .zero) {
        self.sectionNameLabel.text = sectionName
        
        if let rowCount = rowCount {
            self.rowCountLabel.text = "\(rowCount)"
        } else {
            self.rowCountLabel.isHidden = true
        }
    }
    
    override func prepareForReuse() {
        self.sectionNameLabel.text = ""
        self.rowCountLabel.text = ""
        self.rowCountLabel.isHidden = false
    }
}
