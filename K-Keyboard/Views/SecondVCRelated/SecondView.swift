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

class SecondView : UIView {
    
    var delegate : SecondViewProtocol?
    
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSecondView))
    
    let secondView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        view.layer.cornerRadius = 24
        view.clipsToBounds = false
        return view
    }()
    
    lazy var purchaseBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("충전하고 바로 사용하기", for: .normal)
        btn.layer.backgroundColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1).cgColor
        btn.layer.cornerRadius = 24
        btn.addTarget(self, action: #selector(vertifyAndDismissSecondView), for: .touchUpInside)
        return btn
    }()
    
    let imageView : UIImageView = {
        let img = UIImage(named: "Image")
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let gemImageView : UIImageView = {
        let img = UIImage(named: "Gem")
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let leftButtonImageView : UIImageView = {
        let img = UIImage(named: "Left")
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let rightButtonImageImageView : UIImageView = {
        let img = UIImage(named: "Right")
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    let label1 : UILabel = {
        let lbl = UILabel()
        lbl.text = "N젬이 부족해요\n빠르게 충전해 보세요!"
        lbl.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        lbl.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        lbl.textAlignment = .center
        let color = UIColor(red: 0.49, green: 0.788, blue: 0.988, alpha: 1)
        let fullText = lbl.text ?? ""
        let range = (fullText as NSString).range(of: "N젬")
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.foregroundColor, value: color, range: range)
        lbl.attributedText = attributedString
        return lbl
    }()
    
    let label2 : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        lbl.font = UIFont(name: "NotoSansCJKKR-Bold", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16
        lbl.textAlignment = .center
        lbl.attributedText = NSMutableAttributedString(string: "젬 수량", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return lbl
    }()
    
    let label3 : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        lbl.font = UIFont(name: "NotoSansCJKKR-Bold", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16
        lbl.textAlignment = .center
        lbl.attributedText = NSMutableAttributedString(string: "결제 금액", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return lbl
    }()
    
    let label4 : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 1, green: 0.255, blue: 0.49, alpha: 1)
        lbl.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        lbl.textAlignment = .center
        lbl.attributedText = NSMutableAttributedString(string: "₩ 1,100", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return lbl
    }()
    
    
    init() {
        super.init(frame: .zero)
        addViews()
        setConstraint()
        configuration()
        self.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        self.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(purchaseBtn)
        purchaseBtn.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(label1)
        label1.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(label2)
        label2.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(leftButtonImageView)
        leftButtonImageView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(gemImageView)
        gemImageView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(rightButtonImageImageView)
        rightButtonImageImageView.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(label3)
        label3.translatesAutoresizingMaskIntoConstraints = false
        secondView.addSubview(label4)
        label4.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraint(){
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
    
    func configuration(){
        self.addGestureRecognizer(tapGesture)
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
