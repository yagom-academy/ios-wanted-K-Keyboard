//
//  KorKeyboardView.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/05.
//

import UIKit

class KorKeyboardView: UIView {
    static let row1 = "ㅂㅈㄷㄱㅅㅛㅕㅑㅐㅔ".map { String($0) }
    static let row2 = "ㅁㄴㅇㄹㅎㅗㅓㅏㅣ".map { String($0) }
    static let row3 = "ㅋㅌㅊㅍㅠㅜㅡ".map { String($0) }

    let horizontal1: UIStackView = {
        let stackView = UIStackView()

        for char in row1 {
            let button = UIButton()
            button.layer.cornerRadius = 5
            button.setTitle(char, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(korButtonPressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)

        return stackView
    }()

    let horizontal2: UIStackView = {
        let stackView = UIStackView()

        for char in row2 {
            let button = UIButton()
            button.layer.cornerRadius = 5
            button.setTitle(char, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(korButtonPressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        return stackView
    }()

    let horizontal3: UIStackView = {
        let stackView = UIStackView()

        let shift: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "shift"), for: .normal)
            button.layer.cornerRadius = 5
            button.backgroundColor = .white
            button.tintColor = .black
            button.contentMode = .scaleAspectFit
            return button
        }()

        let delete: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "delete.backward"), for: .normal)
            button.layer.cornerRadius = 5
            button.backgroundColor = .white
            button.tintColor = .black
            button.contentMode = .scaleAspectFit

            return button
        }()

        stackView.addArrangedSubview(shift)

        for char in row3 {
            let button = UIButton()
            button.layer.cornerRadius = 5
            button.setTitle(char, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(korButtonPressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.addArrangedSubview(delete)

        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)

        stackView.setCustomSpacing(16, after: shift)
        stackView.setCustomSpacing(16, after: stackView.arrangedSubviews[row3.count])

        return stackView
    }()

    let spaceBar: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.setTitle("space", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let returnButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.setTitle("return", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension KorKeyboardView {
    func addViews() {
        [horizontal1, horizontal2, horizontal3, spaceBar, returnButton].forEach { self.addSubview($0) }
    }

    func setConstraints() {
        [horizontal1, horizontal2, horizontal3, spaceBar, returnButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            horizontal1.topAnchor.constraint(equalTo: self.topAnchor),
            horizontal1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontal1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontal2.topAnchor.constraint(equalTo: horizontal1.bottomAnchor, constant: 12),
            horizontal2.leadingAnchor.constraint(equalTo: horizontal1.leadingAnchor),
            horizontal2.trailingAnchor.constraint(equalTo: horizontal1.trailingAnchor),
            horizontal3.topAnchor.constraint(equalTo: horizontal2.bottomAnchor, constant: 12),
            horizontal3.leadingAnchor.constraint(equalTo: horizontal1.leadingAnchor),
            horizontal3.trailingAnchor.constraint(equalTo: horizontal1.trailingAnchor),
            spaceBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            spaceBar.topAnchor.constraint(equalTo: horizontal3.bottomAnchor, constant: 12),
            spaceBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            returnButton.leadingAnchor.constraint(equalTo: spaceBar.trailingAnchor, constant: 6),
            returnButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            returnButton.bottomAnchor.constraint(equalTo: spaceBar.bottomAnchor),
            returnButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }

    @objc func korButtonPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
    }
}
