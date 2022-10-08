//
//  CardView.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/03.
//

import UIKit

class CardView: UIView {
    
    let cardImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFill
        return view
    }()

    let cardTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        label.font = UIFont(name: Const.Font.notoMedium, size: 14)
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        setConstraints()
        setShadows()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardView {
    func configure(cardImageStr: String, cardLabelStr: String) {
        cardImageView.image = UIImage(named: cardImageStr)
        cardTitleLabel.text = cardLabelStr
    }

    func addViews() {
        [cardImageView, cardTitleLabel].forEach { self.addSubview($0) }
    }

    func setConstraints() {
        [cardImageView, cardTitleLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            cardImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            cardImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            cardImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.51),
            cardImageView.heightAnchor.constraint(equalToConstant: 105),
            cardTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cardTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -9.56),
        ])
    }
    
    func setShadows() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 20
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 3.5
        self.layer.shadowOpacity = 0.3
    }
}
