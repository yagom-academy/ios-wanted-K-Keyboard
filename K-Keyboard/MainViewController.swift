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
    
    let fourView: FourView = {
        let view = FourView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    let fifveView: FifveView = {
        let view = FifveView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
            
        
        firstView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 0),
        firstView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
        firstView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: 16),
//        firstView.bottomAnchor.constraint(equalTo: secondView.topAnchor),
        
        secondView.topAnchor.constraint(equalTo: firstView.bottomAnchor,constant: 0),
        secondView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
        secondView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: 16),
    
        
        thirdView.topAnchor.constraint(equalTo: secondView.bottomAnchor),
        thirdView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
        thirdView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: 16),
        
       
        fourView.topAnchor.constraint(equalTo: thirdView.bottomAnchor),
        fourView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
        fourView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: 16),


        fifveView.topAnchor.constraint(equalTo: fourView.bottomAnchor),
        fifveView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
        fifveView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: 16),
        fifveView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor,constant: 16),

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
