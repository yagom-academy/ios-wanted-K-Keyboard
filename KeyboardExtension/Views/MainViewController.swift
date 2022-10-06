//
//  KeyboardViewController.swift
//  KeyboardExtension
//
//  Created by 한경수 on 2022/10/01.
//

import Foundation
import UIKit

// MARK: - View Controller
class MainViewController: UIInputViewController {
    // MARK: View Components
    lazy var nextKeyboardButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        button.sizeToFit()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var toolBarView: ToolBarView = {
        let viewModel = ToolBarViewModel()
        let view = ToolBarView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var keyboardView: KeyboardView = {
        let viewModel = KeyboardViewModel()
        let view = KeyboardView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var frequentlyUsedWordsView: FrequentlyUsedWordsMainView = {
        let viewModel = FrequentlyUsedWordsMainViewModel()
        let view = FrequentlyUsedWordsMainView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Associated Types
    typealias ViewModel = MainViewModel
    
    
    // MARK: Properties
    var didSetupConstraints = false
    var viewModel = ViewModel()
    
    // MARK: Init
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
        buildViewHierarchy()
        self.view.setNeedsUpdateConstraints()
        bind()
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
        
        keyboardView.isHidden = false
        frequentlyUsedWordsView.isHidden = true
    }
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.view.addSubview(nextKeyboardButton)
        self.view.addSubview(toolBarView)
        self.view.addSubview(keyboardView)
        self.view.addSubview(frequentlyUsedWordsView)
    }
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            self.view.heightAnchor.constraint(equalToConstant: 244),
        ]
        
        constraints += [
            nextKeyboardButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]
        
        constraints += [
            toolBarView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            toolBarView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            toolBarView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ]
        
        constraints += [
            keyboardView.topAnchor.constraint(equalTo: toolBarView.bottomAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ]
        
        constraints += [
            frequentlyUsedWordsView.topAnchor.constraint(equalTo: toolBarView.bottomAnchor),
            frequentlyUsedWordsView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            frequentlyUsedWordsView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            frequentlyUsedWordsView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        ]
    }
    
    
    // MARK: Binding
    func bind() {
        keyboardView.viewModel.propagateText = { [weak self] nextText in
            guard let self else { return }
            self.viewModel.receiveText?(nextText)
        }
        
        toolBarView.viewModel.propagateSelected = { [weak self] selected in
            guard let self else { return }
            self.viewModel.receiveSelected?(selected)
        }
        
        frequentlyUsedWordsView.viewModel.propagateSelectedWord = { [weak self] word in
            guard let self else { return }
            let text = self.viewModel.text + word
            self.viewModel.receiveText?(text)
            self.keyboardView.viewModel.textContextDidChange?(text)
        }
        
        viewModel.selectedSource = { [weak self] selected in
            guard let self else { return }
            if selected == 2 {
                self.keyboardView.isHidden = true
                self.frequentlyUsedWordsView.isHidden = false
            } else {
                self.keyboardView.isHidden = false
                self.frequentlyUsedWordsView.isHidden = true
            }
        }
        
        viewModel.textSource = { [weak self] nextText in
            guard let self else { return }
            if self.textDocumentProxy.selectedText == nil,
               let context = self.textDocumentProxy.documentContextBeforeInput,
               context.count > 2 {
                let maskedLength = min(nextText.count, context.count) - 1
                self.textDocumentProxy.removeLast(context.count - maskedLength)
                self.textDocumentProxy.insertText(String(nextText.suffix(nextText.count-maskedLength)))
            } else {
                self.textDocumentProxy.clearAll()
                self.textDocumentProxy.insertText(nextText)
            }
        }
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
        keyboardView.viewModel.textContextDidChange?(textDocumentProxy.documentContextBeforeInput ?? "")
    }
}
