//
//  KeyboardView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/29.
//

import UIKit


class keyboardImageView: UIView {
    let titles : UILabel = {
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 0, width: 37, height: 28)
    title.translatesAutoresizingMaskIntoConstraints = false
    title.textAlignment = .center
    title.text = "앙무"
        title.font = UIFont(name: "Bold", size: 20)
    title.textColor = .black
        return title
}()
    let titles111 : UILabel = {
        let titles111 = UILabel()
        titles111.frame = CGRect(x: 0, y: 0, width: 37, height: 28)
        titles111.translatesAutoresizingMaskIntoConstraints = false
        titles111.textAlignment = .center
        titles111.text = "코핀"
        titles111.font = UIFont(name: "Bold", size: 50)
        titles111.textColor = .black
        return titles111
}()
    let titles222 : UILabel = {
        let titles222 = UILabel()
        titles222.frame = CGRect(x: 0, y: 0, width: 37, height: 28)
        titles222.translatesAutoresizingMaskIntoConstraints = false
        titles222.textAlignment = .center
        titles222.text = "78명이참여했어요!"
        titles222.font = UIFont(name: "Bold", size: 50)
        titles222.textColor = .black
        return titles222
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
        self.backgroundColor = .blue
        self.addSubview(titles)
        self.addSubview(titles111)
        self.addSubview(titles222)
        constraintCustomView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            titles.widthAnchor.constraint(equalToConstant: 80),
            titles.heightAnchor.constraint(equalToConstant: 25),
            titles.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            titles.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            titles111.topAnchor.constraint(equalTo: titles.bottomAnchor,constant: 4),
            titles111.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            titles111.heightAnchor.constraint(equalToConstant: 20),
            
            
            titles222.topAnchor.constraint(equalTo: titles111.bottomAnchor,constant: 4),
            titles222.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            titles222.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
//
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


