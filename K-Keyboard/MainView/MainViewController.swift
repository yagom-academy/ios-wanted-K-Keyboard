//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class MainViewController: UIViewController {
    
    let sdView = UIView()
    
    let firstView: KeyboardImageView = {
        let view = KeyboardImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let secondView: TagView = {
        let view = TagView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let thirdView: KeyWordView = {
        let view = KeyWordView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let fourView: ThemaView = {
        let view = ThemaView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let fifveView: PurchaseReviewView = {
        let view = PurchaseReviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //마지막 버튼클릭뷰 확인용
    let buttonView: ButtonView = {
        let view = ButtonView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    func addSubView() {
        
        self.view.addSubview(scrollView)
        //마지막 버튼클릭뷰
        //        self.view.addSubview(buttonView)
        sdView.addSubview(firstView)
        sdView.addSubview(secondView)
        sdView.addSubview(thirdView)
        sdView.addSubview(fourView)
        sdView.addSubview(fifveView)
        sdView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(sdView)
    }
    
    
    private func setUpUIConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
            
            
            //            buttonView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            //            buttonView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            //            buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            firstView.topAnchor.constraint(equalTo: sdView.topAnchor,constant: 0),
            firstView.leadingAnchor.constraint(equalTo: sdView.leadingAnchor,constant: 16),
            firstView.trailingAnchor.constraint(equalTo: sdView.trailingAnchor,constant: -16),
            //        firstView.bottomAnchor.constraint(equalTo: secondView.topAnchor),
            //        firstView.widthAnchor.constraint(equalToConstant: 500),
            //높이를 주면안되는데...높이를 줘야만 뷰가 정상작동
            //            firstView.heightAnchor.constraint(equalToConstant: 544),
            
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
            secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 0),
            //        secondView.widthAnchor.constraint(equalToConstant: 700),
            //뷰높이...
            //            secondView.heightAnchor.constraint(equalToConstant: 500),
            
            thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor),
            thirdView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
            thirdView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 0),
            
            //            thirdView.heightAnchor.constraint(equalToConstant: 500),
            // 뷰높이...
            //            thirdView.heightAnchor.constraint(equalToConstant: 202),
            
            
            fourView.topAnchor.constraint(equalTo: thirdView.bottomAnchor),
            fourView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
            fourView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 0),
            //            fourView.heightAnchor.constraint(equalToConstant: 400),
            
            fifveView.topAnchor.constraint(equalTo: fourView.bottomAnchor,constant: 50),
            fifveView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
            fifveView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 0),
            fifveView.bottomAnchor.constraint(equalTo: sdView.bottomAnchor,constant: 0),
            //
            sdView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            sdView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            sdView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            sdView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: sdView.widthAnchor),
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImage(named: "NaniBackButton")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: imageView, style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
        self.view.backgroundColor = .white
        addSubView()
        setUpUIConstraints()
    }
}
