//
//  SupplymentaryItem.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import UIKit

enum SupplymentaryItem: String, CaseIterable {
    case sectionHeader
    case header
    case footer
    
    var size: NSCollectionLayoutSize {
        switch self {
        case .sectionHeader:
            return NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(65))
        case .header, .footer:
            return NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        }
    }
    
    var info: NSCollectionLayoutBoundarySupplementaryItem {
        switch self {
        case .sectionHeader:
            return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: SupplymentaryItem.sectionHeader.size,
                                                               elementKind: SectionHeaderView.elementKind,
                                                             alignment: .top)
        case .header:
            return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: SupplymentaryItem.header.size, elementKind: HeaderView.elementKind, alignment: .top)
        case .footer:
            return NSCollectionLayoutBoundarySupplementaryItem(layoutSize: SupplymentaryItem.footer.size, elementKind: FooterView.elementKind, alignment: .bottom)
        }
    }
}


