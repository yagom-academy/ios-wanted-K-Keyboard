//
//  ThemeOpinionView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

class ThemeOpinionView: UIView {

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
        self.backgroundColor = .red
    }
    
    func configureView() {
        
    }
    
    func bind() {
        
    }
    
    
}
