//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class MainViewController: UIViewController {
    
    let buttonViewView: PopView = {
        let view = PopView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
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
        //        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    func popButton() {
        print("구매하기버튼눌려짐")
        let vc = PurchaseAlertViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    func adcoll() {
        fifveView.dataArry.append(.init(uesrImage: UIImage(named: "1"), idLabel: "ID", infoLabel: buttonView.textFiedView.text ?? "" , timeLabel: "몇초", declaration: " "))
    }
    
    func addSubView() {
        self.view.addSubview(scrollView)
        self.view.addSubview(buttonView)
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
            
            buttonView.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            buttonView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 40),
            
            firstView.topAnchor.constraint(equalTo: sdView.topAnchor,constant: 0),
            firstView.leadingAnchor.constraint(equalTo: sdView.leadingAnchor,constant: 16),
            firstView.trailingAnchor.constraint(equalTo: sdView.trailingAnchor,constant: -16),
            
            secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor,constant: 48),
            secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
            secondView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 0),
            
            thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor,constant: 40),
            thirdView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
            thirdView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 0),
            
            fourView.topAnchor.constraint(equalTo: thirdView.bottomAnchor,constant: 48),
            fourView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
            fourView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 0),
            
            fifveView.topAnchor.constraint(equalTo: fourView.bottomAnchor,constant: 50),
            fifveView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
            fifveView.trailingAnchor.constraint(equalTo: firstView.trailingAnchor,constant: 0),
            fifveView.bottomAnchor.constraint(equalTo: sdView.bottomAnchor,constant: 0),
            
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
        buttonView.buttonDelegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(abc), name: .purchaseButtonClick, object: nil)
    }
    
    @objc func abc() {
        print("awefawiofjoeiwajfioewajfoewajfoiaewijfoewajfoiew")

        buttonView.diamondcount.isHidden = true
        buttonView.buyButton.isHidden = true
        buttonView.diamond.isHidden = true
        buttonView.jamLabel.isHidden = true
        buttonView.textFiedView.isHidden = false
        buttonView.textFiedViewButton.isHidden = false
        
    }
}
extension MainViewController: ButtonViewDelegate {
    func showAlert() {
        popButton()
       
    }
    func showAlert1() {
        adcoll()
    }
}
 
