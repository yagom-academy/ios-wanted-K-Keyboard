//
//  FourView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit

class FourView: UIView {

    let buy : UILabel = {
        let buy = UILabel()
        buy.frame = CGRect(x: 0, y: 0, width: 63, height: 24)
        buy.translatesAutoresizingMaskIntoConstraints = false
        buy.textAlignment = .center
        buy.text = "구매 리뷰"
        buy.textColor = .black
        return buy
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
        self.backgroundColor = .red
        self.addSubview(buy)
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            buy.topAnchor.constraint(equalTo: self.topAnchor),
            buy.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buy.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buy.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
