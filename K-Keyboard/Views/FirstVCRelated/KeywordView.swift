//
//  KeywordView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

class KeywordView: UIView {

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

extension KeywordView: Presentable {
    func initViewHierarchy() {
        self.backgroundColor = .green
    }
    
    func configureView() {
        
    }
    
    func bind() {
        
    }
    
    
}
