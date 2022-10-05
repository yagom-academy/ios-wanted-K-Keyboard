//
//  KeyboardView.swift
//  K-Keyboard
//
//  Created by 엄철찬 on 2022/10/04.
//

import UIKit

class KeyboardView : UIView, FirstViewStyling{
    
    let keyboardImgView = UIImageView()
    let titleLabel = UILabel()
    let subTitle = UILabel()
    let numberOfPeople = UILabel()
    
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

extension KeyboardView: Presentable {
    func initViewHierarchy() {
        self.addSubview(keyboardImgView)
        self.addSubview(titleLabel)
        self.addSubview(subTitle)
        self.addSubview(numberOfPeople)
        
        keyboardImgView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        numberOfPeople.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }

        //이미지뷰의 남는 부분 제거
        // TODO: 아래 분기 아예 안 타는데?
        var aspectR : CGFloat = 1.0
        if let image = keyboardImgView.image{
            aspectR = image.size.width / image.size.height
            print("if let check aspect r : \(aspectR)")
        }
        
        print("check aspect r : \(aspectR)")
        
        constraint += [
            keyboardImgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 19.46),
            keyboardImgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            keyboardImgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            keyboardImgView.heightAnchor.constraint(equalTo: keyboardImgView.widthAnchor, multiplier: 0.769),
        ]
        
        constraint += [
            titleLabel.topAnchor.constraint(equalTo: keyboardImgView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
        ]
        
        constraint += [
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            subTitle.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        constraint += [
            numberOfPeople.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 16),
            numberOfPeople.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            numberOfPeople.heightAnchor.constraint(equalToConstant: 20),
            numberOfPeople.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
    }
    
    func configureView() {
        self.backgroundColor = .red
        keyboardImgView.addStyles(style: keyboardImageStyling)
        titleLabel.addLableStyle(style: titleLabelStyling, txt: "앙무")
        subTitle.addLableStyle(style: labelStyling, txt: "코핀")
        numberOfPeople.addLableStyle(style: labelStyling, txt: "78명이 참여했어요!")
        numberOfPeople.color(targetString: "78")
    }
    
    func bind() {
        
    }
}
