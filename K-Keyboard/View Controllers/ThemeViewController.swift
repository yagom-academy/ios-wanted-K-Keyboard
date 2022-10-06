//
//  ThemeViewController.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import UIKit

final class ThemeViewController: UIViewController {
    
    var collectionView: UICollectionView! = nil
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureDataSource()
        configureSnapshot()
    }
    
    private func configureHierarchy() {
        collectionView = UICollectionView.init(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        let eventCellRegistration = eventCellRegistration()
        let tagCellRegistration = tagCellRegistration()
        let reactionCellRegistration = reactionCellRegistration()
        let opinionCellRegistration = opinionCellRegistration()
        let bannerCellRegistration = bannerCellRegistration()
        let reviewCellRegistration = reviewCellRegistration()
        let sectionHeaderViewRegistration = sectionHeaderViewRegistration()
        let headerViewRegistration = headerViewRegistration()
        let footerViewRegistration = footerViewRegistration()
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, identifier) -> UICollectionViewCell? in
            
            switch indexPath.section {
            case Section.event.rawValue:
                return collectionView.dequeueConfiguredReusableCell(using: eventCellRegistration, for: indexPath, item: identifier)
            case Section.tag.rawValue:
                return collectionView.dequeueConfiguredReusableCell(using: tagCellRegistration, for: indexPath, item: identifier)
            case Section.reaction.rawValue:
                return collectionView.dequeueConfiguredReusableCell(using: reactionCellRegistration, for: indexPath, item: identifier)
            case Section.opinion.rawValue:
                return collectionView.dequeueConfiguredReusableCell(using: opinionCellRegistration, for: indexPath, item: identifier)
            case Section.banner.rawValue:
                return collectionView.dequeueConfiguredReusableCell(using: bannerCellRegistration, for: indexPath, item: identifier)
            case Section.review.rawValue:
                return collectionView.dequeueConfiguredReusableCell(using: reviewCellRegistration, for: indexPath, item: identifier)
            default:
                return UICollectionViewCell()
            }
        })
        
        dataSource.supplementaryViewProvider = { (view, kind, index) in
            switch kind {
            case SectionHeaderView.elementKind:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: sectionHeaderViewRegistration,
                                                                                  for: index)
            case HeaderView.elementKind:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerViewRegistration,
                                                                                   for: index)
            case FooterView.elementKind:
                return self.collectionView.dequeueConfiguredReusableSupplementary(using: footerViewRegistration, for: index)
            default: break
            }
            return nil
        }
    }
    
    private func configureSnapshot() {
        let eventItems = MockDataController.generateItems().filter { $0.itemType == .event }
        let tagItems = MockDataController.generateItems().filter { $0.itemType == .tag }
        let reactionItems = MockDataController.generateItems().filter({ $0.itemType == .reaction })
        let opinionItems = MockDataController.generateItems().filter({ $0.itemType == .opinion })
        let bannerItems = MockDataController.generateItems().filter({ $0.itemType == .banner })
        let reviewItems = MockDataController.generateItems().filter({ $0.itemType == .review })

        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        Section.allCases.forEach { section in
            snapshot.appendSections([section])
        }

        snapshot.appendItems(eventItems, toSection: .event)
        snapshot.appendItems(tagItems, toSection: .tag)
        snapshot.appendItems(reactionItems, toSection: .reaction)
        snapshot.appendItems(opinionItems, toSection: .opinion)
        snapshot.appendItems(bannerItems, toSection: .banner)
        snapshot.appendItems(reviewItems, toSection: .review)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

/// - CellRegistration
extension ThemeViewController {
    private func eventCellRegistration() -> UICollectionView.CellRegistration<EventCell, Item> {
        return UICollectionView.CellRegistration { (cell, indexPath, event) in
            cell.contentLabel.text = event.content
        }
    }
    
    private func tagCellRegistration() -> UICollectionView.CellRegistration<TagCell, Item> {
        return UICollectionView.CellRegistration { (cell, indexPath, tag) in
            cell.tagButton.setTitle(tag.keyword, for: .normal)
        }
    }
    
    private func reactionCellRegistration() -> UICollectionView.CellRegistration<ReactionCell, Item> {
        return UICollectionView.CellRegistration { (cell, indexPath, reaction) in
            cell.imageView.image = UIImage(named: reaction.imagePath ?? "Please check -- imagePath")
            cell.keywordLabel.text = reaction.keyword
        }
    }
    
    private func opinionCellRegistration() -> UICollectionView.CellRegistration<OpinionCell, Item> {
        return UICollectionView.CellRegistration { (cell, indexPath, opinion) in
            cell.imageLabel.text = opinion.emoji
            cell.keywordLabel.text = opinion.keyword
            cell.countLabel.text = String(opinion.count ?? 0)
        }
    }
    
    private func bannerCellRegistration() -> UICollectionView.CellRegistration<BannerCell, Item> {
        return UICollectionView.CellRegistration { cell, indexPath, banner in
            cell.bannerView.image = UIImage(named: banner.imagePath ?? "Please check -- imagePath")
        }
    }
    
    private func reviewCellRegistration() -> UICollectionView.CellRegistration<ReviewCell, Item> {
        return UICollectionView.CellRegistration { cell, indexPath, review in
            cell.updateUI(review)
        }
    }
    
    private func sectionHeaderViewRegistration() -> UICollectionView.SupplementaryRegistration<SectionHeaderView> {
        return UICollectionView.SupplementaryRegistration<SectionHeaderView>(elementKind: SectionHeaderView.elementKind,
                                                                             handler: { supplementaryView, elementKind, indexPath in
            if let reviewSection = Section(rawValue: Section.review.rawValue) {
                if indexPath.section == reviewSection.rawValue {
                    let snapshot = self.dataSource.snapshot()
                    let numberOfReviews = snapshot.numberOfItems(inSection: .review)
                    supplementaryView.updateUI(Section.review.title, numberOfReviews-1)
                }
            }
            supplementaryView.updateUI(Section(rawValue: indexPath.section)?.title ?? "Please check review-title", nil)
        })
    }
    
    private func headerViewRegistration() -> UICollectionView.SupplementaryRegistration<HeaderView> {
        return UICollectionView.SupplementaryRegistration(elementKind: HeaderView.elementKind) { supplementaryView, elementKind, indexPath in
            var owner = Owner(nickName: "크리에이터명", themeName: "앙무", themeNickName: "코핀", themeImagePath: "theme.png")
            owner.numberOfConsumer = 78
            supplementaryView.updateUI(owner: owner)
        }
    }
    
    private func footerViewRegistration() -> UICollectionView.SupplementaryRegistration<FooterView> {
        return UICollectionView.SupplementaryRegistration(elementKind: FooterView.elementKind) { supplementaryView, elementKind, indexPath in
            // TODO: - update할꺼 아직 없음
            supplementaryView.updateUI()
        }
    }
}
