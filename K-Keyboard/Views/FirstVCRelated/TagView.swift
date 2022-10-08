//
//  TagView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

class TagView: UIView, FirstViewStyling {

    
    lazy var collectionView: UICollectionView = UICollectionView(frame: self.frame, collectionViewLayout: createTagLayout())
    private let reuseIdentifier = "TagCell"
    
    var titleLabel: UILabel = UILabel()
    
    var tempArray: [String] = ["이벤트", "캐릭터", "새", "동물", "앙증맞은", "동글동글"]
    
    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // TODO: 레이아웃 수정하여 디자인에 맞게 나오도록
    private func createTagLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(60), heightDimension: .absolute(28))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        group.interItemSpacing = .fixed(4.12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.configuration = config
        
        return layout
    }
    
    
}

extension TagView: Presentable {
    func initViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(collectionView)
        
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        var constraint: [NSLayoutConstraint] = []
        defer { NSLayoutConstraint.activate(constraint) }
        
        constraint += [
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        ]
        
        constraint += [
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 70),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
    }
    
    func configureView() {
        titleLabel.addStyles(style: tagTitleStyle)
        collectionView.isScrollEnabled = true
    }
    
    func bind() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    
}

extension TagView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //선택시 할것. 지금은 별 기능 없이 그냥 블랭크
    }
}

extension TagView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? TagCell else { fatalError() }
        
        cell.configureCell(tagName: tempArray[indexPath.item])
        
        return cell
    }
    
    
}
