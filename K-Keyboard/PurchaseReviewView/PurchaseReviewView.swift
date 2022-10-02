//
//  PurchaseReviewView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/01.
//

import UIKit
class PurchaseReviewView: UIView {
    let imageView = UIImageView(image: UIImage(named: "7"))
    let ims = UIImage(named: "uesr")
    //    let uesrimage = UIImageView(image: UIImage(named: "uesr"))
    let idstring :  [String] = ["크리에이터명","o달빔o","o달빔o","o달빔o"]
    let timeLabel : [String] = ["1일","1초","1분","2분"]
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let buy : UILabel = {
        let buy = UILabel()
        //            buy.frame = CGRect(x: 0, y: 0, width: 500  , height: 500)
        buy.translatesAutoresizingMaskIntoConstraints = false
        //            buy.textAlignment = .center
        buy.text = "구매 리뷰"
        buy.textColor = .black
        return buy
    }()
    let buycount : UILabel = {
        let buycount = UILabel()
        //            buy.frame = CGRect(x: 0, y: 0, width: 500  , height: 500)
        buycount.translatesAutoresizingMaskIntoConstraints = false
        //            buy.textAlignment = .center
        buycount.text = "10"
        buycount.textColor = .black
        return buycount
    }()
    let 구매리뷰 : UILabel = {
        let buy = UILabel()
        //            buy.frame = CGRect(x: 0, y: 0, width: 500  , height: 500)
        buy.translatesAutoresizingMaskIntoConstraints = false
        //            buy.textAlignment = .center
        buy.text = "테마를 구매해야 리뷰를 남길 수 있어요."
        buy.textColor = .black
        return buy
    }()
    
    let collectionView : UICollectionView = {
        let collectionView = UICollectionViewFlowLayout()
        collectionView.minimumInteritemSpacing = 30
        collectionView.minimumLineSpacing = 30
        collectionView.scrollDirection = .horizontal
        collectionView.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private func setupView() {
        collectionView.register(PurchaseReviewTableViewCell.self, forCellWithReuseIdentifier: PurchaseReviewTableViewCell.identifier)
        //        collectionView.delegate = self
        //컬렉션뷰 크기
        collectionView.heightAnchor.constraint(equalToConstant: 400).isActive = true
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
        //        self.backgroundColor = .red
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buy)
        self.addSubview(buycount)
        self.addSubview(구매리뷰)
        self.addSubview(collectionView)
        constraintCustomView()
        setupView()
    }
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: -16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 16),
            //            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
            buy.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 48),
            buy.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            //            buy.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buycount.topAnchor.constraint(equalTo: buy.topAnchor),
            buycount.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 75),
            buycount.trailingAnchor.constraint(equalTo: trailingAnchor),
            //            buycount.leadingAnchor.constraint(equalTo: buy.trailingAnchor,constant: 10),
            //            buycount.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 100),
            구매리뷰.topAnchor.constraint(equalTo: buy.bottomAnchor,constant: 10),
            구매리뷰.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 40),
            구매리뷰.trailingAnchor.constraint(equalTo: trailingAnchor),
            //            구매리뷰.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: 구매리뷰.bottomAnchor,constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            
            
        ])
    }
}
extension PurchaseReviewView: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return idstring.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PurchaseReviewTableViewCell", for: indexPath) as? PurchaseReviewTableViewCell else {return PurchaseReviewTableViewCell()}
        cell.uesrimage.image = ims
        cell.idLabel.text = idstring[indexPath.row]
        cell.timeLabel.text = timeLabel[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400 , height: 300)
    }
    
}
