//
//  ReturnView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/04.
//

import Foundation
import UIKit
// MARK: - View
class ReturnView: UIView {
    // MARK: View Components
    lazy var returnImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "return.left"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor =  UIColor(hex: "#A8B0BB")
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowRadius = 1
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Associated Types
    typealias ViewModel = ReturnViewModel
    
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
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(returnImage)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
        ]
        
        constraints += [
            returnImage.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            returnImage.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        
    }
    
    // MARK: Action
    @objc func didTap() {
        viewModel.didTap?()
    }
}
