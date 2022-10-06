//
//  KeywordView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/05.
//

import UIKit

class KeywordView: UIView, FirstViewStyling {
    
    lazy var collectionView: UICollectionView = UICollectionView(frame: self.frame, collectionViewLayout: createLayout())
    private let reuseIdentifier = "KeywordCell"
    
    var titleLabel = UILabel()
    
    var tempArray: [(imageName: String, desc: String)] = [(imageName: "01", desc: "신나💃"), (imageName: "02", desc: "기대💗"), (imageName: "01", desc: "신나💃"), (imageName: "02", desc: "기대💗")]

    init() {
        super.init(frame: .zero)
        initViewHierarchy()
        configureView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16 //왜 이게 아이템 간 간격으로 적용되지...
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        return layout
    }
}

extension KeywordView: Presentable {
    func initViewHierarchy() {
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        self.addSubview(collectionView)
        
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
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 170),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
    }
    
    func configureView() {
        titleLabel.addStyles(style: keywordTitleLabelStyle)
    }
    
    func bind() {
        collectionView.register(KeywordCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension KeywordView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension KeywordView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 130, height: 163)
        return size
    }
}

extension KeywordView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? KeywordCell else { fatalError() }
        cell.configureCell(data: tempArray[indexPath.item])
        return cell
    }
}
