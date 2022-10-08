//
//  KeywordTableViewCell.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/07.
//

import UIKit

class KeywordTableViewCell: UITableViewCell, ViewRepresent {
    
    static let identifier = "KeywordTableViewCell"
    let keyword = ["신나💃","기대💗","놀이💗"]
    
    let keywordLabel: UILabel = {
        let view = UILabel()
        view.text = "이런 키워드에 반응해요"
        view.textColor = .customBlack()
        view.font = .NotoSanKR(weight: .Bold, size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let collectionViewFlowLayout: LeftAlignedCollectionViewFlowLayout = {
        let flowLayout = LeftAlignedCollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let width = UIScreen.main.bounds.width - (spacing * 4)
        flowLayout.itemSize = CGSize(width: width / 2.5, height: (width / 3) * 1.5)
        flowLayout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        flowLayout.minimumInteritemSpacing = spacing
        flowLayout.minimumLineSpacing = spacing
        flowLayout.scrollDirection = .horizontal
        return flowLayout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.clipsToBounds = false
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        collectionView.register(KeywordCollectionViewCell.self, forCellWithReuseIdentifier: KeywordCollectionViewCell.identifier)
        
        [keywordLabel, collectionView].forEach {
            addSubview($0)
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            keywordLabel.topAnchor.constraint(equalTo: topAnchor),
            keywordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            keywordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            collectionView.topAnchor.constraint(equalTo: keywordLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
            
        ])
    }
    
}

extension KeywordTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keyword.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = indexPath.item
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCollectionViewCell.identifier, for: indexPath) as? KeywordCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.imageView.image = UIImage(named: "emoji\(item+1)")
        cell.keywordLabel.text = keyword[item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    
}

//컬렉션뷰가 터치 이벤트가 가능하도록함
extension UITableViewCell {
    open override func addSubview(_ view: UIView) {
        super.addSubview(view)
        sendSubviewToBack(contentView)
    }
}
