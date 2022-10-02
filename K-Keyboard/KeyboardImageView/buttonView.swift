//
//  buttonView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/02.
//

import UIKit

class ButtonView: UIView {
    
    let title : UIButton = {
        
        let title = UIButton()
        title.setTitle("구매하기", for: .normal)
        title.setTitleColor(.white, for: .normal)
        title.backgroundColor = .red
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
        self.addSubview(title)
        constraintCustomView()
    }
    
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
