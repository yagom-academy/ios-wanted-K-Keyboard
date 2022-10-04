//
//  FirstViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class FirstViewController: UIViewController, FirstViewControllerRoutable {

    var model: FirstModel
    
    var scrollView = UIScrollView()
    lazy var keyboardView = KeyboardView()
    lazy var descriptionView = DescriptionView()
    
    lazy var test1 = KeyboardView()
    lazy var test2 = KeyboardView()
    lazy var test3 = KeyboardView()
    
    init(viewModel: FirstModel) {
        self.model = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        initViewHierarchy()
        configureView()
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FirstViewController: Presentable {
    func initViewHierarchy() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(keyboardView)
        scrollView.addSubview(descriptionView)
        
        scrollView.addSubview(test1)
        scrollView.addSubview(test2)
        scrollView.addSubview(test3)
     
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        test1.translatesAutoresizingMaskIntoConstraints = false
        test2.translatesAutoresizingMaskIntoConstraints = false
        test3.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        constraint += [
            keyboardView.topAnchor.constraint(equalTo: scrollView.topAnchor), //scrollView topAnchor와 첫번째 UIView의 topAnchor가 어떻게 걸렸는지가 중요함
            keyboardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            keyboardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            keyboardView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            descriptionView.topAnchor.constraint(equalTo: keyboardView.bottomAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            descriptionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            descriptionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            test1.topAnchor.constraint(equalTo: descriptionView.bottomAnchor),
            test1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            test1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            test1.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            test1.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            test2.topAnchor.constraint(equalTo: test1.bottomAnchor),
            test2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            test2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            test2.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            test2.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)
        ]
        
        constraint += [
            test3.topAnchor.constraint(equalTo: test2.bottomAnchor),
            test3.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            test3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            test3.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            test3.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            test3.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor) //scrollView bottomAnchor와 마지막 UIView의 bottomAnchor가 어떻게 걸렸는지가 중요함
        ]
        
    }
    
    func configureView() {
        scrollView.backgroundColor = .blue
    }
    
    func bind() {
        model.routeSubject = { [weak self] scene in
            guard let self = self else { return }
            self.route(to: scene)
        }
    }
    
    
}

