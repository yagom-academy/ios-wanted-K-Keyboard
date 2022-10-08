//
//  ShortcutView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/07.
//

import Foundation
import UIKit
// MARK: - View
class ShortcutPopupView: UIView {
    // MARK: View Components
    lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var rowStackViews: [UIStackView] = {
        let stackViews = [UIStackView(), UIStackView()]
        stackViews.forEach { stackView in
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
        }
        return stackViews
    }()
    
    lazy var staticButtons: [ShortcutButtonView] = {
        var views = [ShortcutButtonView]()
        let words = ["🎙", "한자", "⚙️"]
        words.forEach { word in
            let viewModel = ShortcutButtonViewModel()
            let view = ShortcutButtonView(viewModel: viewModel)
            viewModel.receiveWord?(word)
            view.translatesAutoresizingMaskIntoConstraints = false
            views.append(view)
        }
        return views
    }()
    
    lazy var shortcutButtons: [ShortcutButtonView] = {
        var views = [ShortcutButtonView]()
        let words = viewModel.shortcutWords
        words.forEach { word in
            let viewModel = ShortcutButtonViewModel()
            let view = ShortcutButtonView(viewModel: viewModel)
            viewModel.receiveWord?(word)
            view.translatesAutoresizingMaskIntoConstraints = false
            views.append(view)
        }
        return views
    }()
    
    // MARK: Associated Types
    typealias ViewModel = ShortcutPopupViewModel
    
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
        self.layer.cornerRadius = 2
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(parentStackView)
        rowStackViews.forEach { parentStackView.addArrangedSubview($0) }
        rowStackViews[0].addArrangedSubview(staticButtons[0])
        rowStackViews[1].addArrangedSubview(staticButtons[1])
        rowStackViews[1].addArrangedSubview(staticButtons[2])
        shortcutButtons.prefix(4).forEach { rowStackViews[0].addArrangedSubview($0) }
        shortcutButtons.suffix(3).forEach { rowStackViews[1].addArrangedSubview($0) }
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            parentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            parentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            parentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        viewModel.shortcutWordsSource = { [weak self] words in
            guard let self else { return }
            self.shortcutButtons.enumerated().forEach { index, view in
                view.viewModel.receiveWord?(words[index])
            }
        }
        
        shortcutButtons.enumerated().forEach { index, view in
            view.viewModel.propagateDidTap = { [weak self] in
                guard let self else { return }
                self.viewModel.receiveDidTap?(index)
            }
        }
    }
}
