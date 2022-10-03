//
//  PhonemeView.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation
import UIKit
// MARK: - View
class PhonemeView: UIView {
    // MARK: View Components
    lazy var phonemeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .appleSDGothicNeo(weight: .regular, size: 21)
        return label
    }()
    
    // MARK: Associated Types
    typealias ViewModel = PhonemeViewModel
    
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
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.cornerRadius = 5
        self.phonemeLabel.text = viewModel.phoneme.rawValue
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(phonemeLabel)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        phonemeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            phonemeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            phonemeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        viewModel.phonemeSource = { [weak self] phoneme in
            guard let self else { return }
            self.phonemeLabel.text = phoneme.rawValue
        }
    }
    
    // MARK: Action
    @objc func didTap() {
        viewModel.didTap?()
    }
}
