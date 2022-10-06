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
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    let buttonView: ButtonView = {
        let view = ButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let totalView: UIView = {
        let totalView = UIView()
        totalView.translatesAutoresizingMaskIntoConstraints = false
        return totalView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addNaviView()
        addSubView()
        setUpUIConstraints()
        addNotification()
        buttonView.buttonDelegate = self
    }
    func popButton() {
        print("구매하기버튼눌려짐")
        let vc = PurchaseAlertViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    func saveButtonAction() {
        fifveView.dataArry.append(.init(uesrImage: UIImage(named: "1"), idLabel: "ID", infoLabel: buttonView.textFiedView.text ?? "" , timeLabel: "몇초", declaration: " "))
        buttonView.diamondcount.isHidden = false
        buttonView.buyButton.isHidden = false
        buttonView.diamond.isHidden = false
        buttonView.jamLabel.isHidden = false
        buttonView.textFiedView.isHidden = true
        buttonView.textFiedViewButton.isHidden = true
    }
    func addSubView() {
        totalView.addSubview(firstView)
        totalView.addSubview(secondView)
        totalView.addSubview(thirdView)
        totalView.addSubview(fourView)
        totalView.addSubview(fifveView)
        scrollView.addSubview(totalView)
        view.addSubview(scrollView)
        view.addSubview(buttonView)
    }
    func addNaviView() {
        let naviView = UIImage(named: "NaniBackButton")
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: naviView, style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem?.tintColor = .black
        self.view.backgroundColor = .white
    }
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewChange), name: .purchaseButtonClick, object: nil)
    }
    @objc func ViewChange() {
        buttonView.diamondcount.isHidden = true
        buttonView.buyButton.isHidden = true
        buttonView.diamond.isHidden = true
        buttonView.jamLabel.isHidden = true
        buttonView.textFiedView.isHidden = false
        buttonView.textFiedViewButton.isHidden = false
    }
    private func setUpUIConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: totalView.widthAnchor),
            
            buttonView.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            buttonView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttonView.heightAnchor.constraint(equalToConstant: 40),
            
            totalView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            totalView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            totalView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            totalView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            firstView.topAnchor.constraint(equalTo: totalView.topAnchor,constant: 0),
            firstView.leadingAnchor.constraint(equalTo: totalView.leadingAnchor,constant: 16),
            firstView.trailingAnchor.constraint(equalTo: totalView.trailingAnchor,constant: -16),
            
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
            fifveView.bottomAnchor.constraint(equalTo: totalView.bottomAnchor,constant: 0),
        ])
    }
}
extension MainViewController: ButtonViewDelegate {
    func showAlert() {
        popButton()
    }
    func showAlert1() {
        saveButtonAction()
    }
}

