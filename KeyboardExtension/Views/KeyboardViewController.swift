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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var phonemeViews: [[PhonemeView]] = {
        var result = [[PhonemeView]]()
        for (index, lines) in viewModel.phonemes.enumerated() {
            var phonemeLine = [PhonemeView]()
            for phoneme in lines {
                let viewModel = PhonemeViewModel(phoneme)
                let view = PhonemeView(viewModel: viewModel)
                view.translatesAutoresizingMaskIntoConstraints = false
                phonemeLine.append(view)
            }
            result.append(phonemeLine)
        }
        return result
    }()
    
    lazy var shiftView: ShiftView = {
        let viewModel = ShiftViewModel()
        let view = ShiftView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var deleteView: DeleteView = {
        let viewModel = DeleteViewModel()
        let view = DeleteView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var changeTypeView: ChangeTypeView = ChangeTypeView()
    
    lazy var returnView: ReturnView = {
        let viewModel = ReturnViewModel()
        let view = ReturnView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var horizontalStackViews: [UIStackView] = {
        var stackViews = [UIStackView]()
        for i in 0..<4 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.spacing = 6
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackViews.append(stackView)
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
    }
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.view.addSubview(nextKeyboardButton)
        self.view.addSubview(parentStackView)
        horizontalStackViews.forEach { parentStackView.addArrangedSubview($0) }
        for (line, views) in phonemeViews.enumerated() {
            for view in views {
                horizontalStackViews[line].addArrangedSubview(view)
            }
        }
        horizontalStackViews[2].insertArrangedSubview(shiftView, at: 0)
        horizontalStackViews[2].insertArrangedSubview(deleteView, at: horizontalStackViews[2].arrangedSubviews.count)
        horizontalStackViews[2].setCustomSpacing(14, after: shiftView)
        horizontalStackViews[2].setCustomSpacing(14, before: deleteView)
        
        horizontalStackViews[3].insertArrangedSubview(changeTypeView, at: 0)
        horizontalStackViews[3].insertArrangedSubview(returnView, at: horizontalStackViews[3].arrangedSubviews.count)
    }
    
    // MARK: Layout Views
    func setupConstraints() {
        
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
        
        horizontalStackViews.forEach {
            constraints += [
                $0.heightAnchor.constraint(equalToConstant: 42),
            ]
        }
        
        constraints += [
            shiftView.widthAnchor.constraint(equalToConstant: 44),
        ]
        
        constraints += [
            deleteView.widthAnchor.constraint(equalToConstant: 44),
        ]
        
        constraints += [
            changeTypeView.widthAnchor.constraint(equalToConstant: 91),
        ]
        
        constraints += [
            returnView.widthAnchor.constraint(equalToConstant: 91),
        ]
        
        for (line, views) in phonemeViews.enumerated() {
            let width = calculateWidth(line)
            for view in views {
                constraints += [
                    view.widthAnchor.constraint(equalToConstant: width)
                ]
            }
        }
    }
    
    
    // MARK: Binding
    func bind() {
        viewModel.textSource = { [weak self] prefixText, syllables in
            guard let self else { return }
            var nextText = prefixText
            syllables.compactMap { $0.unicode }.forEach { nextText += String($0) }
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
        
        viewModel.phonemesSource = { [weak self] phonemes in
            guard let self else { return }
            for (row, views) in self.phonemeViews.enumerated() {
                for (column, view) in views.enumerated() {
                    let phoneme = phonemes[row][column]
                    view.viewModel.receivePhoneme?(phoneme)
                }
            }
        }
        
        viewModel.shiftActivatedSource = { [weak self] activated in
            guard let self else { return }
            self.shiftView.viewModel.receiveActivated?(activated)
        }
        
        shiftView.viewModel.didTap = { [weak self] in
            guard let self else { return }
            self.viewModel.toggleShift?()
        }
        
        deleteView.viewModel.didTap = { [weak self] in
            guard let self else { return }
            self.viewModel.removePhoneme?()
        }
        
        returnView.viewModel.didTap = { [ weak self] in
            guard let self else { return }
            self.textDocumentProxy.insertText("\n")
            self.viewModel.addNewLine?(self.textDocumentProxy.documentContextBeforeInput ?? "")
        }
        
        phonemeViews.forEach { views in
            views.forEach {
                bind(phonemeViewModel: $0.viewModel)
            }
        }
    }
    
    func bind(phonemeViewModel viewModel: PhonemeViewModel) {
        viewModel.propagateTap = { [weak self] phoneme in
            guard let self else { return }
            self.viewModel.addPhoneme?(phoneme)
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
        viewModel.textContextDidChange?(textDocumentProxy.documentContextBeforeInput ?? "")
    }
    
    // MARK: Utils
    private func calculateWidth(_ line: Int) -> CGFloat {
        let horizontalInset: CGFloat = getHorizontalInset(line)
        let interSpacings: CGFloat = getInterSpacings(line)
        return (UIScreen.main.bounds.width - horizontalInset - interSpacings) / getNumberOfPhonemeViews(line)
    }
    
    private func getHorizontalInset(_ line: Int) -> CGFloat {
        switch line {
        case 0: return 3 * 2
        case 1: return 22 * 2
        case 2: return 61 * 2
        case 3: return 100 * 2
        default: return 0
        }
    }
    
    private func getInterSpacings(_ line: Int) -> CGFloat {
        return 6 * (getNumberOfPhonemeViews(line) - 1)
    }
    
    private func getNumberOfPhonemeViews(_ line: Int) -> CGFloat {
        switch line {
        case 0: return 10
        case 1: return 9
        case 2: return 7
        case 3: return 1
        default: return 0
        }
    }
}
