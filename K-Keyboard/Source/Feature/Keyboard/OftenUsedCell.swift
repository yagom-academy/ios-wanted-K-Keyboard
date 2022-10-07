//
//  OftenUsedCell.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/10/06.
//

import UIKit

class OftenUsedCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemColor
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemBackground
        setViewHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchy() {
        contentView.addSubview(titleLabel)
    }
    
    func setConstraints() {
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    }
    
    
    
}

extension UIColor {
    private static func color(light: UIColor, dark: UIColor? = nil) -> UIColor {
       if let dark = dark  {
           if #available(iOS 13.0, *) {
               return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
           }
           return light
       } else {
           return light
       }
    }

    static let systemColor: UIColor = {
        let color = UIColor.color(light: .black, dark: .white)
        return color
    }()
}
