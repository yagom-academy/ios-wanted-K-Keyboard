//
//  themView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/03.
//

import UIKit

class themView: UIView {
    
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
    
    //문제점1. good view 안에 레이블 3개를 넣어아하는데 themView에서 해야하는지??
    //문제점2. 4개의 뷰들이있는데 배열로 만들어 indexPath.row 로 하나씩 하나씩 들어가는지??
    //문제점3. setUpView에서 good.addView로 레이블을 넣어주는지??  goodView안에서 self.addView로 레이블을 넣어주는지
    //문제점4. constraintCustomView에서 레이아웃을 잡는데 스텍뷰안에 good뷰들이 들어가면  스텍뷰 높이를 주어졌을때 따로 지정을 안해줘도되는데 addview만 하면 되는지?
    
    let good : UIView = {
        let good = UIView()
        good.translatesAutoresizingMaskIntoConstraints = false
        
        return good
    }()
    let good2 : UIView = {
        let good = UIView()
        good.translatesAutoresizingMaskIntoConstraints = false
        return good
    }()
    let good3 : UIView = {
        let good = UIView()
        good.translatesAutoresizingMaskIntoConstraints = false
        return good
    }()
    let good4 : UIView = {
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
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    private func setupView() {
        addSubview(buy)
        good.addSubview(label1)
        good.addSubview(label2)
        good.addSubview(label3)

        good2.addSubview(label1)
        good2.addSubview(label2)
        good2.addSubview(label3)
        
        good3.addSubview(label1)
        good3.addSubview(label2)
        good3.addSubview(label3)
        
        good4.addSubview(label1)
        good4.addSubview(label2)
        good4.addSubview(label3)
        
        
        addSubview(stackView)
        stackView.addSubview(good)
        stackView.addSubview(good2)
        stackView.addSubview(good3)
        stackView.addSubview(good4)
//        [good, good2, good3, good4].map {
//                self.stackView.addArrangedSubview($0)
//            }
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
            stackView.heightAnchor.constraint(equalToConstant: 66),
            
            good.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            label1.topAnchor.constraint(equalTo: good.topAnchor),
            label1.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor,constant: 8),
            label2.centerXAnchor.constraint(equalTo: label1.centerXAnchor),
            
            label3.topAnchor.constraint(equalTo: label3.bottomAnchor,constant: 0),
            label3.centerXAnchor.constraint(equalTo: label3.centerXAnchor),
            label3.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}


