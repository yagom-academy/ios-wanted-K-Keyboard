//
//  BannerView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

class BannerView: UIView {
    
    var imageView = UIImageView()

    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BannerView: Presentable {
    func initViewHierarchy() {
        self.backgroundColor = .white
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 87)
        ]
    }
    
    func configureView() {
        imageView.image = UIImage(named: "BannerImage")
    }
    
    func bind() {
        
    }
    
    
}
