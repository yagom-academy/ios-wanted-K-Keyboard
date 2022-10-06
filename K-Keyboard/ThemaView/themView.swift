//
//  themView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/03.
//

import UIKit

class themView: UIView {

    let buy : UILabel = {
        let buy = UILabel()
        //        buy.frame = CGRect(x: 0, y: 0, width: 63, height: 24)
        buy.translatesAutoresizingMaskIntoConstraints = false
        buy.text = "이 테마를 어떻게 생각하나요?"
        buy.textColor = .black
        return buy
    }()
    
    let good : UIView = {
        let good = UIView()
        good.translatesAutoresizingMaskIntoConstraints = false
        
        
        return good
    }()
    let label1: UILabel = {
        let label = UILabel()
        label.text = "☺️"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let label2: UILabel = {
        let label = UILabel()
        label.text = "마음에들어요"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let label3: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        return stackView
    }()
    
    let immoge: [String] = ["☺️","😍","😉","🤣"]
    var b1 : [String] = ["마음에들어요", "심쿵했어요", "응원해요","갖고싶어요"]
    var c1 : [String] = ["0","1","0","0"]
    
    private func setupView() {
        addSubview(buy)
        addSubview(stackView)
        [label1, label2, label3].map {
                self.stackView.addArrangedSubview($0)
                $0.heightAnchor.constraint(equalTo: $0.widthAnchor, multiplier: 1.0).isActive = true
            }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        constraintCustomView()
        setupView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            buy.topAnchor.constraint(equalTo: self.topAnchor),
            buy.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buy.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: buy.bottomAnchor,constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}


