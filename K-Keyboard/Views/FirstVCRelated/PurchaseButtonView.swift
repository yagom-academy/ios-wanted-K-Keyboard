//
//  PurchaseButtonView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

class PurchaseButtonView: UIView {

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

extension PurchaseButtonView: Presentable {
    func initViewHierarchy() {
        self.backgroundColor = .darkGray
    }
    
    func configureView() {
        
    }
    
    func bind() {
        
    }
    
    
}
