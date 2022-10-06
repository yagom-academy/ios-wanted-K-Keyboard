//
//  KeyboardView.swift
//  KeyboardExtension
//
//  Created by CodeCamper on 2022/10/05.
//

import Foundation
import UIKit
// MARK: - View

class KeyboardView: UIView {
    // MARK: View Components
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
    
    lazy var spaceView: SpaceView = {
        let viewModel = SpaceViewModel()
        let view = SpaceView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var horizontalStackViews: [UIStackView] = {
        var stackViews = [UIStackView]()
        for i in 0..<4 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackViews.append(stackView)
        }
        return stackViews
    }()
    
    // MARK: Associated Types
    typealias ViewModel = KeyboardViewModel
    
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
        self.addSubview(parentStackView)
        horizontalStackViews.forEach { parentStackView.addArrangedSubview($0) }
        for (line, views) in phonemeViews.enumerated() {
            for view in views {
                horizontalStackViews[line].addArrangedSubview(view)
            }
        }
        horizontalStackViews[2].insertArrangedSubview(shiftView, at: 0)
        horizontalStackViews[2].insertArrangedSubview(deleteView, at: horizontalStackViews[2].arrangedSubviews.count)
        
        horizontalStackViews[3].addArrangedSubview(changeTypeView)
        horizontalStackViews[3].addArrangedSubview(spaceView)
        horizontalStackViews[3].addArrangedSubview(returnView)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            parentStackView.topAnchor.constraint(equalTo: self.topAnchor),
            parentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            parentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ]
        
        horizontalStackViews.forEach {
            constraints += [
                $0.heightAnchor.constraint(equalToConstant: 54),
            ]
        }
        
        let specialKeyWidth = calculateSpecialKeyViewWidth()
        constraints += [
            shiftView.widthAnchor.constraint(equalToConstant: specialKeyWidth),
        ]
        
        constraints += [
            deleteView.widthAnchor.constraint(equalToConstant: specialKeyWidth),
        ]
        
        constraints += [
            changeTypeView.widthAnchor.constraint(equalToConstant: specialKeyWidth * 2),
        ]
        
        constraints += [
            spaceView.widthAnchor.constraint(equalToConstant: calculateSpaceBarViewWidth()),
        ]
        
        constraints += [
            returnView.widthAnchor.constraint(equalToConstant: specialKeyWidth * 2),
        ]
        
        for (line, views) in phonemeViews.enumerated() {
            let width = calculatePhonemeViewWidth(line)
            for view in views {
                constraints += [
                    view.widthAnchor.constraint(equalToConstant: width)
                ]
            }
        }
    }
    
    
    // MARK: Binding
    func bind() {
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
        
        spaceView.viewModel.didTap = { [weak self] in
            guard let self else { return }
            self.viewModel.addSpace?()
        }
        
        returnView.viewModel.didTap = { [ weak self] in
            guard let self else { return }
            self.viewModel.addNewLine?()
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
    
    // MARK: Utils
    private func calculatePhonemeViewWidth(_ line: Int) -> CGFloat {
        return UIScreen.main.bounds.width / 10
    }
    
    private func calculateSpecialKeyViewWidth() -> CGFloat {
        let phonemeWidth = UIScreen.main.bounds.width / 10
        return (UIScreen.main.bounds.width - phonemeWidth * 7) / 2
    }
    
    private func calculateSpaceBarViewWidth() -> CGFloat {
        let specialKeyWidth = calculateSpecialKeyViewWidth()
        return UIScreen.main.bounds.width - specialKeyWidth * 4
    }
}
