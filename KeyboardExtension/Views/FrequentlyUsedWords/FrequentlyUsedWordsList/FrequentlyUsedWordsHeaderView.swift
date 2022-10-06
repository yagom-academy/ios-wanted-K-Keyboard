//
//  FrequentlyUsedWordsHeaderView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/06.
//

import Foundation
import UIKit

class FrequentlyUsedWordsHeaderView: UIView {
    // MARK: View Components
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "자주 쓰는 말"
        label.font = .appleSDGothicNeo(weight: .bold, size: 11)
        label.textColor = UIColor(hex: "#2CCCAD")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Associated Types
    
    // MARK: Properties
    var didSetupConstraints = false
    
    // MARK: Life Cycle
    init() {
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
        
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(titleLabel)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
    }
}
