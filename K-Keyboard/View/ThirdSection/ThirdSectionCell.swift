//
//  ThirdSectionCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/03.
//

import UIKit

class ThirdSectionCell: UITableViewCell {

    static let identifier = "section3"
    
    var items: [(String, String)] = [("01" , "신나💃"), ("02" , "기대💗"), ("02" , "놀이💗")]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.01
        label.attributedText = NSMutableAttributedString(string: "이런 키워드에 반응해요", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    lazy var cardCollectionView: UICollectionView = CardCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.cardCollectionView.delegate = self
        self.cardCollectionView.dataSource = self
        self.cardCollectionView.showsHorizontalScrollIndicator = false
        addViews()
        setConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ThirdSectionCell {
    func addViews() {
        [titleLabel, cardCollectionView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setConstraints() {
        [titleLabel, cardCollectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -31),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            cardCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -48),
            cardCollectionView.heightAnchor.constraint(equalToConstant: 166)
        ])
    }
}

extension ThirdSectionCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.cardCollectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.cardView.configure(cardImageStr: items[indexPath.row].0, cardLabelStr: items[indexPath.row].1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 129, height: 162)
    }
}
