//
//  KeyboardViewController.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation
import UIKit

// MARK: - View Controller
class KeyboardViewController: UIInputViewController {
    // MARK: View Components
    lazy var nextKeyboardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        button.sizeToFit()
        return button
    }()
    
    lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        return stackView
    }()
    
    lazy var horizontalStackViews: [UIStackView] = {
        let stackViews = [UIStackView(), UIStackView(), UIStackView()]
        stackViews.forEach { stackView in
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 6
        }
        return stackViews
    }()
    
    // MARK: Associated Types
    typealias ViewModel = KeyboardViewModel
    
    
    // MARK: Properties
    var didSetupConstraints = false
    var viewModel = ViewModel()
    
    // MARK: Init
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
        buildViewHierarchy()
        self.view.setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func updateViewConstraints() {
        if !didSetupConstraints {
            self.setupConstraints()
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    
    // MARK: Setup Views
    func setupViews() {
        self.view.backgroundColor = UIColor(hex: "#D0D3DA")
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
    }
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.view.addSubview(nextKeyboardButton)
        self.view.addSubview(parentStackView)
        horizontalStackViews.forEach { parentStackView.addArrangedSubview($0) }
        for (index, lines) in viewModel.phonemes.enumerated() {
            for phoneme in lines {
                let viewModel = PhonemeViewModel(phoneme)
                let view = PhonemeView(viewModel: viewModel)
                horizontalStackViews[index].addArrangedSubview(view)
            }
        }
    }
    
    // MARK: Layout Views
    func setupConstraints() {
        nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            nextKeyboardButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        
        constraints += [
            parentStackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            parentStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ]
        
        constraints += [
            horizontalStackViews[0].leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor, constant: 3),
            horizontalStackViews[0].trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor, constant: -3),
            horizontalStackViews[0].heightAnchor.constraint(equalToConstant: 42),
        ]
        
        constraints += [
            horizontalStackViews[1].leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor, constant: 22),
            horizontalStackViews[1].trailingAnchor.constraint(equalTo: parentStackView.trailingAnchor, constant: -22),
            horizontalStackViews[1].heightAnchor.constraint(equalToConstant: 42),
        ]
        
        constraints += [
            horizontalStackViews[2].leadingAnchor.constraint(equalTo: parentStackView.leadingAnchor, constant: 61),
            horizontalStackViews[2].leadingAnchor.constraint(equalTo: parentStackView.trailingAnchor, constant: -61),
            horizontalStackViews[2].heightAnchor.constraint(equalToConstant: 42),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        
    }
    
    // MARK: Text Input
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    // MARK: Utils
    private func calculateWidth() -> CGFloat {
        let horizontalInset: CGFloat = 3 * 2
        let interSpacings: CGFloat = 6 * 9
        return UIScreen.main.bounds.width - horizontalInset - interSpacings
    }
}
