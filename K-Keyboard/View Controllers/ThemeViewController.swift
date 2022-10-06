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
        
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, identifier -> UICollectionViewCell? in
                switch identifier {
                case .event(let event):
                    return collectionView.dequeueConfiguredReusableCell(using: eventCellRegistration, for: indexPath, item: event)
                case .tag(let tag):
                    return collectionView.dequeueConfiguredReusableCell(using: tagCellRegistration, for: indexPath, item: tag)
                case .reaction(let reaction):
                    return collectionView.dequeueConfiguredReusableCell(using: reactionCellRegistration, for: indexPath, item: reaction)
                case .opinion(let opinion):
                    return collectionView.dequeueConfiguredReusableCell(using: opinionCellRegistration, for: indexPath, item: opinion)
                case .banner(let banner):
                    return collectionView.dequeueConfiguredReusableCell(using: bannerCellRegistration, for: indexPath, item: banner)
                case .review(let review):
                    return collectionView.dequeueConfiguredReusableCell(using: reviewCellRegistration, for: indexPath, item: review)
                }
            })
        
        dataSource.supplementaryViewProvider = { view, kind, index in
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
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        Section.allCases.forEach { section in
            snapshot.appendSections([section])
            snapshot.appendItems(MockDataController.shared.items(for: section), toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

/// - CellRegistration
extension ThemeViewController {
    private func eventCellRegistration() -> UICollectionView.CellRegistration<EventCell, Event> {
        return UICollectionView.CellRegistration { (cell, indexPath, event) in
            cell.contentLabel.text = event.content
        }
    }
    
    private func tagCellRegistration() -> UICollectionView.CellRegistration<TagCell, Tag> {
        return UICollectionView.CellRegistration { (cell, indexPath, tag) in
            cell.tagButton.setTitle(tag.keyword, for: .normal)
        }
    }
    
    private func reactionCellRegistration() -> UICollectionView.CellRegistration<ReactionCell, Reaction> {
        return UICollectionView.CellRegistration { (cell, indexPath, reaction) in
            cell.imageView.image = UIImage(named: reaction.imagePath)
            cell.keywordLabel.text = reaction.keyword
        }
    }
    
    private func opinionCellRegistration() -> UICollectionView.CellRegistration<OpinionCell, Opinion> {
        return UICollectionView.CellRegistration { (cell, indexPath, opinion) in
            cell.imageLabel.text = opinion.emoji
            cell.keywordLabel.text = opinion.keyword
            cell.countLabel.text = String(opinion.count)
        }
    }
    
    private func bannerCellRegistration() -> UICollectionView.CellRegistration<BannerCell, Banner> {
        return UICollectionView.CellRegistration { cell, indexPath, banner in
            cell.bannerView.image = UIImage(named: banner.imagePath)
        }
    }
    
    private func reviewCellRegistration() -> UICollectionView.CellRegistration<ReviewCell, Review> {
        return UICollectionView.CellRegistration { cell, indexPath, review in
            cell.updateUI(review)
        }
    }
    
    private func sectionHeaderViewRegistration() -> UICollectionView.SupplementaryRegistration<SectionHeaderView> {
        return UICollectionView.SupplementaryRegistration<SectionHeaderView>(
            elementKind: SectionHeaderView.elementKind,
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
