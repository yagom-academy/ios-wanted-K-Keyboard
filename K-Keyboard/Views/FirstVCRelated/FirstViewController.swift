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
     
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        keyboardView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        constraint += [
            keyboardView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            keyboardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            keyboardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            keyboardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            keyboardView.heightAnchor.constraint(equalToConstant: 516)
        ]
        
        constraint += [
            descriptionView.topAnchor.constraint(equalTo: keyboardView.bottomAnchor),
            descriptionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            descriptionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            descriptionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            descriptionView.heightAnchor.constraint(equalToConstant: 128)
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

