//
//  SecondViewController.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import UIKit

class SecondViewController: UIViewController, SecondViewControllerRoutable {
    
    var model: SecondModel
    
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
        self.view.backgroundColor = .white
    }
    
    func configureView() {
        
    }
    
    func bind() {
        
    }
    
    
}
