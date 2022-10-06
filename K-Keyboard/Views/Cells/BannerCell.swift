//
//  BannerCell.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import UIKit

final class BannerCell: UICollectionViewCell {
    
    lazy var bannerView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view 
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemnted")
    }
}

extension BannerCell {
    func configure() {
        // TODO: - 이미지 비율 맞게
//        contentMode = .scaleAspectFill
        contentView.addSubview(bannerView)
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

