//
//  ContentView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/07.
//

import UIKit

class ContentView: UIView, SecondViewStyling {
    
    lazy var popupView = PopupView(viewModel: self.viewModel.popupViewModel)

    var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ContentView: Presentable {
    func initViewHierarchy() {
        self.addSubview(popupView)
        
        popupView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            popupView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            popupView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ]
    }
    
    func configureView() {
        self.backgroundColor = .clear
        self.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        
        popupView.addStyles(style: popupViewStyle)
    }
    
    func bind() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapEvent(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapEvent(_ sender : UITapGestureRecognizer) {
        
        let selfViewPoint = sender.location(in: self)
        
        var isTapInPopupViewBounds = popupView.frame.contains(selfViewPoint)
        
        if isTapInPopupViewBounds == true {
            return
        } else if isTapInPopupViewBounds == false {
            viewModel.didReceiveTapGesture()
        }
    }
}
