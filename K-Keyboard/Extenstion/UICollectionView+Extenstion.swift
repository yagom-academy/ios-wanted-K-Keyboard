//
//  UICollectionView+Extenstion.swift
//  K-Keyboard
//
//  Created by 김지인 on 2022/10/06.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeuReusableCell<Cell: UICollectionViewCell>(type: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: type), for: indexPath) as? Cell else {
            fatalError("identifier: \(String(describing: type)) can not dequeue cell")
        }
        return cell
    }
        
    
}
