//
//  ToolBarView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/05.
//

import Foundation
import UIKit
// MARK: - View
class ToolBarView: UIView {
    // MARK: View Components
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var buttonViews: [ToolBarButtonView] = {
        var views = [ToolBarButtonView]()
        viewModel.toolBarImages.forEach { image in
            let viewModel = ToolBarButtonViewModel(image)
            let view = ToolBarButtonView(viewModel: viewModel)
            views.append(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        return views
    }()
    
    lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#A8B0BB")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Associated Types
    typealias ViewModel = ToolBarViewModel
    
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
        
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(stackView)
        self.addSubview(dividerView)
        buttonViews.forEach { stackView.addArrangedSubview($0) }
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 28),
        ]
        
        constraints += [
            dividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            dividerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        buttonViews.enumerated().forEach { index, view in
            view.viewModel.propagateTap = { [weak self] in
                guard let self else { return }
                self.viewModel.tapButton?(index)
            }
        }
        
        viewModel.selectedSource = { [weak self] selected in
            guard let self else { return }
            self.buttonViews.enumerated().forEach { index, view in
                if index == selected {
                    view.viewModel.receiveSelected?(true)
                } else {
                    view.viewModel.receiveSelected?(false)
                }
            }
        }
    }
}
