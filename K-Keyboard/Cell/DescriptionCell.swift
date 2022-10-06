//
//  DescriptionCell.swift
//  K-Keyboard
//
//  Created by 신동원 on 2022/10/06.
//

import UIKit

class DescriptionCell: UITableViewCell, ViewRepresent {
    
    static let identifier = "DescriptionCell"
    
//    let chatLabel = PaddingLabel(padding: UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)).then {
//        $0.menuTitle(text: "채팅 내용 채팅 내용 채팅 내용")
//        $0.numberOfLines = 0
//        $0.layer.borderWidth = 1
//        $0.layer.borderColor = UIColor(named: "gray6")?.cgColor
//        $0.layer.cornerRadius = 8
//        $0.clipsToBounds = true
//    }
//
//    let timeLabel = UILabel().then {
//        $0.textColor = UIColor(named: "gray6")
//        $0.font = UIFont().R12
//    }
    
    let preView: UIImageView = {
       let view = UIImageView()
        view.image = UIImage(named: "preview")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let preViewLabel: UILabel = {
        let view = UILabel()
        view.text = "앙무"
        view.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.text = "코핀"
        view.font = .NotoSanKR(weight: .Medium, size: 14)
        return view
    }()
    
    let howManyLabel: UILabel = {
        let view = UILabel()
        view.text = "78명이참여했어요!"
        view.font = .NotoSanKR(weight: .Medium, size: 14)
        return view
    }()
    
    let descriptionTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉"
        view.font = .NotoSanKR(weight: .Bold, size: 14)
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "밀당해피니스 유튜브 채널을 방문하면 “테마명” 이벤트 테마를 무료로 받을 수 있다구요?\n지금 바로 ‘참여하기' 버튼을 눌러 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!"
        view.font = .NotoSanKR(weight: .Regular, size: 14)
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
        [preViewLabel].forEach {
            addSubview($0)
            //, nameLabel, howManyLabel, descriptionTitleLabel, descriptionLabel
        }
    }
    
    func setupConstraints() {
        
        let safeGuide = self.safeAreaLayoutGuide
        preViewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
//            preView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
//            preView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
//            preView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
//            preView.heightAnchor.constraint(equalToConstant: preView.image!.size.height),
//
//            preViewLabel.topAnchor.constraint(equalTo: preView.topAnchor, constant: 388),
//            preViewLabel.leadingAnchor.constraint(equalTo: preView.leadingAnchor),
//            preViewLabel.trailingAnchor.constraint(equalTo: preView.trailingAnchor),
//            preViewLabel.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor)
            
            preViewLabel.topAnchor.constraint(equalTo: topAnchor),
            preViewLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            preViewLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            preViewLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
       // preView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
