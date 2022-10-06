//
//  FrequentlyUsedWordsView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/06.
//

import Foundation
import UIKit
// MARK: - View
class FrequentlyUsedWordsMainView: UIView {
    // MARK: View Components
    lazy var listView: FrequentlyUsedWordsListView = {
        let viewModel = FrequentlyUsedWordsListViewModel()
        let view = FrequentlyUsedWordsListView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Associated Types
    typealias ViewModel = FrequentlyUsedWordsMainViewModel
    
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
        self.addSubview(listView)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            listView.topAnchor.constraint(equalTo: self.topAnchor),
            listView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            listView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -42),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        listView.viewModel.propagateSelectedWord = { [weak self] word in
            guard let self else { return }
            self.viewModel.propagateSelectedWord?(word)
        }
    }
}
