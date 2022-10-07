//
//  TagCell.swift
//  K-Keyboard
//
//  Created by 박호현 on 2022/10/04.
//

import UIKit

class TagCell: UITableViewCell {
    static var identifier: String { String(describing: self) }
    var data: [TagData] = []
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpTableView()
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setUpTableView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: TagItemCell.identifier, bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: TagItemCell.identifier)
    }
    
    func set(data: [TagData]) {
        self.data = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension TagCell: UICollectionViewDelegate {
    
}

extension TagCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagItemCell.identifier, for: indexPath)
        (cell as? TagItemCell)?.set(data: data[indexPath.row])
        return cell
    }
    
}

extension TagCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let font = UIFont.init(name: "NotoSansKR-Medium", size: 14) {
            let widthSize = data[indexPath.row].tag.width(withConstrainedHeight: 28, font: font)
            return CGSize(width: widthSize + 20.6, height: 28)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
        //itemSpacing 간격
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
