//
//  ShortcutButtonView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/07.
//

import Foundation
import UIKit

// MARK: - View
class ShortcutButtonView: UIView {
    // MARK: View Components
    lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.font = .appleSDGothicNeo(weight: .medium, size: 8)
        label.textColor = UIColor(hex: "#404040")
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: Associated Types
    typealias ViewModel = ShortcutButtonViewModel
    
    // MARK: Properties
    var didSetupConstraints = false
    var viewModel: ViewModel
    
    // MARK: Life Cycle
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
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
        self.layer.cornerRadius = 2
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(didLongTap))
        gestureRecognizer.minimumPressDuration = .zero
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(wordLabel)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            self.widthAnchor.constraint(equalToConstant: 48),
            self.heightAnchor.constraint(equalToConstant: 41),
        ]
        
        constraints += [
            wordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            wordLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        viewModel.wordSource = { [weak self] word in
            guard let self else { return }
            self.wordLabel.text = word
        }
    }
    
    // MARK: Action
    @objc func didLongTap(_ sender: Any) {
        guard let sender = sender as? UILongPressGestureRecognizer else { return }
        if sender.state == .began {
            self.backgroundColor = .white
        } else if sender.state == .ended {
            if self.point(inside: sender.location(in: self), with: nil) {
                viewModel.didTap?()
            }
            self.backgroundColor = .clear
        }
    }
}
