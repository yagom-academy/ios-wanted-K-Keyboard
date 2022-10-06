//
//  ReviewCellView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/06.
//

import UIKit
import SwiftUI

class ReviewCellView: UIView, FirstViewStyling {

    var profileImageView = UIImageView()
    var creatorLabel = UILabel()
    
    var bubbleView = UIView()
    var nickNameLabel = UILabel()
    var commentLabel = UILabel()
    
    var timeLabel = UILabel()
    var reportButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

// TODO: 디자인 수정 스타일러블 추가
extension ReviewCellView: Presentable {
    func initViewHierarchy() {
        self.addSubview(profileImageView)
        self.addSubview(creatorLabel)
        self.addSubview(bubbleView)
        self.addSubview(timeLabel)
        self.addSubview(reportButton)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        bubbleView.addSubview(nickNameLabel)
        bubbleView.addSubview(commentLabel)
        
        bubbleView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 22),
            profileImageView.heightAnchor.constraint(equalToConstant: 48),
            profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor)
        ]
        
        constraint += [
            creatorLabel.centerYAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            creatorLabel.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            creatorLabel.heightAnchor.constraint(equalToConstant: 20),
            creatorLabel.widthAnchor.constraint(equalToConstant: 58)
        ]
        
        constraint += [
            bubbleView.topAnchor.constraint(equalTo: profileImageView.topAnchor),
            bubbleView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            bubbleView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -16),
            bubbleView.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -8)
        ]
        
        constraint += [
            nickNameLabel.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 6),
            nickNameLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 12),
            nickNameLabel.trailingAnchor.constraint(lessThanOrEqualTo: bubbleView.trailingAnchor, constant: -12),
            nickNameLabel.heightAnchor.constraint(equalToConstant: 18)
        ]
        
        constraint += [
            commentLabel.topAnchor.constraint(equalTo: nickNameLabel.bottomAnchor, constant: 4),
            commentLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 12),
            commentLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -4),
            commentLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -6)
        ]
        
        constraint += [
            timeLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 28),
            timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            timeLabel.heightAnchor.constraint(equalToConstant: 18)
        ]
        
        constraint += [
            reportButton.centerYAnchor.constraint(equalTo: timeLabel.centerYAnchor),
            reportButton.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 12)
        ]
        
    }
    
    func configureView() {
        self.backgroundColor = .white
        
        profileImageView.addStyles(style: profileImageViewStyle)
        
        creatorLabel.addStyles(style: creatorLabelStyle)
        
        nickNameLabel.addStyles(style: nickNameLabelStyle)
        
        // TODO: 더미 모델 데이터 받음에 따라 크리에이터레이블 히든 처리, 작성자이름 설정
        nickNameLabel.attributedText = NSAttributedString(string: "작성자이름")
        
        commentLabel.addStyles(style: commentLabelStyle)
        commentLabel.attributedText = NSAttributedString(string: "코멘트코멘트코멘트코멘트asdfasdfdasfasdfasdfasdfsdafasdsdfsdfsdfsdfsdfsdfsdfsdfsdff")
        
        timeLabel.addStyles(style: timeLabelStyle)
        
        reportButton.addStyles(style: reportButtonStyle)
        
        bubbleView.addStyles(style: bubbleViewStyle)
    }
    
    func bind() {
        
    }
    
    
}

#if canImport(SwiftUI) && DEBUG
struct ReviewCellViewPreview<View: UIView>: UIViewRepresentable {
    
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
#endif

#if canImport(SwiftUI) && DEBUG
struct ReviewCellViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        ReviewCellViewPreview {
            let view = ReviewCellView()
            return view
        }.previewLayout(.fixed(width: 120, height: 120))
    }
}

#endif
