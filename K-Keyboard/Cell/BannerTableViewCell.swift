//
//  BannerTableViewCell.swift
//  K-Keyboard
//
//  Created by 유영훈 on 2022/10/07.
//

import UIKit

class BannerTableViewCell: UITableViewCell {

    static let identifier = "BannerTableViewCell"
    
    var bannerImageView: UIImageView!
    
    var reviewSample = [ReviewDataModel]()
    
    struct ReviewDataModel {
        var isCreator: Bool = false
        var profileImage: UIImage = UIImage(named: "profile")!
        var name: String
        var content: String
        var writeBefore: String
    }
    
    let keywordLabel: UILabel = {
        let label = UILabel()
        label.text = "구매 리뷰 0"
        label.font = .NotoSanKR(weight: .Bold, size: 16)
        label.textColor = UIColor(red: 66/255, green: 68/255, blue: 76/255, alpha: 1.0)
        return label
    }()
    
    let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "테마를 구매해야 리뷰를 남길 수 있어요."
        label.font =  .NotoSanKR(weight: .Regular, size: 14)
        label.textColor = UIColor(red: 80/255, green: 83/255, blue: 92/255, alpha: 1.0)
        return label
    }()
    
    let noticeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "warn")!
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let dropdownButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dropdown")!, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        bannerImageView = UIImageView()
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        keywordLabel.translatesAutoresizingMaskIntoConstraints = false
        noticeLabel.translatesAutoresizingMaskIntoConstraints = false
        noticeImageView.translatesAutoresizingMaskIntoConstraints = false
        dropdownButton.translatesAutoresizingMaskIntoConstraints = false
        
        [bannerImageView, keywordLabel, noticeLabel, noticeImageView, dropdownButton].forEach {
            addSubview($0)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            bannerImageView.topAnchor.constraint(equalTo: topAnchor),
            bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            keywordLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 50),
            keywordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            keywordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            noticeImageView.widthAnchor.constraint(equalToConstant: 13.33),
            noticeImageView.heightAnchor.constraint(equalToConstant: 13.33),
            noticeImageView.topAnchor.constraint(equalTo: keywordLabel.bottomAnchor, constant: 18.33),
            noticeImageView.leadingAnchor.constraint(equalTo: keywordLabel.leadingAnchor, constant: 1),
            noticeImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            noticeLabel.leadingAnchor.constraint(equalTo: noticeImageView.trailingAnchor, constant: 11.3),
            noticeLabel.centerYAnchor.constraint(equalTo: noticeImageView.centerYAnchor, constant: 0),
            
            dropdownButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17.33),
            dropdownButton.centerYAnchor.constraint(equalTo: noticeImageView.centerYAnchor, constant: 0),
            
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }
}
