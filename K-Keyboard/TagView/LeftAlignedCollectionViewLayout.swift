//
//  TagCollectionViewLayout.swift
//  K-Keyboard
//
//  Created by CodeCamper on 2022/10/07.
//

import Foundation
import UIKit

class LeftAlignedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)?.map { $0.copy() } as? [UICollectionViewLayoutAttributes]

        var nextX = CGFloat.zero
        var maxY = CGFloat.zero
        attributes?.forEach { layoutAttribute in
            if layoutAttribute.frame.origin.y >= maxY {
                nextX = .zero
            }

            layoutAttribute.frame.origin.x = nextX

            nextX += layoutAttribute.frame.width + minimumInteritemSpacing
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }

        return attributes
    }
}
