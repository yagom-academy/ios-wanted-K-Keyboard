//
//  BannerTableViewCell.swift
//  K-Keyboard
//
//  Created by 유영훈 on 2022/10/07.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    var bannerImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
        self.addSubview(bannerImageView)
        
        var const = [NSLayoutConstraint]()
        defer { NSLayoutConstraint.activate(const) }
        const += [
            bannerImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bannerImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ]
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        bannerImageView = UIImageView()
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
//        bannerImageView.contentMode = .scaleAspectFill
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }

}
