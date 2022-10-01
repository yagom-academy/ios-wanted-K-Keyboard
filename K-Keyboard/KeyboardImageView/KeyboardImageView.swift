//
//  KeyboardView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/29.
//

import UIKit
import SwiftUI

class KeyboardImageView: UIView {
    let imageView = UIImageView(image: UIImage(named: "Keborad"))
    
    let nameLable : UILabel = {
        let title = UILabel()
        
    title.translatesAutoresizingMaskIntoConstraints = false
    title.textAlignment = .left
    title.text = "앙무"
        title.font = UIFont(name: "Bold", size: 20)
    title.textColor = .black
        return title
}()
    let copinLabel : UILabel = {
        let title = UILabel()
//        titles111.frame = CGRect(x: 0, y: 0, width: 26, height: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "코핀"
        title.font = UIFont(name: "Bold", size: 14)
        title.textColor = .systemGray2
        return title
}()
    let participationLabel : UILabel = {
        let title = UILabel()
//        titles222.frame = CGRect(x: 0, y: 0, width: 111, height: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "78명이참여했어요!"
        title.font = UIFont(name: "Bold", size: 14)
        title.textColor = .systemGray2
        //특정문자 색상 바꿈
        func changText() {
            guard let text = title.text else {return}
            let attributeString = NSMutableAttributedString(string: text)
            attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "78"))
            title.attributedText = attributeString
        }
        changText()
        return title
}()
    
    let explanationLabel : UILabel = {
        let title = UILabel()
//        titles333.frame = CGRect(x: 0, y: 0, width: 343, height: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.text = "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉"
        title.font = UIFont(name: "Bold", size: 14)
        title.textColor = .black
        return title
}()
    let informationLabel : UILabel = {
        let title = UILabel()
    
//        titles444.frame = CGRect(x: 0, y: 0, width: 343, height: 96)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .left
        title.numberOfLines = 4
        title.text = "밀당해피니스 유튜브 채널을 방문하면 \"태마명\" 이벤트 테마를 무료로 받을 수 있다구요? \n지금 바로 \'참여하기\' 버튼을 눌러새로워진 밀당해피니스 유튜브 채널을 확인해보세요!"
        title.font = UIFont(name: "Regular", size: 14)
        title.textColor = .black
        return title
}()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    private func commonInit(){
        self.backgroundColor = .white
        self.addSubview(nameLable)
        self.addSubview(copinLabel)
        self.addSubview(participationLabel)
        self.addSubview(imageView)
        self.addSubview(explanationLabel)
        self.addSubview(informationLabel)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            nameLable.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            nameLable.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            nameLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),

            
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

