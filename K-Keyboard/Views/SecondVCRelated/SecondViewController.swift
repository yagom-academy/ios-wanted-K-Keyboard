//
//  SecondViewController.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import UIKit

class SecondViewController: UIViewController, SecondViewControllerRoutable {
    
    var model: SecondModel
    
    let secondView = SecondView()
    
    init(viewModel: SecondModel) {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SecondViewController: Presentable {
    func initViewHierarchy() {
        self.view = UIView()
        self.view.backgroundColor = .clear
        
        self.view.addSubview(secondView)
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            secondView.topAnchor.constraint(equalTo: self.view.topAnchor),
            secondView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            secondView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            secondView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ]
        
    }
    
    func configureView() {
        
    }
    
    func bind() {
        
    }
    
    
}
