//
//  ToolBarButtonView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/05.
//

import Foundation
import UIKit
// MARK: - View
class ToolBarButtonView: UIView {
    // MARK: View Components
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Associated Types
    typealias ViewModel = ToolBarButtonViewModel
    
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
        imageView.image = viewModel.image
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(imageView)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 1.5),
            imageView.widthAnchor.constraint(equalToConstant: 18),
            imageView.heightAnchor.constraint(equalToConstant: 18),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        viewModel.selectedSource = { [weak self] selected in
            guard let self else { return }
            self.backgroundColor = selected ? .gray : UIColor(hex: "#D0D3DA")
        }
    }
    
    // MARK: Action
    @objc func didTap() {
        viewModel.didTap?()
    }
}
