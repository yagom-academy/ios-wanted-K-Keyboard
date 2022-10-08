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
    let keyboardImageView: KeyboardImageView = {
        let view = KeyboardImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let tagView: TagView = {
        let view = TagView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let keyWordView: KeyWordView = {
        let view = KeyWordView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let themaView1: ThemaView = {
        let view = ThemaView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let purchaseReviewView: PurchaseReviewView = {
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
    var bottomViewMarginConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNaviView()
        addSubView()
        setUpUIConstraints()
        addNotification()
        buttonView.buttonDelegate = self
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }
    func popUpButton() {
        let vc = PurchaseAlertViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    func saveButtonAction() {
        purchaseReviewView.dataArry.append(.init(uesrImage: UIImage(named: "user"),isCreater: false, idLabel: "ID", infoLabel: buttonView.textFieldView.text ?? "" , timeLabel: "방금", declaration: " "))
        buttonView.textFieldView.text = nil
    }
    func addSubView() {
        totalView.addSubview(keyboardImageView)
        totalView.addSubview(tagView)
        totalView.addSubview(keyWordView)
        totalView.addSubview(themaView1)
        totalView.addSubview(purchaseReviewView)
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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func ViewChange() {
        buttonView.diamondCount.isHidden = true
        buttonView.buyButton.isHidden = true
        buttonView.diamond.isHidden = true
        buttonView.jamLabel.isHidden = true
        buttonView.textFieldView.isHidden = false
        buttonView.textFieldViewButton.isHidden = false
    }
    private func setUpUIConstraints() {
        bottomViewMarginConstraint = buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.frameLayoutGuide.widthAnchor.constraint(equalTo: totalView.widthAnchor),
            
            buttonView.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            buttonView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            buttonView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            bottomViewMarginConstraint!,
            buttonView.heightAnchor.constraint(equalToConstant: 64),
            
            totalView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            totalView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            totalView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            totalView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
            keyboardImageView.topAnchor.constraint(equalTo: totalView.topAnchor,constant: 0),
            keyboardImageView.leadingAnchor.constraint(equalTo: totalView.leadingAnchor,constant: 16),
            keyboardImageView.trailingAnchor.constraint(equalTo: totalView.trailingAnchor,constant: -16),
            
            tagView.topAnchor.constraint(equalTo: keyboardImageView.bottomAnchor,constant: 48),
            tagView.leadingAnchor.constraint(equalTo: keyboardImageView.leadingAnchor,constant: 0),
            tagView.trailingAnchor.constraint(equalTo: keyboardImageView.trailingAnchor,constant: 0),
            
            keyWordView.topAnchor.constraint(equalTo: tagView.bottomAnchor,constant: 40),
            keyWordView.leadingAnchor.constraint(equalTo: keyboardImageView.leadingAnchor,constant: 0),
            keyWordView.trailingAnchor.constraint(equalTo: keyboardImageView.trailingAnchor,constant: 0),
            
            themaView1.topAnchor.constraint(equalTo: keyWordView.bottomAnchor,constant: 48),
            themaView1.leadingAnchor.constraint(equalTo: keyboardImageView.leadingAnchor,constant: 0),
            themaView1.trailingAnchor.constraint(equalTo: keyboardImageView.trailingAnchor,constant: 0),
            
            purchaseReviewView.topAnchor.constraint(equalTo: themaView1.bottomAnchor,constant: 50),
            purchaseReviewView.leadingAnchor.constraint(equalTo: keyboardImageView.leadingAnchor,constant: 0),
            purchaseReviewView.trailingAnchor.constraint(equalTo: keyboardImageView.trailingAnchor,constant: 0),
            purchaseReviewView.bottomAnchor.constraint(equalTo: totalView.bottomAnchor,constant: 0),
        ])
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomViewMarginConstraint?.constant = -(keyboardSize.height - self.view.safeAreaInsets.bottom) 
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        bottomViewMarginConstraint?.constant = 0
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func endEditing() {
        self.view.endEditing(true)
    }
}
extension MainViewController: ButtonViewDelegate {
    func popUpView() {
        popUpButton()
    }
    func addReview() {
        saveButtonAction()
    }
}

