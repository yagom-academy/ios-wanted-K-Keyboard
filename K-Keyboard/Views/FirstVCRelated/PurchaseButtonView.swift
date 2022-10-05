//
//  PurchaseButtonView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit
import SwiftUI

class PurchaseButtonView: UIView {

    var gemIconImageView = UIImageView()
    var gemCountLabel = UILabel()
    var userGemStatusLabel = UILabel()
    
    var purchaseButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PurchaseButtonView: Presentable {
    func initViewHierarchy() {
        self.addSubview(gemIconImageView)
        self.addSubview(userGemStatusLabel)
        self.addSubview(gemCountLabel)
        self.addSubview(purchaseButton)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            gemIconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18.33),
            gemIconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18.67),
            gemIconImageView.widthAnchor.constraint(equalToConstant: 11.33),
            gemIconImageView.heightAnchor.constraint(equalToConstant: 11)
        ]
        
        constraint += [
            gemCountLabel.leadingAnchor.constraint(equalTo: gemIconImageView.trailingAnchor, constant: 6.33),
            gemCountLabel.centerYAnchor.constraint(equalTo: gemIconImageView.centerYAnchor)
        ]
        
        constraint += [
            userGemStatusLabel.topAnchor.constraint(equalTo: gemIconImageView.bottomAnchor, constant: 5.33),
            userGemStatusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            userGemStatusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -11)
        ]
        
        constraint += [
            purchaseButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            purchaseButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            purchaseButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12),
            purchaseButton.widthAnchor.constraint(equalToConstant: 144)
        ]
        
    }
    
    func configureView() {
        self.backgroundColor = .white
        
        gemIconImageView.image = UIImage(named: "자산 41@4x")
        gemCountLabel.text = "\(5)"
        userGemStatusLabel.text = "0젬 보유중"
        
        purchaseButton.setTitle("구매하기", for: .normal)
        purchaseButton.setTitleColor(.white, for: .normal)
        purchaseButton.setBackgroundColor(.red, for: .normal)
    }
    
    func bind() {
        
    }
    
    
}

#if canImport(SwiftUI) && DEBUG
struct PurchaseButtonViewPreview<View: UIView>: UIViewRepresentable {
    
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
struct PurchaseButtonViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        PurchaseButtonViewPreview {
            let view = PurchaseButtonView()
            return view
        }.previewLayout(.fixed(width: 375, height: 64))
    }
}

#endif

