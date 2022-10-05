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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 1
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.phonemeLabel.text = viewModel.phoneme.rawValue
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(phonemeLabel)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
        ]
        
        constraints += [
            phonemeLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            phonemeLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
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
