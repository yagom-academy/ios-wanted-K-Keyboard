//
//  ScrollView.swift
//  K-Keyboard
//
//  Created by 엄철찬 on 2022/10/04.
//

import UIKit

class FirstView : UIView, Presentable, FirstViewStyling{
    
    func configureView() {
       // labelTest.addStyles(style: labelStyling )
    }
    
    func bind() {
        
    }
    
    let scrollView : UIScrollView = {
        let scrView = UIScrollView()
        scrView.showsVerticalScrollIndicator = true
        return scrView
    }()
    
    let contentView : UIView = {
        let view = UIView()
        return view
    }()
    
    let keyboardView = KeyboardView()
    
    let keyboardView1 = KeyboardView()
    
    let descriptionView = DescriptionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewHierarchy()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func initViewHierarchy(){
        
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(keyboardView)
        keyboardView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(descriptionView)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(keyboardView1)
        keyboardView1.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
//            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
//            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
//            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
//            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
//            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
//            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            
//            keyboardView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            keyboardView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            keyboardView.bottomAnchor.constraint(equalTo: descriptionView.topAnchor),
//            keyboardView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            //keyboardView.heightAnchor.constraint(equalToConstant: 516),
            
            keyboardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            keyboardView.heightAnchor.constraint(equalToConstant: 516),

//            descriptionView.topAnchor.constraint(equalTo: keyboardView.bottomAnchor),
//            descriptionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            descriptionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            descriptionView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
            descriptionView.topAnchor.constraint(equalTo: keyboardView.bottomAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionView.bottomAnchor.constraint(equalTo: keyboardView1.topAnchor),
            descriptionView.heightAnchor.constraint(equalToConstant: 100),

            
           // keyboardView1.topAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            keyboardView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            keyboardView1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            keyboardView1.heightAnchor.constraint(equalToConstant: 516),
            keyboardView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        
    }
    
    
    
}


extension UILabel {
    func color(targetString: String) {
        let color = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        self.attributedText = attributedString
    }
}
