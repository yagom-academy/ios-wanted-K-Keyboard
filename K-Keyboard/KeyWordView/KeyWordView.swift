//
//  ThirdView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit
import SwiftUI

class KeyWordView: UIView {
    let dataArry : [KeyWordModel] = [
        .init(title: "신나💃", image: UIImage(named: "01")),
        .init(title: "기대💗", image: UIImage(named: "02")),
        .init(title: "놀이💗", image: UIImage(named: "03"))
    ]
    var colors: [UIColor] = [.systemRed, .systemIndigo, .systemBlue, .systemTeal, .systemYellow, .cyan, .brown]
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    let titles : UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.text = "이런 키워드에 반응해요"
        title.font = UIFont(name: "Bold", size: 20)
        title.textColor = .black
        return title
    }()
    let collectionView : UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.minimumInteritemSpacing = 1
        collectionView.minimumLineSpacing = 16
        collectionView.scrollDirection = .horizontal
        collectionView.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        self.backgroundColor = .white
        self.addSubview(titles)
        self.addSubview(collectionView)
        constraintCustomView()
        setupView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            titles.topAnchor.constraint(equalTo: topAnchor,constant: 0),
            titles.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            
            collectionView.topAnchor.constraint(equalTo: titles.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    private func setupView() {
        collectionView.register(KeyWordViewCell.self, forCellWithReuseIdentifier: KeyWordViewCell.identifier)
        collectionView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension KeyWordView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArry.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeyWordViewCell", for: indexPath) as? KeyWordViewCell else {return KeyWordViewCell()}
        
        cell.model = dataArry[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//                    let width = collectionView.frame.width
//                    let height = collectionView.frame.height
//                print(width,height)
//                    let itemsPerRow: CGFloat = 2
//                    let widthPadding = sectionInsets.left * (itemsPerRow + 1)
//                    let itemsPerColumn: CGFloat = 3
//                    let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
//                    let cellWidth = (width - widthPadding) / itemsPerRow
//                    let cellHeight = (height - heightPadding) / itemsPerColumn
//        print(cellWidth,cellHeight)
//                    return CGSize(width: cellWidth, height: cellHeight)
        
        //343.0 165.66666666666666  콜렉션뷰 가로 높이
        //        156.5 41.888888888888886   셀 가로 높이
        //          return CGSize(width: 10 * Int.random(in: 5...10) , height: 10 * Int.random(in: 5...10))
        return CGSize(width: 129 , height: 162)
    }
}

#if canImport(SwiftUI) && DEBUG
struct PeereviewViewController<View: UIView> : UIViewRepresentable {
    
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
struct ThirdViewPreviewProvider: PreviewProvider {
    static var previews: some View {
        PeereviewViewController {
            let view = KeyWordView()
            return view
        }.previewLayout(.fixed(width: 700, height: 700))
    }
}

#endif


