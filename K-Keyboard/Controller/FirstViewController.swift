//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class FirstViewController: UIViewController {

    let firstCollectionView = FirstCollectionView()
    let firstFooterView: UIView = {
        let view = UIView()
        view.backgroundColor = .green

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        addViews()
        setConstraints()
    }
}

extension FirstViewController {
    func addViews() {
        [firstCollectionView, firstFooterView].forEach { self.view.addSubview($0) }
    }

    func setConstraints() {
        [firstCollectionView, firstFooterView].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        firstFooterView.backgroundColor = .darkGray

        NSLayoutConstraint.activate([
            firstCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstFooterView.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor),
            firstFooterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            firstFooterView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            firstFooterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            firstFooterView.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        return UICollectionViewCell()
    }
}
