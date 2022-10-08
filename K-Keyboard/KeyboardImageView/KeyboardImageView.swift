//
//  KeyboardView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/29.
//

import UIKit
import SwiftUI

class KeyboardImageView: UIView {
    let imageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Keborad"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let nameLable : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "앙무"
        title.font = .appleSDGothicNeo(weight: .bold, size: 20)
        title.textColor = UIColor(hex: "#42444C", alpha: 1)
        return title
    }()
    let copinLabel : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "코핀"
        title.font = .appleSDGothicNeo(weight: .medium, size: 14)
        title.textColor = UIColor(hex: "#919299", alpha: 1)
        return title
    }()
    let participationLabel : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "78명이참여했어요!"
        title.font = .appleSDGothicNeo(weight: .medium, size: 14)
        title.textColor = UIColor(hex: "#FF417D",alpha: 1)
        let attributeString = NSMutableAttributedString(string:  title.text ?? "")
        attributeString.addAttribute(.foregroundColor, value: UIColor(hex: "#919299", alpha: 1), range: ( title.text! as NSString).range(of: "명이참여했어요!"))
        title.attributedText = attributeString
        return title
    }()
    let explanationLabel : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉"
        title.font = .appleSDGothicNeo(weight: .bold, size: 14)
        title.textColor = UIColor(hex: "#42444C",alpha: 1)
        return title
    }()
    let informationLabel : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.numberOfLines = 4
        title.text = "밀당해피니스 유튜브 채널을 방문하면 \"태마명\" 이벤트 테마를 무료로 받을 수 있다구요? \n지금 바로 \'참여하기\' 버튼을 눌러 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!"
        title.font = .appleSDGothicNeo(weight: .regular, size: 14)
        title.textColor = UIColor(hex: "#4B4E57")
        return title
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        self.backgroundColor = .white
        self.addSubview(nameLable)
        self.addSubview(copinLabel)
        self.addSubview(participationLabel)
        self.addSubview(imageView)
        self.addSubview(explanationLabel)
        self.addSubview(informationLabel)
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            nameLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            nameLable.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLable.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            
            copinLabel.topAnchor.constraint(equalTo: nameLable.bottomAnchor,constant: 4),
            copinLabel.leadingAnchor.constraint(equalTo: nameLable.leadingAnchor),
            copinLabel.trailingAnchor.constraint(equalTo: nameLable.trailingAnchor),
            copinLabel.heightAnchor.constraint(equalToConstant: 20),
            
            participationLabel.topAnchor.constraint(equalTo: copinLabel.bottomAnchor,constant: 16),
            participationLabel.leadingAnchor.constraint(equalTo:copinLabel.leadingAnchor),
            participationLabel.trailingAnchor.constraint(equalTo: copinLabel.trailingAnchor),
            participationLabel.heightAnchor.constraint(equalToConstant: 28),
            
            explanationLabel.topAnchor.constraint(equalTo: participationLabel.bottomAnchor,constant: 40),
            explanationLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            informationLabel.topAnchor.constraint(equalTo: explanationLabel.bottomAnchor,constant: 8),
            informationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            informationLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            informationLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
#if canImport(SwiftUI) && DEBUG
struct PreviewViewController<View: UIView> : UIViewRepresentable {
    
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
struct KeyboardImageViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        PreviewViewController {
            let view = KeyboardImageView()
            return view
        }.previewLayout(.fixed(width: 1000, height: 1000))
    }
}

#endif

