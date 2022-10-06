//
//  ToolBar.swift
//  CustomKeyboard
//
//  Created by 엄철찬 on 2022/10/05.
//

import UIKit

protocol ToolBarDelegate {
    func changeView()
}

class ToolBar : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews(stackView)
        setConstraints()
        configuration()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews(stackView)
        setConstraints()
        configuration()
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    //나중에 다크모드 대응 시 변경
    func configuration(){
        zip([btn1,btn2,btn3,btn4,btn5,btn6],[UIImage(systemName: "pencil"), UIImage(systemName: "eraser"), UIImage(systemName: "scribble"), UIImage(systemName: "folder"), UIImage(systemName: "paperplane"), UIImage(systemName: "list.dash")]).forEach{
            $0.0.setImage($0.1, for: .normal)
            $0.0.backgroundColor = .darkGray
            $0.0.tintColor = .gray
        }
        btn3.addTarget(self, action: #selector(frequentVew), for: .touchUpInside)
    }
    
    var delegate : ToolBarDelegate?
    
    //나중에 다크모드 대응 시 변경
    @objc func frequentVew(_ sender : UIButton){
        delegate?.changeView()
        if forToggle{
            sender.backgroundColor = .darkGray
        }else{
            sender.backgroundColor = .lightGray
        }
        forToggle.toggle()
    }

    lazy var stackView: UIStackView = {
        let stackH = UIStackView(arrangedSubviews: [btn1,btn2,btn3,btn4,btn5,btn6])
        stackH.translatesAutoresizingMaskIntoConstraints = false
        stackH.axis = .horizontal
        stackH.alignment = .bottom
        stackH.distribution = .fillEqually
        return stackH
    }()
    
    let btn1 = UIButton()
    let btn2 = UIButton()
    let btn3 = UIButton()
    let btn4 = UIButton()
    let btn5 = UIButton()
    let btn6 = UIButton()
    
    var forToggle = false
}

