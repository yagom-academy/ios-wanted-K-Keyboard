//
//  ThemeViewController+.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import UIKit

extension ThemeViewController {
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layout in
    
            let spacing = CGFloat(16)
            let sectionSpacing = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
            let wideSectionSpacint = NSDirectionalEdgeInsets(top: spacing, leading: 0, bottom: spacing, trailing: 0)
            
            switch sectionIndex {
            case Section.event.rawValue:
                let item = NSCollectionLayoutItem(layoutSize: Section.event.itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: Section.event.groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = sectionSpacing
                return section
            case Section.tag.rawValue:
                let item = NSCollectionLayoutItem(layoutSize: Section.tag.itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: Section.tag.groupSize, subitems: [item])
                group.interItemSpacing = .fixed(spacing)
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = sectionSpacing
                return section
            case Section.reaction.rawValue:
                let item = NSCollectionLayoutItem(layoutSize: Section.reaction.itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: Section.reaction.groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = sectionSpacing
                section.orthogonalScrollingBehavior = .continuous
                return section
            case Section.opinion.rawValue:
                let item = NSCollectionLayoutItem(layoutSize: Section.opinion.itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: Section.opinion.groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = sectionSpacing
                return section
            case Section.banner.rawValue:
                let item = NSCollectionLayoutItem(layoutSize: Section.banner.itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: Section.banner.groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = wideSectionSpacint
                return section
            default:
                let item = NSCollectionLayoutItem(layoutSize: Section.review.itemSize)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: Section.review.groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = spacing
                section.contentInsets = sectionSpacing
                return section
            }
        }
        return layout
    }
}
