//
//  TagCellView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

class TagCellView: UIView, FirstViewStyling {
    
    var tagNameLabel: UILabel = UILabel()

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

extension TagCellView: Presentable {
    func initViewHierarchy() {
        
        self.addSubview(tagNameLabel)
        tagNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            tagNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            tagNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.3),
            tagNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.3),
            tagNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)
        ]
    }
    
    func configureView() {
        tagNameLabel.addStyles(style: tagNameStyle)
    }
    
    func bind() {
        
    }
    
    
}
