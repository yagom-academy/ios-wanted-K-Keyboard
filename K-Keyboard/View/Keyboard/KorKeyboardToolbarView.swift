//
//  KorKeyboardToolbarView.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/07.
//

import UIKit

protocol KorKeyboardToolbarViewDelegate: class {
    func favoritesButtonPressed()
}

class KorKeyboardToolbarView: UIView {
    
    lazy var toolbarStackView = UIStackView()
    weak var delegate: KorKeyboardToolbarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        toolbarStackView = makeStackView()
        
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder:")
    }
}

extension KorKeyboardToolbarView {
    func addViews() {
        [toolbarStackView].forEach { self.addSubview($0) }
    }
    
    func setConstraints() {
        [toolbarStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            toolbarStackView.topAnchor.constraint(equalTo: self.topAnchor),
            toolbarStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            toolbarStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            toolbarStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension KorKeyboardToolbarView {
    func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        
        for idx in 0..<6 {
            // 자주 쓰는 말 버튼
            if idx == 2 {
                let button = makeButton(imageStr: "line.3.horizontal")
                stackView.addArrangedSubview(button)
                button.addTarget(self, action: #selector(favoritesButtonPressed), for: .touchUpInside)
            } else {
                let button = makeButton(imageStr: "play")
                stackView.addArrangedSubview(button)
            }
        }
        
        return stackView
    }
    
    func makeButton(imageStr: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: imageStr), for: .normal)
        button.contentMode = .scaleAspectFit
        button.tintColor = .black
        button.layer.cornerRadius = 5
        
        return button
    }
}

extension KorKeyboardToolbarView {
    @objc func favoritesButtonPressed() {
        delegate?.favoritesButtonPressed()
    }
    
}
