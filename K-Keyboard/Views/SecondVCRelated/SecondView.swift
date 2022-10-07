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
    
    let secondView : UIView = UIView()
    
    lazy var purchaseBtn : UIButton = UIButton()
    
    let imageView : UIImageView = UIImageView()
    
    let gemImageView : UIImageView = UIImageView()
    
    let leftButtonImageView : UIImageView = UIImageView()
    
    let rightButtonImageImageView : UIImageView = UIImageView()
    
    let label1 : UILabel = UILabel()
    
    let label2 : UILabel = UILabel()
    
    let label3 : UILabel = UILabel()
    
    let label4 : UILabel = UILabel()
    
    
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
        self.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        secondView.addSubview(purchaseBtn)
        
        secondView.addSubview(imageView)
        
        secondView.addSubview(label1)
        
        secondView.addSubview(label2)
        
        secondView.addSubview(leftButtonImageView)
        
        secondView.addSubview(gemImageView)
        
        secondView.addSubview(rightButtonImageImageView)
        
        secondView.addSubview(label3)
        
        secondView.addSubview(label4)
        
        secondView.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // TODO: 오토레이아웃 전면 수정
        NSLayoutConstraint.activate([
            secondView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -241),
            secondView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            secondView.topAnchor.constraint(equalTo: self.topAnchor, constant: 241),
            secondView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            imageView.bottomAnchor.constraint(equalTo: label1.topAnchor, constant: -8),
            imageView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -99),
            imageView.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 24),
            imageView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 96),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            label1.bottomAnchor.constraint(equalTo: label2.topAnchor, constant: -16),
            label1.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -74),
            label1.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 75),
            
            label2.bottomAnchor.constraint(equalTo: label3.topAnchor, constant: -8),
            label2.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -213),
            label2.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 40),
            
            leftButtonImageView.bottomAnchor.constraint(equalTo: label4.topAnchor, constant: -14),
            leftButtonImageView.trailingAnchor.constraint(equalTo: gemImageView.leadingAnchor, constant: -24),
            leftButtonImageView.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 22),
            leftButtonImageView.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 164.09),
            leftButtonImageView.widthAnchor.constraint(equalToConstant: 12),
            leftButtonImageView.heightAnchor.constraint(equalToConstant: 12),
            
            gemImageView.bottomAnchor.constraint(equalTo: label4.topAnchor, constant: -8),
            gemImageView.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 16),
            gemImageView.widthAnchor.constraint(equalToConstant: 28),
            gemImageView.heightAnchor.constraint(equalToConstant: 24),
            
            rightButtonImageImageView.bottomAnchor.constraint(equalTo: label4.topAnchor, constant: -14),
            rightButtonImageImageView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -41.09),
            rightButtonImageImageView.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 22),
            rightButtonImageImageView.leadingAnchor.constraint(equalTo: gemImageView.trailingAnchor, constant: 24),
            rightButtonImageImageView.widthAnchor.constraint(equalToConstant: 12),
            rightButtonImageImageView.heightAnchor.constraint(equalToConstant: 12),
            
            label3.bottomAnchor.constraint(equalTo: purchaseBtn.topAnchor, constant: -20),
            label3.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -200),
            label3.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 40),
            
            label4.bottomAnchor.constraint(equalTo: purchaseBtn.topAnchor, constant: -24),
            label4.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -62),
            label4.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 185),
            
            purchaseBtn.bottomAnchor.constraint(equalTo: secondView.bottomAnchor, constant: -16),
            purchaseBtn.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -49),
            purchaseBtn.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 46)
            
        ])
        
    }
    
    func configureView() {
        self.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        secondView.addStyles(style: secondViewStyle)
        purchaseBtn.addStyles(style: purchaseBtnStyle)
        imageView.addStyles(style: imageViewStyle)
        gemImageView.addStyles(style: gemImageViewStyle)
        leftButtonImageView.addStyles(style: leftButtonImageViewStyle)
        rightButtonImageImageView.addStyles(style: rightButtonImageViewStyle)
        label1.addStyles(style: label1Style)
        label2.addStyles(style: label2Style)
        label3.addStyles(style: label3Style)
        label4.addStyles(style: label4Style)
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
