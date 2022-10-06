//
//  FrequentlyUsedWordsListCell.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/06.
//

import UIKit

class FrequentlyUsedWordsListCell: UITableViewCell {
    // MARK: View Components
    lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.font = .appleSDGothicNeo(weight: .medium, size: 11)
        label.textColor = UIColor(hex: "#404040")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Associated Types
    typealias ViewModel = FrequentlyUsedWordsListCellModel
    
    // MARK: Properties
    var viewModel = ViewModel()
    var didSetupConstraints = false
    
    // MARK: Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        buildViewHierarchy()
        self.setNeedsUpdateConstraints()
        bind()
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
        self.backgroundColor = .clear
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.contentView.addSubview(wordLabel)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            wordLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            wordLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),
            wordLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
        ]
    }
    
    // MARK: Binding
    func bind() {
        viewModel.wordSource = { [weak self] word in
            guard let self else { return }
            self.wordLabel.text = word
        }
    }
}
