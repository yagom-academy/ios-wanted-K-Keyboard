//
//  ViewController.swift
//  K-Keyboard
//
//  Created by kjs on 2022/09/27.
//

import UIKit

class ThemeDetailViewController: UIViewController {

    var tableView: UITableView!
    
    struct ReviewDataModel {
        var isCreator: Bool = false
        var profileImage: UIImage = UIImage(named: "profile")!
        var name: String
        var content: String
        var writeBefore: String
    }
    
    var reviewSample = [ReviewDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(tableView)
        var const = [NSLayoutConstraint]()
        defer { NSLayoutConstraint.activate(const) }
        const += [
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 0)
        ]
    }
    
    func setupView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .gray
        tableView.register(ReviewTableViewCell.classForCoder(), forCellReuseIdentifier: "ReviewTableViewCell")
        tableView.register(BannerTableViewCell.classForCoder(), forCellReuseIdentifier: "BannerTableViewCell")
        tableView.register(EvaluationTableViewCell.classForCoder(), forCellReuseIdentifier: "EvaluationTableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        reviewSample.append(ReviewDataModel(isCreator: true, name: "몰랑_크리에이터", content: "구매해주셔서 감사합니다♥", writeBefore: "12초"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "1시간"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워귀여워", writeBefore: "1분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "맘에드네요!", writeBefore: "1시간"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "1분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "1분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "1분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "1분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "1분"))
        reviewSample.append(ReviewDataModel(name: "유저1", content: "정말 귀여워요..", writeBefore: "1분"))
        

    }
}

extension ThemeDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:

            let titleLabel = UILabel()
            titleLabel.text = "이 테마를 어떻게 생각하나요?"
            titleLabel.font =  UIFont.systemFont(ofSize: 16)
            titleLabel.textColor = UIColor(red: 66/255, green: 68/255, blue: 76/255, alpha: 1.0)

//            let sectionView = UIView()
//            sectionView.backgroundColor = .blue
//            sectionView.addSubview(titleLabel)
//
//            var const = [NSLayoutConstraint]()
//            defer {
//                DispatchQueue.main.async {
//                    NSLayoutConstraint.activate(const)
//                }
//            }
//
//            const += [
//                sectionView.widthAnchor.constraint(equalToConstant: tableView.frame.width),
//                titleLabel.topAnchor.constraint(equalTo: sectionView.topAnchor, constant: 0),
//                titleLabel.leadingAnchor.constraint(equalTo: sectionView.leadingAnchor, constant: 16),
//                titleLabel.trailingAnchor.constraint(equalTo: sectionView.trailingAnchor, constant: -16),
//            ]
//
//            sectionView.translatesAutoresizingMaskIntoConstraints = false
//            titleLabel.translatesAutoresizingMaskIntoConstraints = false

            return titleLabel
        case 1:
            return nil
//        case 2:
//            let titleLabel = UILabel()
//            titleLabel.text = "리뷰 작성 \(reviewSample.count)"
//            titleLabel.font =  UIFont.systemFont(ofSize: 16)
//            titleLabel.textColor = UIColor(red: 66/255, green: 68/255, blue: 76/255, alpha: 1.0)
//
//            let noticeLabel = UILabel()
//            noticeLabel.text = "테마를 구매해야 리뷰를 남길 수 있어요."
//            noticeLabel.font =  UIFont.systemFont(ofSize: 14)
//            noticeLabel.textColor = UIColor(red: 80/255, green: 83/255, blue: 92/255, alpha: 1.0)
//
//            let imageView = UIImageView()
//            imageView.image = UIImage(named: "warn")!
//            imageView.contentMode = .scaleAspectFit
//
//            let dropdownButton = UIButton()
//            dropdownButton.setImage(UIImage(named: "dropdown")!, for: .normal)
//
//            let reviewSectionView = UIView()
//            reviewSectionView.addSubview(titleLabel)
//            reviewSectionView.addSubview(noticeLabel)
//            reviewSectionView.addSubview(imageView)
//            reviewSectionView.addSubview(dropdownButton)
//
//            reviewSectionView.translatesAutoresizingMaskIntoConstraints = false
//            titleLabel.translatesAutoresizingMaskIntoConstraints = false
//            noticeLabel.translatesAutoresizingMaskIntoConstraints = false
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            dropdownButton.translatesAutoresizingMaskIntoConstraints = false
//
//            var const = [NSLayoutConstraint]()
//            defer {
//                DispatchQueue.main.async {
//                    NSLayoutConstraint.activate(const)
//                }
//            }
//            const += [
//                reviewSectionView.widthAnchor.constraint(equalToConstant: tableView.frame.width),
//                titleLabel.topAnchor.constraint(equalTo: reviewSectionView.topAnchor, constant: 0),
//                titleLabel.leadingAnchor.constraint(equalTo: reviewSectionView.leadingAnchor, constant: 16),
//                titleLabel.trailingAnchor.constraint(equalTo: reviewSectionView.trailingAnchor, constant: -16),
//                imageView.widthAnchor.constraint(equalToConstant: 13.33),
//                imageView.heightAnchor.constraint(equalToConstant: 13.33),
//                imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 18.33),
//                imageView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
//                imageView.bottomAnchor.constraint(equalTo: reviewSectionView.bottomAnchor, constant: 0),
//                noticeLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 11.3),
//                noticeLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0),
//                dropdownButton.trailingAnchor.constraint(equalTo: reviewSectionView.trailingAnchor, constant: -16),
//                dropdownButton.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 0),
//            ]
//            return reviewSectionView
        default:
            let label = UILabel()
            label.text = "Section"
            label.backgroundColor = .red
            return label
        }
        
//        let label = UILabel()
//        label.text = "Section"
//        label.backgroundColor = .red
//        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: // 평가
            return 1
        case 1: // 배너
            return 1
        case 2: // 리뷰
            return reviewSample.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EvaluationTableViewCell") as! EvaluationTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell") as! BannerTableViewCell
            cell.bannerImageView.image = UIImage(named: "banner")!
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
            let review = reviewSample[indexPath.row]
            cell.profileTagLabel.isHidden = !review.isCreator
            cell.userNameLabel.text = review.name
            cell.profileImageView.image = review.profileImage
            cell.reviewContentLabel.text = review.content
            cell.writeBeforeLabel.text = review.writeBefore
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
    }
}
