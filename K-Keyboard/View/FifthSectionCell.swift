//
//  FifthSectionCell.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/03.
//

import UIKit

class FifthSectionCell: UITableViewCell {
    static let identifier = "section5"

    let profile: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        return imageView
    }()

    let creatorLabel: UILabel = {
        let label = UILabel()
        label.layer.backgroundColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1).cgColor
        label.layer.cornerRadius = 10
        label.text = "크리에이터"
        label.textAlignment = .center
        label.font = UIFont(name: Const.Font.notoMedium, size: 10)
        label.textColor = .white

        return label
    }()

    let commentView = CommentView()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Const.Font.notoRegular, size: 12)
        label.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
        label.numberOfLines = 0
        label.sizeToFit()

        return label
    }()

    let reportButton: UIButton = {
        let button = UIButton()
        button.setTitle("신고", for: .normal)
        button.setTitleColor(UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
                             , for: .normal)
        button.titleLabel?.font = UIFont(name: Const.Font.notoBold, size: 12)

        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        commentView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width, height: contentView.bounds.height)
        commentView.configure(nickNameStr: "크리에이터명", commentStr: "구매해\n주셔서 감사ㄱㅅㄱㅅㄱㅅㄱㅅㄱ")
        timeLabel.text = "1일"

        self.backgroundColor = nil

        addViews()
        setConstraints()

//        creatorLabel.isHidden = true
//        reportButton.isHidden = true
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FifthSectionCell {
    func addViews() {
        [profile, creatorLabel, commentView, timeLabel, reportButton].forEach { contentView.addSubview($0) }
    }

    func setConstraints() {
        [profile, creatorLabel, commentView, timeLabel, reportButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        // FIXME: - 간격 조정하기
        let timeBottom = timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        timeBottom.priority = UILayoutPriority(999)

        NSLayoutConstraint.activate([
            profile.topAnchor.constraint(equalTo: contentView.topAnchor),
            profile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            profile.widthAnchor.constraint(equalToConstant: 48),
            profile.heightAnchor.constraint(equalTo: profile.widthAnchor, multiplier: 1),
            creatorLabel.topAnchor.constraint(equalTo: profile.topAnchor, constant: 38),
            creatorLabel.centerXAnchor.constraint(equalTo: profile.centerXAnchor),
            creatorLabel.widthAnchor.constraint(equalToConstant: 58),
            creatorLabel.heightAnchor.constraint(equalToConstant: 20),
            commentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            commentView.leadingAnchor.constraint(equalTo: profile.trailingAnchor, constant: 16),
            commentView.widthAnchor.constraint(lessThanOrEqualToConstant: contentView.frame.width - 108),
            timeLabel.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 6),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 98),
//            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
            timeBottom,
            reportButton.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 6),
            reportButton.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 12),
            reportButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor)
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct FifthCellPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = FifthSectionCell()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
