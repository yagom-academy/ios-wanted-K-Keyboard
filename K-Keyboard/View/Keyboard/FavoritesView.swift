//
//  FavoritesView.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/08.
//

import UIKit

class FavoritesView: UIView {
    
    var items: [String] = ["안녕하세요~", "감사합니다!", "지금 가는 중이야!"]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.259, green: 0.767, blue: 0.298, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        label.attributedText = NSMutableAttributedString(string: "자주 쓰는 말", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    let favoritesTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        self.favoritesTableView.backgroundColor = .darkGray
        self.backgroundColor = .darkGray

        addViews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("coder:")
    }
}

extension FavoritesView {
    func addViews() {
        [titleLabel, favoritesTableView].forEach { self.addSubview($0) }
    }
    
    func setConstraints() {
        [titleLabel, favoritesTableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            favoritesTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            favoritesTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            favoritesTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            favoritesTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension FavoritesView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        favoritesTableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: FavoritesTableViewCell.identifier)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesTableViewCell.identifier, for: indexPath) as? FavoritesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.favoriteLabel.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
