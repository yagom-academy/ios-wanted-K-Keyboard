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
}
