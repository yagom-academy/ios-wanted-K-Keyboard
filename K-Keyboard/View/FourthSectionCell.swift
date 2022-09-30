//
//  Section4Cell.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/09/30.
//

import UIKit

class FourthSectionCell: UITableViewCell {
    static let id = "section4"

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "이 테마를 어떻게 생각하나요?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    let adImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .gray
        return imageView
    }()

    let vertical1: UIStackView = {
        let emoji = UILabel()
        emoji.text = "😊"
        emoji.font = UIFont.systemFont(ofSize: 30)

        let label1 = UILabel()
        label1.text = "맘에들어요"
        label1.font = UIFont.systemFont(ofSize: 12)
        label1.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)

        let label2 = UILabel()
        label2.text = "0"
        label2.font = UIFont.systemFont(ofSize: 10)
        label2.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)

        let stackView = UIStackView(arrangedSubviews: [emoji, label1, label2])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.setCustomSpacing(8, after: emoji)
        stackView.alignment = .center

        return stackView
    }()

    let vertical2: UIStackView = {
        let emoji = UILabel()
        emoji.text = "😍"
        emoji.font = UIFont.systemFont(ofSize: 30)

        let label1 = UILabel()
        label1.text = "심쿵했어요"
        label1.font = UIFont.systemFont(ofSize: 12)
        label1.textColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)

        let label2 = UILabel()
        label2.text = "0"
        label2.font = UIFont.systemFont(ofSize: 10)
        label2.textColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)

        let stackView = UIStackView(arrangedSubviews: [emoji, label1, label2])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.setCustomSpacing(8, after: emoji)
        stackView.alignment = .center

        return stackView
    }()

    let vertical3: UIStackView = {
        let emoji = UILabel()
        emoji.text = "😉"
        emoji.font = UIFont.systemFont(ofSize: 30)

        let label1 = UILabel()
        label1.text = "응원해요"
        label1.font = UIFont.systemFont(ofSize: 12)
        label1.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)

        let label2 = UILabel()
        label2.text = "0"
        label2.font = UIFont.systemFont(ofSize: 10)
        label2.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)

        let stackView = UIStackView(arrangedSubviews: [emoji, label1, label2])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.setCustomSpacing(8, after: emoji)
        stackView.alignment = .center

        return stackView
    }()

    let vertical4: UIStackView = {
        let emoji = UILabel()
        emoji.text = "🤣"
        emoji.font = UIFont.systemFont(ofSize: 30)

        let label1 = UILabel()
        label1.text = "갖고싶어요"
        label1.font = UIFont.systemFont(ofSize: 12)
        label1.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)

        let label2 = UILabel()
        label2.text = "0"
        label2.font = UIFont.systemFont(ofSize: 10)
        label2.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)

        let stackView = UIStackView(arrangedSubviews: [emoji, label1, label2])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.setCustomSpacing(8, after: emoji)
        stackView.alignment = .center

        return stackView
    }()

    let horizontal: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 38
        stackView.distribution = .fill
        stackView.alignment = .center
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addViews()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FourthSectionCell {
    func addViews() {
        [vertical1, vertical2, vertical3, vertical4].forEach { horizontal.addArrangedSubview($0) }
        [titleLabel, horizontal, adImage].forEach { contentView.addSubview($0) }
    }

    func setConstraints() {
        [titleLabel, horizontal, adImage].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontal.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            horizontal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            horizontal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            adImage.topAnchor.constraint(equalTo: horizontal.bottomAnchor, constant: 50),
            adImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            adImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            adImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -48),
            adImage.heightAnchor.constraint(equalToConstant: 87)
        ])
    }
}
