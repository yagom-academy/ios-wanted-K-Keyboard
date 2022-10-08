//
//  CommentView.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/03.
//

import UIKit

class CommentView: UIView {

    let nickName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Const.Font.notoMedium, size: 12)

        return label
    }()

    let comment: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Const.Font.notoRegular, size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor(red: 0.949, green: 0.953, blue: 0.969, alpha: 1)
        self.layer.cornerRadius = 20

        addViews()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CommentView {
    func configure(nickNameStr: String, commentStr: String) {
        nickName.text = nickNameStr
        comment.text = commentStr
    }

    func addViews() {
        [nickName, comment].forEach { self.addSubview($0) }
    }

    func setConstraints() {
        [nickName, comment].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            nickName.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            nickName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            nickName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            comment.topAnchor.constraint(equalTo: nickName.bottomAnchor),
            comment.leadingAnchor.constraint(equalTo: nickName.leadingAnchor),
            comment.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            comment.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6)
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct CommentViewPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = CommentView()
            view.nickName.text = "크리에이터명"
            view.comment.text = "구매해주셔서 감사"
            return view
        }.previewLayout(.fixed(width: 343, height: 544))
    }
}
#endif
