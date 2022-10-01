//
//  PurchaseReviewView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/01.
//

import UIKit
class PurchaseReviewView: UIView {
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let buy : UILabel = {
        let buy = UILabel()
        //            buy.frame = CGRect(x: 0, y: 0, width: 500  , height: 500)
        buy.translatesAutoresizingMaskIntoConstraints = false
        //            buy.textAlignment = .center
        buy.text = "구매 리뷰"
        buy.textColor = .black
        return buy
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    private func commonInit(){
        self.backgroundColor = .red
        self.addSubview(buy)
        self.addSubview(tableView)
        constraintCustomView()
        setupView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            buy.topAnchor.constraint(equalTo: self.topAnchor),
            buy.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buy.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buy.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    private func setupView() {
        // tableView.register(PurchaseReviewTableViewCell.self, forCellWithReuseIdentifier: PurchaseReviewTableViewCell.identifier)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension PurchaseReviewView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseReviewTableViewCell",for: indexPath)
                as? PurchaseReviewTableViewCell else {fatalError()}
        
        return cell
    }
}
