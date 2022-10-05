//
//  PurchaseReviewListView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

class PurchaseReviewView: UIView, FirstViewStyling {

    var titleLabel: UILabel = UILabel()
    var countLabel = UILabel()
    
    var annotationImageView = UIImageView()
    var themeInfoLabel = UILabel()
    var chevronImageView = UIImageView()
    
    var tableView = UITableView()
    
    var reuseIdentifier = "ReviewCell"
    
    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PurchaseReviewView: Presentable {
    func initViewHierarchy() {
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        self.addSubview(countLabel)
        self.addSubview(annotationImageView)
        self.addSubview(themeInfoLabel)
        self.addSubview(chevronImageView)
        self.addSubview(tableView)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 24)
        ]
        
        constraint += [
            countLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            countLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor)
        ]
        
        constraint += [
            annotationImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18.33),
            annotationImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            annotationImageView.heightAnchor.constraint(equalToConstant: 13.33),
            annotationImageView.widthAnchor.constraint(equalTo: annotationImageView.heightAnchor)
        ]
        
        constraint += [
            themeInfoLabel.centerYAnchor.constraint(equalTo: annotationImageView.centerYAnchor),
            themeInfoLabel.leadingAnchor.constraint(equalTo: annotationImageView.trailingAnchor, constant: 11.33),
            themeInfoLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor)
        ]
        
        constraint += [
            chevronImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            chevronImageView.centerYAnchor.constraint(equalTo: themeInfoLabel.centerYAnchor)
        ]
        
        constraint += [
            tableView.topAnchor.constraint(equalTo: themeInfoLabel.bottomAnchor, constant: 13.0),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
    }
    
    // TODO: 디자인 입히기
    func configureView() {
        titleLabel.text = "구매리뷰"
        countLabel.text = "\(10)"
        
        annotationImageView.image = UIImage(named: "annotation")
        chevronImageView.image = UIImage(named: "chevron")
        themeInfoLabel.text = "테마를 구매해야 리뷰를 남길 수 있습니다"
    }
    
    func bind() {
        tableView.register(ReviewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 120
    }
}

extension PurchaseReviewView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // TODO: uitableview automatic height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension PurchaseReviewView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ReviewCell else { fatalError() }
        
        return cell
    }
    
    
}
