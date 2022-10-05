//
//  KeywordCell.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/06.
//

import UIKit

class KeywordCell: UICollectionViewCell {
    
    var cellView = KeywordCellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data: (imageName: String, desc: String)) {
        cellView.imageView.image = UIImage(named: data.imageName)
        cellView.descLabel.text = data.desc
    }
    
}

extension KeywordCell: Presentable {
    func initViewHierarchy() {
        self.contentView.addSubview(cellView)
        cellView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
    }
    
    func configureView() {
    }
    
    func bind() {
        
    }
    
    
}
