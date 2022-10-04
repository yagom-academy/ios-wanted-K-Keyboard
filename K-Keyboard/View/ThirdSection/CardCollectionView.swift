//
//  CardCollectionView.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/05.
//

import UIKit

class CardCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let collectionViewFlowLayout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 16
            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
            layout.scrollDirection = .horizontal
            return layout
        }()
        super.init(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
    }
    
    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
