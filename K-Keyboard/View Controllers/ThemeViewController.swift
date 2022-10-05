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
        
    }
    
    private func configureSnapshot() {
        
    }
}

