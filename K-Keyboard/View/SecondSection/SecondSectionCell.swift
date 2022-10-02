//
//  SecondSectionCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/02.
//

import UIKit

class SecondSectionCell: UITableViewCell {

    static let identifier = "section2"
    var items: [String] = ["이벤트", "캐릭터", "새", "동물", "앙증맞은", "동글"]
    
    lazy var tagCollectionView: UICollectionView = TagCollectionView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setConstraints()
        
        self.tagCollectionView.dataSource = self
        
        self.contentView.addSubview(self.tagCollectionView)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondSectionCell {
    func addViews() {
        [tagCollectionView].forEach {
            contentView.addSubview($0)
        }
    }
    func setConstraints() {
        [tagCollectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            tagCollectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            tagCollectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            tagCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tagCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension SecondSectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.tagCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.tagLabel.text = self.items[indexPath.row]
        return cell
    }
}

extension SecondSectionCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "NotoSansKR-Medium", size: 14)
            label.text = self.items[indexPath.row]
            return label
        }()
        
        let size = label.frame.size
        let widthMargin = 10.3
        let heightMargin = 4.0
        
        return CGSize(width: size.width + (2 * widthMargin), height: size.height + (2 * heightMargin))
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SecondSectionCellPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = SecondSectionCell(frame: .zero)
            return cell
        }.previewLayout(.fixed(width: 343, height: 544))
    }
}
#endif
