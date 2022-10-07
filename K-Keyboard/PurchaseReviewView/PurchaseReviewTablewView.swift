//
//  PurchaseReviewTablewView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/06.
//

import UIKit

class PurchaseReviewTablewView: UITableView {
    
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
