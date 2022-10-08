//
//  TagCell.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

final class TagCell: UICollectionViewCell, FirstViewStyling {
    
    var cellView: TagCellView = TagCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(tagName: String) {
        cellView.tagNameLabel.text = tagName
    }
}

extension TagCell: Presentable {
    func initViewHierarchy() {
        self.contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            cellView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ]
        
    }
    
    func configureView() {
        cellView.addStyles(style: tagCellViewStyle)
    }
    
    func bind() {
        
    }
    
    
}
