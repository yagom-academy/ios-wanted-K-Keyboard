//
//  ContentSizedCollectionView.swift
//  K-Keyboard
//
//  Created by CodeCamper on 2022/10/07.
//

import Foundation
import UIKit

class ContentSizedCollectionView: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
