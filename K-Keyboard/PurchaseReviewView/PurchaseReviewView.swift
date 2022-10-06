//
//  PurchaseReviewView.swift
//  K-Keyboard
//
//  Created by so on 2022/10/01.
//

import UIKit
class PurchaseReviewView: UIView {
    lazy var dataArry: [PurchasReviewModel] = [
        .init(uesrImage: UIImage(named: "uesr"), idLabel: "크리에이터명", infoLabel: "구매해주셔서 감사합니다💖", timeLabel: "1일",declaration: ""),
        .init(uesrImage: UIImage(named: "uesr"), idLabel: "o달빔o", infoLabel: "아진짜 귀여워요 !!!!!", timeLabel: "1초",declaration: "신고"),
        .init(uesrImage: UIImage(named: "uesr"), idLabel: "o달빔o", infoLabel: "아진짜 귀여워요 !!!!!", timeLabel: "1분", declaration: "신고"),
        .init(uesrImage: UIImage(named: "uesr"), idLabel: "o달빔o", infoLabel: "아진짜 귀여워요 !!!!!", timeLabel: "2분", declaration: "신고")
    ] {
        didSet {
            buycount.text = "\(dataArry.count)"
            purchaseTableView.reloadData()
//            collectionView.reloadData()
        }
    }
    let imageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "7"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    let buy : UILabel = {
        let buy = UILabel()
        buy.translatesAutoresizingMaskIntoConstraints = false
        buy.text = "구매 리뷰"
        buy.textColor = .black
        return buy
    }()
    var buycount : UILabel = {
        let buycount = UILabel()
        buycount.translatesAutoresizingMaskIntoConstraints = false
        buycount.text = "0"
        buycount.font = .appleSDGothicNeo(weight: .bold, size: 16)
        buycount.textColor = UIColor(hex: "#FF417D",alpha: 1)
        return buycount
    }()
    let 구매리뷰 : UILabel = {
        let buy = UILabel()
        buy.translatesAutoresizingMaskIntoConstraints = false
        buy.font = .appleSDGothicNeo(weight: .regular, size: 14)
        buy.textColor = UIColor(hex: "#50535C",alpha: 1)
        buy.text = "테마를 구매해야 리뷰를 남길 수 있어요."
        buy.textColor = .black
        return buy
    }()
    let mark : UIImageView = {
        let diamond = UIImageView(image: UIImage(named: "mark"))
        diamond.translatesAutoresizingMaskIntoConstraints = false
        return diamond
    }()
    let under : UIImageView = {
        let diamond = UIImageView(image: UIImage(named: "under"))
        diamond.translatesAutoresizingMaskIntoConstraints = false
        return diamond
    }()
    
//    let collectionView : UICollectionView = {
//        let collectionView = UICollectionViewFlowLayout()
//        collectionView.minimumInteritemSpacing = 5
//        collectionView.minimumLineSpacing = 5
//        collectionView.scrollDirection = .vertical
//        collectionView.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionView)
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        //        cv.backgroundColor = .blue
//        return cv
//    }()
    
    let purchaseTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    private func setupView() {
//        collectionView.register(PurchaseReviewCollectionViewCell.self, forCellWithReuseIdentifier: PurchaseReviewCollectionViewCell.identifier)
        purchaseTableView.register(PurchaseReviewTableViewCell.self, forCellReuseIdentifier: PurchaseReviewTableViewCell.identifier)
        purchaseTableView.dataSource = self
        purchaseTableView.delegate = self
//        purchaseTableView.estimatedRowHeight = 50
        purchaseTableView.rowHeight = UITableView.automaticDimension
       
        //컬렉션뷰 크기
//        collectionView.heightAnchor.constraint(equalToConstant: 300).isActive = true
//        collectionView.dataSource = self
//        collectionView.delegate = self
        buycount.text = "\(dataArry.count)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder NSCoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func commonInit(){
        self.addSubview(imageView)
        self.addSubview(buy)
        self.addSubview(buycount)
        self.addSubview(구매리뷰)
//        self.addSubview(collectionView)
        self.addSubview(mark)
        self.addSubview(under)
        self.addSubview(purchaseTableView)
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
            구매리뷰.leadingAnchor.constraint(equalTo: mark.trailingAnchor,constant: 11),
            //            구매리뷰.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            mark.topAnchor.constraint(equalTo: buy.bottomAnchor,constant: 10),
            mark.leadingAnchor.constraint(equalTo: buy.leadingAnchor),
            
            under.topAnchor.constraint(equalTo: mark.topAnchor),
            under.leadingAnchor.constraint(equalTo: 구매리뷰.trailingAnchor,constant: 79),
            
            purchaseTableView.topAnchor.constraint(equalTo: 구매리뷰.bottomAnchor,constant: 10),
            purchaseTableView.leadingAnchor.constraint(equalTo: buy.leadingAnchor),
            purchaseTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            purchaseTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            purchaseTableView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }
}
extension PurchaseReviewView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = purchaseTableView.dequeueReusableCell(withIdentifier: "PurchaseReviewTableViewCell", for: indexPath) as? PurchaseReviewTableViewCell else { return PurchaseReviewTableViewCell()}
        cell.model = dataArry[indexPath.row]
        return cell
    }
//
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
}



//extension PurchaseReviewView: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataArry.count
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PurchaseReviewCollectionViewCell", for: indexPath) as? PurchaseReviewCollectionViewCell else {return PurchaseReviewCollectionViewCell()}
//        cell.model = dataArry[indexPath.row]
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        //        return CGSize(width: dataArry[indexPath.row].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 25, height: 28)
//        return CGSize(width: 400 , height: 78)
//    }
//
//}
