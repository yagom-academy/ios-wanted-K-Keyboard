//
//  PopupView.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/04.
//

import UIKit

class PopupView: UIView {
    var gemCount = 5
    var price = 1100

    var delegate: PopupViewDelegate?

    let themeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "01")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "N젬이 부족해요\n빠르게 충전해 보세요!"
        label.font = UIFont(name: Const.Font.notoBold, size: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center

        return label
    }()

    let gemLabel: UILabel = {
        let label = UILabel()
        label.text = "젬 수량"
        label.font = UIFont(name: Const.Font.notoBold, size: 14)

        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "결제 금액"
        label.font = UIFont(name: Const.Font.notoBold, size: 14)

        return label
    }()

    let buyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "pinkButton"), for: .normal)
        button.setTitle("충전하고 바로 사용하기", for: .normal)
        button.titleLabel?.baselineAdjustment = .alignCenters
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont(name: Const.Font.notoBold, size: 14)

        return button
    }()
    let gemImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gem2")
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    lazy var gemCountLabel: UILabel = {
        let label = UILabel()
        label.text = String(gemCount)
        label.font = UIFont(name: Const.Font.notoBold, size: 14)
        label.textColor = UIColor(red: 0.49, green: 0.788, blue: 0.988, alpha: 1)

        return label
    }()

    lazy var wonLabel: UILabel = {
        let label = UILabel()
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        label.text = "₩ " + formatter.string(for: price)!
        label.font = UIFont(name: Const.Font.notoMedium, size: 14)
        label.textColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)

        return label
    }()

    let leftButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.tintColor = UIColor(red: 0.667, green: 0.671, blue: 0.702, alpha: 1)

        return button
    }()

    let rightButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.tintColor = UIColor(red: 0.667, green: 0.671, blue: 0.702, alpha: 1)

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white
        self.layer.cornerRadius = 24

        addViews()
        setConstraints()
        setActions()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PopupView {
    func addViews() {
        [themeImage, infoLabel, gemLabel, priceLabel, leftButton, rightButton, buyButton, gemImage, gemCountLabel, wonLabel].forEach {
            self.addSubview($0)
        }
    }

    func setConstraints() {
            [themeImage, infoLabel, gemLabel, priceLabel, leftButton, rightButton, buyButton, gemImage, gemCountLabel, wonLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            themeImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            themeImage.widthAnchor.constraint(equalToConstant: 100),
            themeImage.heightAnchor.constraint(equalTo: themeImage.widthAnchor, multiplier: 1),
            themeImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: themeImage.bottomAnchor, constant: 8),
            infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            gemLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            gemLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            priceLabel.topAnchor.constraint(equalTo: gemLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: gemLabel.leadingAnchor),
            rightButton.centerYAnchor.constraint(equalTo: gemLabel.centerYAnchor),
            rightButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -39),
            gemCountLabel.trailingAnchor.constraint(equalTo: rightButton.leadingAnchor, constant: -21),
            gemCountLabel.centerYAnchor.constraint(equalTo: rightButton.centerYAnchor),
            gemImage.trailingAnchor.constraint(equalTo: gemCountLabel.leadingAnchor, constant: -4),
            gemImage.centerYAnchor.constraint(equalTo: gemCountLabel.centerYAnchor),
            leftButton.centerYAnchor.constraint(equalTo: gemLabel.centerYAnchor),
            leftButton.trailingAnchor.constraint(equalTo: gemImage.leadingAnchor, constant: -21),
            wonLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            wonLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -62),
            buyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            buyButton.widthAnchor.constraint(equalToConstant: 200),
            buyButton.heightAnchor.constraint(equalToConstant: 42)
        ])
    }

    func setActions() {
        buyButton.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
    }

    @objc func buyButtonPressed(_ sender: UIButton) {
        self.delegate?.buyAndUseButtonPressed()
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct PopupViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = PopupView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
