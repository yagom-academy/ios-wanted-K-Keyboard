//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class MainViewController: UIViewController {
    
   

    let firstView: keyboardImageView = {
            let view = keyboardImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
            return view
        }()
        let secondView: SecondView = {
            let view = SecondView()
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        let thirdView: ThirdView = {
            let view = ThirdView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    let fourView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    let fifveView: UILabel = {
        let view = UILabel()
        view.text = "다섯번째뷰화면"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .brown
        return view
    }()
    
    let labelOne: UILabel = {
      let label = UILabel()
      label.text = "첫번째 뷰화면"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let labelTwo: UILabel = {
      let label = UILabel()
      label.text = "마지막 뷰화면"
      label.backgroundColor = .red
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()

    let scrollView: UIScrollView = {
      let scrollView = UIScrollView()
//      scrollView.backgroundColor = .lightGray
      scrollView.translatesAutoresizingMaskIntoConstraints = false
      return scrollView
    }()
    func addSubView() {

        self.view.addSubview(scrollView)
        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        scrollView.addSubview(thirdView)
        scrollView.addSubview(fourView)
        scrollView.addSubview(fifveView)
//        scrollView.addSubview(labelOne)
//        scrollView.addSubview(labelTwo)
    }

    
    private func setUpUIConstraints() {
      NSLayoutConstraint.activate([
        
        scrollView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
        scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0),
        scrollView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
        scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0),
        
//        imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 100),
//        imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
//        imageView.trailingAnchor.constraint(equalTo: secondView.trailingAnchor,constant: 16),

        firstView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 0),
        firstView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 0),
        firstView.widthAnchor.constraint(equalToConstant: 375),
        firstView.heightAnchor.constraint(equalToConstant: 540),
       
        
        
        secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor,constant: 0),
        secondView.leadingAnchor.constraint(equalTo: firstView.leadingAnchor,constant: 0),
        secondView.widthAnchor.constraint(equalToConstant: 375),
        secondView.heightAnchor.constraint(equalToConstant: 300),
//        secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: 0),
//        secondView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: 0),
//
        thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor,constant: 0),
        thirdView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 0),
        thirdView.widthAnchor.constraint(equalToConstant: 375),
        thirdView.heightAnchor.constraint(equalToConstant: 300),
        
        fourView.topAnchor.constraint(equalTo: thirdView.bottomAnchor,constant: 0),
        fourView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 0),
        fourView.widthAnchor.constraint(equalToConstant: 400),
        fourView.heightAnchor.constraint(equalToConstant: 400),
        
        fifveView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
        fifveView.topAnchor.constraint(equalTo: fourView.topAnchor, constant: 0),
        fifveView.widthAnchor.constraint(equalToConstant: 400),
        fifveView.heightAnchor.constraint(equalToConstant: 400),
        fifveView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: 0)

//        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
//        labelTwo.topAnchor.constraint(equalTo: fifveView.bottomAnchor, constant: 50),
//        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40)
      ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImage(named: "NaniBackButton")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: imageView, style: .done, target: self, action: nil)
        self.view.backgroundColor = .white
        addSubView()
        setUpUIConstraints()
        
        
//        firstView.widthAnchor.constraint(equalToConstant: 500).isActive = true
//        firstView.heightAnchor.constraint(equalToConstant: 500).isActive = true
//        firstView.translatesAutoresizingMaskIntoConstraints = false
//        firstView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
//        firstView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
//
//        secondView.widthAnchor.constraint(equalToConstant: 500).isActive = true
//        secondView.heightAnchor.constraint(equalToConstant: 500).isActive = true
//        secondView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
//        secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
//
        

        

//        oneView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 200).isActive = true
//        oneView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 500).isActive = true

//        firstView.leadingAnchor.constraint(equalTo: oneView.leadingAnchor).isActive = true
//        firstView.topAnchor.constraint(equalTo: oneView.bottomAnchor).isActive = true
//
//
//          labelOne.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 100).isActive = true
//          labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true

//        fifveView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//        fifveView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 1000).isActive = true
//        fifveView.bottomAnchor.constraint(equalTo: labelTwo.topAnchor, constant: 0).isActive = true
//
//        labelTwo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40).isActive = true
//        labelTwo.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 2000).isActive = true
//        labelTwo.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -40).isActive = true
        }
}
