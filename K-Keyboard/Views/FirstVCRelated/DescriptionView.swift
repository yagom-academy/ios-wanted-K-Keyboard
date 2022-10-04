//
//  DescriptionView.swift
//  K-Keyboard
//
//  Created by 엄철찬 on 2022/10/04.
//

import UIKit

class DescriptionView : UIView, FirstViewStyling {
    
    let header = UILabel()
    
    let body = UILabel()
    
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

extension DescriptionView: Presentable {
    func initViewHierarchy() {
        
        self.addSubview(header)
        self.addSubview(body)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        body.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }

        constraint += [
            header.topAnchor.constraint(equalTo: self.topAnchor),
            header.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            header.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            body.topAnchor.constraint(equalTo: header.bottomAnchor,constant: 8),
            body.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            body.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            body.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
    }
    
    func configureView() {
        
        self.backgroundColor = .yellow
        
        header.addLableStyle(style: headerLabelStyling, txt: "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉")
        body.addLableStyle(style: bodyLabelStyling, txt: "밀당해피니스 유튜브 채널을 방문하면 “테마명” 이벤트 테마를 무료로 받을 수 있다구요?\n지금 바로 ‘참여하기' 버튼을 눌러 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!")
    }
    
    func bind() {
        
    }
}
