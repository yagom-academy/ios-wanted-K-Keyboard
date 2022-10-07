//
//  CollectionViewCell.swift
//  K-Keyboard
//
//  Created by so on 2022/09/29.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    // MARK: View Components
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .appleSDGothicNeo(weight: .medium, size: 14)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    // MARK: Associated Types
    
    // MARK: Properties
    static let identifier = "TagCollectionViewCell"
    var didSetupConstraints = false
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        buildViewHierarchy()
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if !didSetupConstraints {
            self.setupConstraints()
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    
    // MARK: Setup Views
    func setupViews() {
        self.contentView.backgroundColor = UIColor(hex: "#EBEDF5", alpha: 1)
        self.contentView.layer.cornerRadius = 14
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(title)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
        ]
    }
    
    // MARK: ConfigureCell
    func configureCell(_ title: String) {
        self.title.text = title
    }
}
