//
//  SecondView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit
import SwiftUI

class TagView: UIView {
    // MARK: View Components
    lazy var title: UILabel = {
        let title = UILabel()
        title.text = "태그"
        title.font = .appleSDGothicNeo(weight: .bold, size: 16)
        title.textColor = UIColor(hex: "#42444C")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 8
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = ContentSizedCollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: Properties
    var didSetupConstraints = false
    var tags: [String] = ["이벤트", "캐릭터", "새", "동물", "앙증맞은", "동글동글"]
    
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        buildViewHierarchy()
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if !didSetupConstraints {
            self.setupConstraints()
            didSetupConstraints = true
        }
        super.updateConstraints()
    }
    
    // MARK: Setup Views
    func setupViews() {
        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        collectionView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    // MARK: Build View Hierarchy
    func buildViewHierarchy() {
        self.addSubview(title)
        self.addSubview(collectionView)
    }
    
    
    // MARK: Layout Views
    func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        
        defer { NSLayoutConstraint.activate(constraints) }
        
        constraints += [
            title.topAnchor.constraint(equalTo: self.topAnchor,constant: 0),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0),
            
            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ]
    }
}

extension TagView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as? TagCollectionViewCell else { return TagCollectionViewCell() }
        cell.configureCell("\(tags[indexPath.row])")
        
        return cell
    }
}

#if canImport(SwiftUI) && DEBUG
struct PereviewViewController<View: UIView> : UIViewRepresentable {
    
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    func makeUIView(context: Context) -> some UIView {
        view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}

#endif

#if canImport(SwiftUI) && DEBUG
struct SecondViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        PereviewViewController {
            let view = TagView()
            return view
        }.previewLayout(.fixed(width: 600, height: 600))
    }
}

#endif

