//
//  HeaderView.swift
//  K-Keyboard
//
//  Created by 박호현 on 2022/10/06.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    static var identifier: String { String(describing: self) }
    
    @IBOutlet var headerLabel: UILabel!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            prepareForReuse()
        }
    
    func set(sectionName: String, rowCount: Int?) {
        self.headerLabel.text = sectionName
        
        if let rowCount = rowCount {
            self.headerLabel.text = "\(rowCount)"
        } else {
            self.headerLabel.isHidden = true
        }
    }
    
    override func prepareForReuse() {
        self.headerLabel.text = ""
    }
}
 
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
