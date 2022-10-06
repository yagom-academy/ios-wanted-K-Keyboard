//
//  ThemeOpinionView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

// TODO: layout size, font size fix
class ThemeOpinionView: UIView, FirstViewStyling {
    
    var titleLabel: UILabel = UILabel()
    var horizontalStackView: UIStackView = UIStackView()
    
    var likeEmojiView = OpinionDetailView()
    var heartEmojiView = OpinionDetailView()
    var cheerUpEmojiView = OpinionDetailView()
    var wantHaveItEmojiView = OpinionDetailView()

    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ThemeOpinionView: Presentable {
    func initViewHierarchy() {
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        self.addSubview(horizontalStackView)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        horizontalStackView.addArrangedSubview(likeEmojiView)
        horizontalStackView.addArrangedSubview(heartEmojiView)
        horizontalStackView.addArrangedSubview(cheerUpEmojiView)
        horizontalStackView.addArrangedSubview(wantHaveItEmojiView)
        
        horizontalStackView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraints:[NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        constraints += [
            horizontalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            horizontalStackView.heightAnchor.constraint(equalToConstant: 64)
        ]
        
    }
    
    func configureView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        
        titleLabel.addStyles(style: themeTitleLabelStyle)
        titleLabel.attributedText = NSAttributedString(string: "이 테마를 어떻게 생각하나요?")
        
        likeEmojiView.emojiLabel.attributedText = NSAttributedString(string: "😊")
        likeEmojiView.descLabel.attributedText = NSAttributedString(string: "맘에들어요")
        likeEmojiView.countLabel.attributedText = NSAttributedString(string: "1")
        
        heartEmojiView.emojiLabel.attributedText = NSAttributedString(string: "😍")
        heartEmojiView.descLabel.attributedText = NSAttributedString(string: "심쿵했어요")
        heartEmojiView.countLabel.attributedText = NSAttributedString(string: "1")
        
        cheerUpEmojiView.emojiLabel.attributedText = NSAttributedString(string: "😉")
        cheerUpEmojiView.descLabel.attributedText = NSAttributedString(string: "응원해요")
        cheerUpEmojiView.countLabel.attributedText = NSAttributedString(string: "1")
        
        wantHaveItEmojiView.emojiLabel.attributedText = NSAttributedString(string: "🤣")
        wantHaveItEmojiView.descLabel.attributedText = NSAttributedString(string: "갖고싶어요")
        wantHaveItEmojiView.countLabel.attributedText = NSAttributedString(string: "1")
    }
    
    func bind() {
        
    }
    
    
}

class OpinionDetailView: UIView, FirstViewStyling {
    var emojiLabel: UILabel = UILabel()
    var descLabel: UILabel = UILabel()
    var countLabel: UILabel = UILabel()
    var verticalStackView: UIStackView = UIStackView()
    
    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OpinionDetailView: Presentable {
    func initViewHierarchy() {
        self.addSubview(verticalStackView)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        verticalStackView.addArrangedSubview(emojiLabel)
        verticalStackView.addArrangedSubview(descLabel)
        verticalStackView.addArrangedSubview(countLabel)
        
        verticalStackView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
    }
    
    func configureView() {
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillProportionally
        verticalStackView.spacing = 8
        
        emojiLabel.addStyles(style: emojiLabelStyle)
        emojiLabel.addStyles(style: emojiParagraphStyle)
        emojiLabel.numberOfLines = 1
        
        descLabel.addStyles(style: descLabelStyle)
        descLabel.addStyles(style: descLabelParagraphStyle)
        descLabel.numberOfLines = 1
        
        countLabel.addStyles(style: countLabelStyle)
        countLabel.addStyles(style: descLabelParagraphStyle)
        countLabel.numberOfLines = 1
    }
    
    func bind() {
        
    }
    
    
}
