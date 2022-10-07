//
//  ShortcutView.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/07.
//

import UIKit

protocol ShortcutViewDelegate: class {
    func updateShortcut()
}

class ShortcutView: UIView {

    weak var delegate: ShortcutViewDelegate?
    lazy var horizontal1 = UIStackView()
    lazy var horizontal2 = UIStackView()
    lazy var vertical: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 1

        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("coder:")
    }

}

extension ShortcutView {

    func addViews() {
        horizontal1 = makeStackView(0, 3)
        horizontal2 = makeStackView(3, 6)

        [horizontal1, horizontal2].forEach { vertical.addArrangedSubview($0) }
        self.addSubview(vertical)
    }

    func setConstraints() {
        vertical.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            vertical.topAnchor.constraint(equalTo: self.topAnchor),
            vertical.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            vertical.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            vertical.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    func makeStackView(_ left: Int, _ right: Int) -> UIStackView {
        let stackView = UIStackView()

        for i in left ..< right {
            let button = UIButton()
            button.layer.cornerRadius = 5
            button.setTitle(ShortcutData.shortcutList[i], for: .normal)
            button.backgroundColor = .darkGray
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.sizeToFit()
            button.addTarget(self, action: #selector(shortcutItemPressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.distribution = .fillEqually

        return stackView
    }

    @objc func shortcutItemPressed(_ sender: UIButton) {
        print("shortcut select")

        ShortcutData.change(sender.currentTitle!)
        delegate?.updateShortcut()
        self.isHidden = true
    }

}
