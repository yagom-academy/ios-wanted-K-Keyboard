//
//  TagCollectionView.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/02.
//

import UIKit

class TagCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let collectionViewFlowLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 8.0
            layout.minimumInteritemSpacing = 0
            return layout
        }()
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

