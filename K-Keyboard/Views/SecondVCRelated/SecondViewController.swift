//
//  SecondViewController.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import UIKit

class SecondViewController: UIViewController, SecondViewControllerRoutable, SecondViewStyling {
    
    var model: SecondModel
    
    let popupView = PopupView()
    
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
        
        self.view.addSubview(popupView)
        
        popupView.translatesAutoresizingMaskIntoConstraints = false
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            popupView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            popupView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            popupView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40)
        ]
        
    }
    
    func configureView() {
        self.view.layer.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        popupView.addStyles(style: popupViewStyle)
    }
    
    func bind() {
        
    }
    
    
}
