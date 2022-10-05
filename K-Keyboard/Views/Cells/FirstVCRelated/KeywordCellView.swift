//
//  KeywordCellView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/06.
//

import UIKit

class KeywordCellView: UIView {

    var imageView = UIImageView()
    var descLabel = UILabel()
    
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

extension KeywordCellView: Presentable {
    func initViewHierarchy() {
        self.addSubview(imageView)
        self.addSubview(descLabel)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraints: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.51),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            imageView.heightAnchor.constraint(equalToConstant: 105),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ]
        
        constraints += [
            descLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15.87),
            descLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ]
        
    }
    
    func configureView() {
        self.backgroundColor = .white
    }
    
    func bind() {
        
    }
}
