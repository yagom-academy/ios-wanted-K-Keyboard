//
//  ShiftView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/04.
//

import Foundation
import UIKit
// MARK: - View
class ShiftView: UIView {
    // MARK: View Components
    lazy var shiftImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "shift"))
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Associated Types
    typealias ViewModel = ShiftViewModel
    
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
        self.backgroundColor = UIColor(hex: "#A8B0BB")
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.cornerRadius = 5
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(shiftImage)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            shiftImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shiftImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        viewModel.activatedSource = { [weak self] activated in
            guard let self else { return }
            if activated {
                self.backgroundColor = UIColor.white
                self.shiftImage.image = UIImage(systemName: "shift.fill")
            } else {
                self.backgroundColor = UIColor(hex: "#A8B0BB")
                self.shiftImage.image = UIImage(systemName: "shift")
            }
        }
    }
    
    // MARK: Action
    @objc func didTap() {
        viewModel.didTap?()
    }
}
