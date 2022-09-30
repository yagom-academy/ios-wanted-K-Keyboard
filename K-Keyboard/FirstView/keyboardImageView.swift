//
//  KeyboardView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/29.
//

import UIKit
import SwiftUI

class keyboardImageView: UIView {
    let imageView = UIImageView(image: UIImage(named: "Keborad"))
    
    let titles : UILabel = {
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 0, width: 37, height: 28)
    title.translatesAutoresizingMaskIntoConstraints = false
    title.textAlignment = .center
    title.text = "앙무"
        title.font = UIFont(name: "Bold", size: 20)
    title.textColor = .black
        return title
}()
    let titles111 : UILabel = {
        let titles111 = UILabel()
        titles111.frame = CGRect(x: 0, y: 0, width: 26, height: 20)
        titles111.translatesAutoresizingMaskIntoConstraints = false
        titles111.textAlignment = .center
        titles111.text = "코핀"
        titles111.font = UIFont(name: "Bold", size: 14)
        titles111.textColor = .systemGray2
        return titles111
}()
    let titles222 : UILabel = {
        let titles222 = UILabel()
        titles222.frame = CGRect(x: 0, y: 0, width: 111, height: 20)
        titles222.translatesAutoresizingMaskIntoConstraints = false
        titles222.textAlignment = .center
        titles222.text = "78명이참여했어요!"
        titles222.font = UIFont(name: "Bold", size: 14)
        titles222.textColor = .systemGray2
        //특정문자 색상 바꿈
        func changText() {
            guard let text = titles222.text else {return}
            let attributeString = NSMutableAttributedString(string: text)
            attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (text as NSString).range(of: "78"))
            titles222.attributedText = attributeString
        }
        changText()
        return titles222
}()
    
    let titles333 : UILabel = {
        let titles333 = UILabel()
        titles333.frame = CGRect(x: 0, y: 0, width: 343, height: 24)
        titles333.translatesAutoresizingMaskIntoConstraints = false
        titles333.textAlignment = .center
        titles333.text = "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉"
        titles333.font = UIFont(name: "Bold", size: 14)
        titles333.textColor = .black
        return titles333
}()
    let titles444 : UILabel = {
        let titles444 = UILabel()
    
        titles444.frame = CGRect(x: 0, y: 0, width: 343, height: 96)
        titles444.translatesAutoresizingMaskIntoConstraints = false
//        titles444.textAlignment = .center
        titles444.numberOfLines = 4
        titles444.text = "밀당해피니스 유튜브 채널을 방문하면 \"태마명\" 이벤트 테마를 무료로 받을 수 있다구요? \n지금 바로 \'참여하기\' 버튼을 눌러새로워진 밀당해피니스 유튜브 채널을 확인해보세요!"
        titles444.font = UIFont(name: "Regular", size: 14)
        titles444.textColor = .black
        return titles444
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
        self.addSubview(titles)
        self.addSubview(titles111)
        self.addSubview(titles222)
        self.addSubview(imageView)
        self.addSubview(titles333)
        self.addSubview(titles444)
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            
            titles.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titles.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titles.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),

            
            titles111.topAnchor.constraint(equalTo: titles.bottomAnchor,constant: 4),
            titles111.leadingAnchor.constraint(equalTo: titles.leadingAnchor),
            titles111.trailingAnchor.constraint(equalTo: titles.trailingAnchor),
            titles111.heightAnchor.constraint(equalToConstant: 20),
            
            
            titles222.topAnchor.constraint(equalTo: titles111.bottomAnchor,constant: 16),
            titles222.leadingAnchor.constraint(equalTo:titles111.leadingAnchor),
            titles222.trailingAnchor.constraint(equalTo: titles111.trailingAnchor),
            titles222.heightAnchor.constraint(equalToConstant: 28),
            
            titles333.topAnchor.constraint(equalTo: titles222.bottomAnchor,constant: 40),
            titles333.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            
            titles444.topAnchor.constraint(equalTo: titles333.bottomAnchor,constant: 8),
            titles444.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titles444.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
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
            let view = keyboardImageView()
            return view
        }.previewLayout(.fixed(width: 1000, height: 1000))
    }
}

#endif

