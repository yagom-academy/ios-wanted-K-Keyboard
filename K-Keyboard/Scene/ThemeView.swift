//
//  ThemeView.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/03.
//

import Foundation
import UIKit

struct ThemeModel {
    let emoji: String
    let title: String
    var count: Int
}

class ThemeView: UIView {
    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .systemGray5
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .systemGray5
        return label
    }()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 7
        return stackView
    }()
    
    var backgroundTapped = UIGestureRecognizer()
    var data: ThemeModel? {
        didSet {
            guard let data = data else { return }
            configureData(data)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayouts()
        self.backgroundTapped = UIGestureRecognizer(target: self, action: #selector(buttonStackView.touchesBegan(_:with:)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureData(_ data: ThemeModel) {
        self.emojiLabel.text = data.emoji
        self.titleLabel.text = data.title
        self.countLabel.text = "\(data.count)"
    }
}

extension ThemeView: UIGestureRecognizerDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.data?.count += 1
    }
}

extension ThemeView {
    private func setupLayouts() {
        self.buttonStackView.addArrangeSubViews(self.emojiLabel, self.titleLabel, self.countLabel)
        [self.buttonStackView, self.emojiLabel, self.titleLabel, self.countLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            self.emojiLabel.widthAnchor.constraint(equalToConstant: 30),
            self.emojiLabel.heightAnchor.constraint(equalToConstant: 30),
            self.widthAnchor.constraint(equalToConstant: 60),
            self.heightAnchor.constraint(equalToConstant: 80)
//            self.buttonStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
//            self.buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
//            self.buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6),
//            self.buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6)
        ])
    }
}

