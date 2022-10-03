//
//  FifthSectionHeaderView.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/04.
//

import UIKit

class FifthSectionHeaderView: UITableViewHeaderFooterView {
    static let identifier = "fifthSectionHeaderView"

    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "구매 리뷰"
        label.font = UIFont(name: Const.Font.notoBold, size: 16)
        label.textAlignment = .center

        return label
    }()

    let reviewCount: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont(name: Const.Font.notoBold, size: 16)
        label.textColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)

        return label
    }()

    let exclamationMark: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "exclam")

        return imageView
    }()

    let exclamationLabel: UILabel = {
        let label = UILabel()
        label.text = "테마를 구매해야 리뷰를 남길 수 있어요."
        label.font = UIFont(name: Const.Font.notoRegular, size: 14)
        label.textColor = UIColor(red: 0.314, green: 0.325, blue: 0.361, alpha: 1)

        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        addViews()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FifthSectionHeaderView {
    func addViews() {
        [reviewLabel, reviewCount, exclamationMark, exclamationLabel].forEach { contentView.addSubview($0) }
    }

    func setConstraints() {
        [reviewLabel, reviewCount, exclamationMark, exclamationLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            reviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reviewCount.topAnchor.constraint(equalTo: contentView.topAnchor),
            reviewCount.leadingAnchor.constraint(equalTo: reviewLabel.trailingAnchor, constant: 8),
//            exclamationMark.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 18.33),
            exclamationMark.centerYAnchor.constraint(equalTo: exclamationLabel.centerYAnchor),
            exclamationMark.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17.33),
            exclamationMark.widthAnchor.constraint(equalToConstant: 13.33),
            exclamationMark.heightAnchor.constraint(equalTo: exclamationMark.widthAnchor, multiplier: 1),
            exclamationLabel.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 13),
            exclamationLabel.leadingAnchor.constraint(equalTo: exclamationMark.trailingAnchor, constant: 11.33),
            exclamationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13)
        ])

    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct HeaderView: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = FifthSectionHeaderView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
