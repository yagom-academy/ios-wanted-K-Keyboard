//
//  KeyboardView.swift
//  K-Keyboard
//
//  Created by 엄철찬 on 2022/10/04.
//

import UIKit

class KeyboardView : UIView, Presentable, FirstViewStyling{
    func initViewHierarchy() {
        self.addSubview(keyboardImgView)
        keyboardImgView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(numberOfPeople)
        numberOfPeople.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }

        //이미지뷰의 남는 부분 제거
        var aspectR : CGFloat = 1.0
        if let image = keyboardImgView.image{
            aspectR = image.size.width / image.size.height
        }
        
        constraint += [
            keyboardImgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            keyboardImgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            keyboardImgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            keyboardImgView.heightAnchor.constraint(equalTo: keyboardImgView.widthAnchor, multiplier: 1/aspectR),
            
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: keyboardImgView.bottomAnchor, constant: 24),
            
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            numberOfPeople.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 16),
            numberOfPeople.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ]
    }
    
    func configureView() {
        keyboardImgView.addStyles(style: keyboardImageStyling)
        titleLabel.addLableStyle(style: titleLabelStyling, txt: "앙무")
        subTitle.addLableStyle(style: labelStyling, txt: "코핀")
        numberOfPeople.addLableStyle(style: labelStyling, txt: "78명이 참여했어요!")
        numberOfPeople.color(targetString: "78")
    }
    
    func bind() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        initViewHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    let keyboardImgView = UIImageView()
    
    let titleLabel = UILabel()
    
    let subTitle = UILabel()

    let numberOfPeople = UILabel()
    
}
