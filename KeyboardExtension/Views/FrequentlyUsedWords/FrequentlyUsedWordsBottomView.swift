//
//  FrequentlyUsedWordsBottomView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/06.
//

import Foundation
import UIKit
// MARK: - View
class FrequentlyUsedWordsBottomView: UIView {
    // MARK: View Components
    lazy var keyboardImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ic_toolbar_stickers")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var verticalDividerViews: [UIView] = {
        let views = [UIView(), UIView()]
        views.forEach { view in
            view.backgroundColor = UIColor(hex: "#A8B0BB")
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        return views
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var dateButton: UIButton = {
        let button = getButton("날짜")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var timeButton: UIButton = {
        let button = getButton("시간")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var dateTimeButton: UIButton = {
        let button = getButton("날짜/시간")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var editButton: UIButton = {
        let button = getButton("편집")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        self.addSubview(keyboardImageView)
        verticalDividerViews.forEach { self.addSubview($0) }
        self.addSubview(stackView)
        stackView.addArrangedSubview(dateButton)
        stackView.addArrangedSubview(timeButton)
        stackView.addArrangedSubview(dateTimeButton)
        self.addSubview(editButton)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            keyboardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            keyboardImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            keyboardImageView.widthAnchor.constraint(equalToConstant: 17),
            keyboardImageView.heightAnchor.constraint(equalToConstant: 17),
        ]
        
        constraints += [
            verticalDividerViews[0].leadingAnchor.constraint(equalTo: keyboardImageView.trailingAnchor, constant: 11),
            verticalDividerViews[0].centerYAnchor.constraint(equalTo: self.centerYAnchor),
            verticalDividerViews[0].widthAnchor.constraint(equalToConstant: 1),
            verticalDividerViews[0].heightAnchor.constraint(equalToConstant: 13),
        ]
        
        constraints += [
            stackView.leadingAnchor.constraint(equalTo: verticalDividerViews[0].trailingAnchor, constant: 17),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 15),
        ]
        
        constraints += [
            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -9),
            editButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
        
        constraints += [
            verticalDividerViews[1].trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -13),
            verticalDividerViews[1].centerYAnchor.constraint(equalTo: self.centerYAnchor),
            verticalDividerViews[1].widthAnchor.constraint(equalToConstant: 1),
            verticalDividerViews[1].heightAnchor.constraint(equalToConstant: 13),
        ]
    }
    
    // MARK: Utils
    private func getButton(_ title: String) -> UIButton {
        let button = UIButton()
        button.titleLabel?.font = .appleSDGothicNeo(weight: .bold, size: 11)
        button.setTitleColor(UIColor(hex: "#404040"), for: .normal)
        button.setTitleColor(UIColor(hex: "#404040").withAlphaComponent(0.2), for: .highlighted)
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
