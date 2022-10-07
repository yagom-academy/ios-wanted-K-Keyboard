//
//  themView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/03.
//

import UIKit

class themaView: UIView {
    
    let immoge: [String] = ["☺️","😍","😉","🤣"]
    var b1 : [String] = ["마음에들어요", "심쿵했어요", "응원해요","갖고싶어요"]
    var c1 : [String] = ["0","1","0","0"]
    
    let buy : UILabel = {
        let buy = UILabel()
        buy.translatesAutoresizingMaskIntoConstraints = false
        buy.text = "이 테마를 어떻게 생각하나요?"
        buy.textColor = .black
        return buy
    }()
    let goodView : GoodView = {
        let view = GoodView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let loveView : LoveView = {
        let view = LoveView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let cheerView : CheerView = {
        let view = CheerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let wantView : WantView = {
        let view = WantView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    private func setupView() {
        addSubview(stackView)
    [goodView, loveView, cheerView, wantView].map {
                self.stackView.addArrangedSubview($0)
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
        addSubview(buy)
        addSubview(stackView)
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
            stackView.heightAnchor.constraint(equalToConstant: 66),
        ])
    }
}


