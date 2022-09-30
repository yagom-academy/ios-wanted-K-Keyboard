//
//  View.swift
//  K-Keyboard
//
//  Created by KangMingyo on 2022/09/29.
//

import UIKit

class BuyView: UIView {
    
    weak var viewController: ViewController? {
        didSet {
            setupMainView()
        }
    }
    
    let previewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Preview")
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let keyboardNameLabel: UILabel = {
        let label = UILabel()
        label.text = "앙무"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let keyboardCreatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "코핀"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let participantLabel: UILabel = {
        let label = UILabel()
        label.text = "78명이 참여했어요!"
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉"
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.text = "밀당해피니스 유튜브 채널을 방문하면\n “테마명” 이벤트 테마를 무료로 받을 수 있다구요? \n 지금 바로 ‘참여하기' 버튼을 눌러 \n 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let tagLabel: UILabel = {
        let label = UILabel()
        label.text = "태그"
        return label
    }()
    
    let eventTagLabel: UILabel = {
        let label = UILabel()
        label.text = " 이벤트 "
        label.tag()
        return label
    }()
    
    let characterTagLabel: UILabel = {
        let label = UILabel()
        label.text = " 캐릭터 "
        label.tag()
        return label
    }()
    
    let birdTagLabel: UILabel = {
        let label = UILabel()
        label.text = " 새 "
        label.tag()
        return label
    }()
    
    let animalTagLabel: UILabel = {
        let label = UILabel()
        label.text = " 동물 "
        label.tag()
        return label
    }()
    
    let cuteTagLabel: UILabel = {
        let label = UILabel()
        label.text = " 앙증맞은 "
        label.tag()
        return label
    }()
    
    let tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4.12
        return stackView
    }()
    
    let roundTagLabel: UILabel = {
        let label = UILabel()
        label.text = " 동글동글 "
        label.tag()
        return label
    }()
    
    let reactionLabel: UILabel = {
        let label = UILabel()
        label.text = "이런 키워드에 반응해요"
        return label
    }()
    
    let funView: UIView = {
        let view = UIView()
        return view
    }()
    
    let funImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Fun")
        return imageView
    }()
    
    let hopeView: UIView = {
        let view = UIView()
        return view
    }()
    
    let hopeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Hope")
        return imageView
    }()
    
    let reactionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let keywordScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    let keywordContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [eventTagLabel, characterTagLabel, birdTagLabel, animalTagLabel, cuteTagLabel].map {
            self.tagStackView.addArrangedSubview($0)
        }
        
//        [funView, hopeView].map {
//            self.reactionStackView.addArrangedSubview($0)
//        }
        
        backgroundColor = .white
        setupViews()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        contentView.addSubview(previewImage)
        previewImage.translatesAutoresizingMaskIntoConstraints = false
        previewImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        previewImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        previewImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.addSubview(keyboardNameLabel)
        keyboardNameLabel.translatesAutoresizingMaskIntoConstraints = false
        keyboardNameLabel.topAnchor.constraint(equalTo: previewImage.bottomAnchor, constant: 24).isActive = true
        keyboardNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        keyboardNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.addSubview(keyboardCreatorNameLabel)
        keyboardCreatorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        keyboardCreatorNameLabel.topAnchor.constraint(equalTo: keyboardNameLabel.bottomAnchor, constant: 4).isActive = true
        keyboardCreatorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.addSubview(participantLabel)
        participantLabel.translatesAutoresizingMaskIntoConstraints = false
        participantLabel.topAnchor.constraint(equalTo: keyboardCreatorNameLabel.bottomAnchor, constant: 16).isActive = true
        participantLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: participantLabel.bottomAnchor, constant: 40).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.addSubview(tagLabel)
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 48).isActive = true
        tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.addSubview(tagStackView)
        tagStackView.translatesAutoresizingMaskIntoConstraints = false
        tagStackView.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 20).isActive = true
        tagStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.addSubview(roundTagLabel)
        roundTagLabel.translatesAutoresizingMaskIntoConstraints = false
        roundTagLabel.topAnchor.constraint(equalTo: tagStackView.bottomAnchor, constant: 16).isActive = true
        roundTagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.addSubview(reactionLabel)
        reactionLabel.translatesAutoresizingMaskIntoConstraints = false
        reactionLabel.topAnchor.constraint(equalTo: roundTagLabel.bottomAnchor, constant: 40).isActive = true
        reactionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true

        contentView.addSubview(keywordScrollView)
        keywordScrollView.translatesAutoresizingMaskIntoConstraints = false
        keywordScrollView.topAnchor.constraint(equalTo: reactionLabel.bottomAnchor, constant: 16).isActive = true
        keywordScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        keywordScrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        keywordScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        keywordScrollView.addSubview(keywordContentView)
        keywordContentView.translatesAutoresizingMaskIntoConstraints = false
        keywordContentView.topAnchor.constraint(equalTo: keywordScrollView.topAnchor).isActive = true
        keywordContentView.leadingAnchor.constraint(equalTo: keywordScrollView.leadingAnchor).isActive = true
        keywordContentView.trailingAnchor.constraint(equalTo: keywordScrollView.trailingAnchor).isActive = true
        keywordContentView.bottomAnchor.constraint(equalTo: keywordScrollView.bottomAnchor).isActive = true
        keywordContentView.widthAnchor.constraint(equalTo: keywordScrollView.widthAnchor).isActive = true

        keywordContentView.addSubview(funImageView)
        funImageView.translatesAutoresizingMaskIntoConstraints = false
        funImageView.topAnchor.constraint(equalTo: keywordContentView.topAnchor, constant: 16).isActive = true
        funImageView.leadingAnchor.constraint(equalTo: keywordContentView.leadingAnchor).isActive = true
        funImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        
        //bottom 추가 해줘야 스크롤 내려감

    }
    
    private func setupMainView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let viewController = viewController {
            viewController.view.addSubview(self)
            leadingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            topAnchor.constraint(equalTo: viewController.view.safeAreaLayoutGuide.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
        }
    }
}


extension UILabel {
    func tag() {
        layer.cornerRadius = 8
        clipsToBounds = true
        backgroundColor = .systemGray5
    }
}
