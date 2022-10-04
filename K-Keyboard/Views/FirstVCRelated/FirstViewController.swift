//
//  FirstViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class FirstViewController: UIViewController, FirstViewControllerRoutable {

    var model: FirstModel
    
    var firstView = FirstView()
    
    lazy var testButtonView: TestButtonView = TestButtonView(viewModel: self.model.testButtonViewModel)
    
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
        // Do any additional setup after loading the view.
    }
}

extension FirstViewController: Presentable {
    func initViewHierarchy() {
        self.view = UIView()
        self.view.backgroundColor = .white
        
        self.view.addSubview(firstView)
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
                
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            firstView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            firstView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            firstView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            firstView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
                ]
    }
    
    func configureView() {
        
    }
    
    func bind() {
        model.routeSubject = { [weak self] scene in
            guard let self = self else { return }
            self.route(to: scene)
        }
    }
    
    
}

