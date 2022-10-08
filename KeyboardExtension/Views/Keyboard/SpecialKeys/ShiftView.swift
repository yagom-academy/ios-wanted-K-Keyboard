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
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(backgroundView)
        backgroundView.addSubview(shiftImage)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3),
            backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11),
            backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6),
        ]
        
        constraints += [
            shiftImage.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            shiftImage.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        viewModel.activatedSource = { [weak self] activated in
            guard let self else { return }
            if activated {
                self.backgroundView.backgroundColor = UIColor.white
                self.shiftImage.image = UIImage(systemName: "shift.fill")
            } else {
                self.backgroundView.backgroundColor = UIColor(hex: "#A8B0BB")
                self.shiftImage.image = UIImage(systemName: "shift")
            }
        }
    }
    
    // MARK: Action
    @objc func didTap() {
        viewModel.didTap?()
    }
}
