//
//  DynamicHeightCollectionView.swift
//  K-Keyboard
//
//  Created by pablo.jee on 2022/10/06.
//

import UIKit

class DynamicHeightCollectionView: UICollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !__CGSizeEqualToSize(bounds.size, self.intrinsicContentSize) {
            self.invalidateIntrinsicContentSize()
            }
        }
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }

}
