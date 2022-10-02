//
//  FourView.swift
//  K-Keyboard
//
//  Created by so on 2022/09/30.
//

import UIKit

class ThemaView: UIView {
    
    let buy : UILabel = {
        let buy = UILabel()
        //        buy.frame = CGRect(x: 0, y: 0, width: 63, height: 24)
        buy.translatesAutoresizingMaskIntoConstraints = false
        buy.text = "이 테마를 어떻게 생각하나요?"
        buy.textColor = .black
        return buy
    }()
    let immoge: [String] = ["☺️","😍","😉","🤣"]
    var b1 : [String] = ["마음에들어요", "심쿵했어요", "응원해요","갖고싶어요"]
    var c1 : [String] = ["0","1","0","0"]
    
    let collectionView : UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        //        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //        let layout = UICollectionViewFlowLayout()
        collectionView.minimumInteritemSpacing = 10
        collectionView.minimumLineSpacing = 10
        collectionView.scrollDirection = .vertical
        collectionView.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private func setupView() {
        collectionView.register(ThemaCollectionViewCell.self, forCellWithReuseIdentifier: ThemaCollectionViewCell.identifier)
        //        collectionView.delegate = self
        
        //컬렉션뷰 크기
        collectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        collectionView.dataSource = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    private func commonInit(){
        self.addSubview(buy)
        addSubview(collectionView)
        
        
        constraintCustomView()
        setupView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            buy.topAnchor.constraint(equalTo: self.topAnchor),
            buy.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buy.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            //            buy.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: buy.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: buy.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: buy.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            
        ])
    }
}
extension ThemaView: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThemaCollectionViewCell", for: indexPath) as? ThemaCollectionViewCell else {return ThemaCollectionViewCell()}
        cell.imoge.text = immoge[indexPath.row]
        cell.feel.text = b1[indexPath.row]
        cell.count.text = c1[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200 , height: 200)
    }
    
}
//extension ThemaView: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 300, height: 300)
//    }
//}



