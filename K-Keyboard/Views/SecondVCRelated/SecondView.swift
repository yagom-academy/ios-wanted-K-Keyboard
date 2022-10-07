//
//  SecondView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/07.
//

import Foundation
import UIKit
import SwiftUI

protocol SecondViewProtocol{
    func confirmAndDismissSecondView()
    func dismissSecondView()
}

class SecondView : UIView, SecondViewStyling {
    
    var delegate : SecondViewProtocol?
    
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSecondView))
    
    let popupView : UIView = UIView()
    
    var purchaseButton : UIButton = UIButton()
    let imageView : UIImageView = UIImageView()
    let gemImageView : UIImageView = UIImageView()
    let leftButtonImageView : UIImageView = UIImageView()
    let rightButtonImageView : UIImageView = UIImageView()
    let messageLabel : UILabel = UILabel()
    let gemCountInfoLabel : UILabel = UILabel()
    let purchaseAmountInfoLabel : UILabel = UILabel()
    let currencyLabel : UILabel = UILabel()
    
    
    init() {
        super.init(frame: .zero)
        
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func vertifyAndDismissSecondView(){
        delegate?.confirmAndDismissSecondView()
    }
    
    @objc func dismissSecondView(_ sender : UITapGestureRecognizer){
        //투명한 화면 뿐 아니라 하얀 화면을 클릭해도 함수가 발동되어 제약 사항 추가
        if sender.view?.hitTest(sender.location(in: self), with: nil) is Self{
            delegate?.dismissSecondView()
        }
    }
}

extension SecondView: Presentable {
    func initViewHierarchy() {
        self.addSubview(popupView)
        popupView.translatesAutoresizingMaskIntoConstraints = false
        
        popupView.addSubview(imageView)
        popupView.addSubview(messageLabel)
        popupView.addSubview(gemCountInfoLabel)
        popupView.addSubview(leftButtonImageView)
        popupView.addSubview(gemImageView)
        popupView.addSubview(rightButtonImageView)
        popupView.addSubview(purchaseAmountInfoLabel)
        popupView.addSubview(currencyLabel)
        popupView.addSubview(purchaseButton)
        
        popupView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            popupView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            popupView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            popupView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            popupView.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 0),
            popupView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 0)
        ]
        
        constraint += [
            imageView.topAnchor.constraint(equalTo: popupView.topAnchor, constant: 24),
            imageView.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 96),
            imageView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -96),
            imageView.centerXAnchor.constraint(equalTo: popupView.centerXAnchor)
        ]
        
        constraint += [
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            messageLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: popupView.trailingAnchor)
        ]
        
        constraint += [
            gemCountInfoLabel.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16),
            gemCountInfoLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 40)
        ]
        
        constraint += [
            rightButtonImageView.centerYAnchor.constraint(equalTo: gemCountInfoLabel.centerYAnchor),
            rightButtonImageView.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -41),
            rightButtonImageView.widthAnchor.constraint(equalToConstant: 12),
            rightButtonImageView.heightAnchor.constraint(equalTo: rightButtonImageView.widthAnchor)
        ]
        
        constraint += [
            gemImageView.centerYAnchor.constraint(equalTo: gemCountInfoLabel.centerYAnchor),
            gemImageView.trailingAnchor.constraint(equalTo: rightButtonImageView.leadingAnchor, constant: -24),
            gemImageView.heightAnchor.constraint(equalToConstant: 20),
            gemImageView.widthAnchor.constraint(equalToConstant: 24)
        ]
        
        constraint += [
            leftButtonImageView.centerYAnchor.constraint(equalTo: gemCountInfoLabel.centerYAnchor),
            leftButtonImageView.trailingAnchor.constraint(equalTo: gemImageView.leadingAnchor, constant: -24),
            leftButtonImageView.widthAnchor.constraint(equalToConstant: 12),
            leftButtonImageView.heightAnchor.constraint(equalTo: leftButtonImageView.widthAnchor)
        ]
        
        constraint += [
            purchaseAmountInfoLabel.topAnchor.constraint(equalTo: gemCountInfoLabel.bottomAnchor, constant: 8),
            purchaseAmountInfoLabel.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 40)
        ]
        
        constraint += [
            currencyLabel.centerYAnchor.constraint(equalTo: purchaseAmountInfoLabel.centerYAnchor),
            currencyLabel.centerXAnchor.constraint(equalTo: gemImageView.centerXAnchor),
            currencyLabel.leadingAnchor.constraint(greaterThanOrEqualTo: purchaseAmountInfoLabel.trailingAnchor, constant: 0),
            currencyLabel.trailingAnchor.constraint(lessThanOrEqualTo: popupView.trailingAnchor, constant: 0),
        ]
        
        constraint += [
            purchaseButton.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            purchaseButton.leadingAnchor.constraint(equalTo: popupView.leadingAnchor, constant: 45),
            purchaseButton.trailingAnchor.constraint(equalTo: popupView.trailingAnchor, constant: -45),
            purchaseButton.bottomAnchor.constraint(equalTo: popupView.bottomAnchor, constant: 160)
        ]
    }
    
    func configureView() {
//        self.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
//        popupView.addStyles(style: secondViewStyle)
        
        purchaseButton.addStyles(style: purchaseBtnStyle)
        imageView.addStyles(style: imageViewStyle)
        gemImageView.addStyles(style: gemImageViewStyle)
        leftButtonImageView.addStyles(style: leftButtonImageViewStyle)
        rightButtonImageView.addStyles(style: rightButtonImageViewStyle)
        messageLabel.addStyles(style: messageLabelStyle)
        gemCountInfoLabel.addStyles(style: gemCountInfoLabelStyle)
        purchaseAmountInfoLabel.addStyles(style: purchaseAmountInfoLabelStyle)
        currencyLabel.addStyles(style: currencyLabelStyle)
        
        self.backgroundColor = .yellow
        popupView.backgroundColor = .red
    }
    
    func bind() {
        self.addGestureRecognizer(tapGesture)
    }
    
    
}

#if canImport(SwiftUI) && DEBUG
struct SecondViewPreview<View: UIView>: UIViewRepresentable {
    
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
#endif

#if canImport(SwiftUI) && DEBUG
struct SecondViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        SecondViewPreview {
            let view = SecondView()
            return view
        }.previewLayout(.fixed(width: 320, height: 740))
    }
}

#endif
