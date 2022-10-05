//
//  ReviewCellView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/06.
//

import UIKit
import SwiftUI

class ReviewCellView: UIView {

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
            creatorLabel.heightAnchor.constraint(equalToConstant: 20)
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
        
        profileImageView.image = UIImage(named: "img_profile dummy 3")
        creatorLabel.text = "크리에이터"
        
        nickNameLabel.text = "크리에이터명"
        commentLabel.text = "코멘트코멘트코멘트코멘트asdfasdfdasfasdfasdfasdfsdafasdf"
        commentLabel.numberOfLines = 0
        
        timeLabel.text = "1일"
        reportButton.setTitle("신고", for: .normal)
        reportButton.setTitleColor(.black, for: .normal)
        
        bubbleView.layer.backgroundColor = UIColor(red: 0.949, green: 0.953, blue: 0.969, alpha: 1).cgColor
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
