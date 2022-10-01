//
//  TagView.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/01.
//

import UIKit

class TagView: UIView {
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    init() {
        super.init(frame: .zero)
        configureUI()
        setUpLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        self.textLabel.text = title
    }

    private func configureUI() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 15
        self.heightAnchor.constraint(equalToConstant: 10).isActive = true
        self.clipsToBounds = true
    }

    private func setUpLayouts() {
        self.addSubview(self.textLabel)
        self.textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 3).isActive = true
        self.textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 3).isActive = true
        self.textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -3).isActive = true
        self.textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -3).isActive = true
    }

}
