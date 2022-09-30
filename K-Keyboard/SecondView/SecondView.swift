//
//  SecondView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit
import SwiftUI

class SecondView: UIView, UICollectionViewDelegate {
    var heights: [Int] = [60, 200, 150, 30, 80, 170, 200]
    var colors: [UIColor] = [.systemRed, .systemIndigo, .systemBlue, .systemTeal, .systemYellow, .cyan, .brown]
    let titles : UILabel = {
        let title = UILabel()
        title.frame = CGRect(x: 0, y: 0, width: 37, height: 28)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.text = "태그"
        title.font = UIFont(name: "Bold", size: 20)
        title.textColor = .black
        return title
    }()
    let collectionView : UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        let layout = UICollectionViewFlowLayout()
        collectionView.minimumInteritemSpacing = 5
        collectionView.minimumLineSpacing = 5
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
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
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
            titles.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            titles.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0),
            
            collectionView.topAnchor.constraint(equalTo: titles.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    private func setupView() {
        collectionView.register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension SecondView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as? SecondCollectionViewCell else {return SecondCollectionViewCell()}
        
        cell.title.text = "\(heights[indexPath.row])"
        cell.backgroundColor = colors[indexPath.row]
        
        cell.second.text = "2"
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
                let view = SecondView()
                return view
            }.previewLayout(.fixed(width: 600, height: 600))
        }
    }
    
#endif
    
