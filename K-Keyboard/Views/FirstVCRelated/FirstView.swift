//
//  ScrollView.swift
//  K-Keyboard
//
//  Created by 엄철찬 on 2022/10/04.
//

import UIKit

class FirstView : UIView, Presentable, FirstViewStyling{
    func configureView() {
        labelTest.addStyles(style: labelStyling )
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
    
    let keyboardImgView : UIImageView = {
        let imgView = UIImageView()
        let img = UIImage(named: "keyboardImage")
        imgView.image = img
        imgView.contentMode = .scaleAspectFit
        
     //   let image0 = UIImage(named: "keyboardImage")?.cgImage
        let layer0 = CALayer()
      //  layer0.contents = image0
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0))
        layer0.bounds = imgView.bounds
        layer0.position = imgView.center
        imgView.layer.addSublayer(layer0)
        return imgView
    }()
    
    let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        lbl.font = UIFont(name: "NotoSansCJKKR-Bold", size: 20)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.95
        lbl.attributedText = NSMutableAttributedString(string: "앙무", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return lbl
    }()
    
    let subTitle : UILabel = {
        let lbl = UILabel()
        lbl.alpha = 1
        lbl.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
        lbl.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        lbl.attributedText = NSMutableAttributedString(string: "코핀", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return lbl
    }()
    //asdasdasdasdas
    let numberOfPeople : UILabel = {
        let lbl = UILabel()
        lbl.alpha = 1
        lbl.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
        lbl.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        lbl.attributedText = NSMutableAttributedString(string: "78명이참여했어요!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        lbl.color(targetString: "78")
        return lbl
    }()
    
    let header1 : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        lbl.font = UIFont(name: "NotoSansCJKKR-Bold", size: 14)
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16
        lbl.attributedText = NSMutableAttributedString(string: "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return lbl
    }()
    
    let labelTest = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViewHierarchy()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViewHierarchy(){
        self.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(keyboardImgView)
        keyboardImgView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(numberOfPeople)
        numberOfPeople.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(header1)
        header1.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
//        if let image = keyboardImgView.image{
//            let ratio = image.size.width / image.size.height
//            let newHeight = keyboardImgView.frame.width / ratio
//            keyboardImgView.constraintHeight.constant = newHeight
//            keyboardImgView.heightAnchor.constraint(equalTo: newHeight)
//            view.layoutIfNeeded()
//        }
        //asdasdasdasdas
        //이미지뷰의 남는 부분 제거
        var aspectR : CGFloat = 1.0
        if let image = keyboardImgView.image{
            aspectR = image.size.width / image.size.height
        }
        
        constraint += [
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: self.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            keyboardImgView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            keyboardImgView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            keyboardImgView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            keyboardImgView.heightAnchor.constraint(equalTo: keyboardImgView.widthAnchor, multiplier: 1/aspectR),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: keyboardImgView.bottomAnchor, constant: 24),
            
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            numberOfPeople.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 16),
            numberOfPeople.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            header1.topAnchor.constraint(equalTo: numberOfPeople.bottomAnchor, constant: 40),
            header1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),


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
