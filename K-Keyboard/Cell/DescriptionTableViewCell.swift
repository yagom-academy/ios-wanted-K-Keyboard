//
//  DescriptionTableViewCell.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/06.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell, ViewRepresent {
    
    static let identifier = "DescriptionTableViewCell"
    
    let preView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "preview")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let preViewLabel: UILabel = {
        let view = UILabel()
        view.text = "앙무"
        view.textColor = .customBlack()
        view.font = .NotoSanKR(weight: .Bold, size: 20)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "코핀"
        view.textColor = .customLightGray()
        view.font = .NotoSanKR(weight: .Medium, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let howManyLabel: UILabel = {
        let view = UILabel()
        view.text = "78명이참여했어요!"
        view.textColor = .customLightGray()
        view.asFontColor(targetString: "78", font: nil, color: UIColor.customPink())
        view.font = .NotoSanKR(weight: .Medium, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉"
        view.textColor = .customBlack()
        view.font = .NotoSanKR(weight: .Bold, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "밀당해피니스 유튜브 채널을 방문하면 “테마명” 이벤트 테마를 무료로 받을 수 있다구요?\n지금 바로 ‘참여하기' 버튼을 눌러 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!"
        view.textColor = .customLightBlack()
        view.numberOfLines = 0
        view.font = .NotoSanKR(weight: .Regular, size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        [preView, preViewLabel, nameLabel, howManyLabel, descriptionTitleLabel, descriptionLabel].forEach {
            addSubview($0)
            //, nameLabel, howManyLabel, descriptionTitleLabel, descriptionLabel
        }
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            preView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            preView.leadingAnchor.constraint(equalTo: leadingAnchor),
            preView.trailingAnchor.constraint(equalTo: trailingAnchor),

            preViewLabel.topAnchor.constraint(equalTo: preView.bottomAnchor, constant: 24),
            preViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            preViewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            nameLabel.topAnchor.constraint(equalTo: preViewLabel.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            howManyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            howManyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            howManyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: howManyLabel.bottomAnchor, constant: 40),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -48)
            
            
        ])
    }
    
}
