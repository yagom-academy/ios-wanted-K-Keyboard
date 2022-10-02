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
    
    //MARK: Tag View
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
    
    //MARK: Reaction View
    let reactionLabel: UILabel = {
        let label = UILabel()
        label.text = "이런 키워드에 반응해요"
        return label
    }()
    
    let funView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.widthAnchor.constraint(equalToConstant: 129).isActive = true
        view.heightAnchor.constraint(equalToConstant: 162).isActive = true
        return view
    }()
    
    let funImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Fun")
        return imageView
    }()
    
    let hopeView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.widthAnchor.constraint(equalToConstant: 129).isActive = true
        view.heightAnchor.constraint(equalToConstant: 162).isActive = true
        return view
    }()
    
    let hopeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Hope")
        return imageView
    }()
    
    let playView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.widthAnchor.constraint(equalToConstant: 129).isActive = true
        view.heightAnchor.constraint(equalToConstant: 162).isActive = true
        return view
    }()
    
    let playImageView: UIImageView = {
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
    
    //MARK: Think View
    let thinkLabel: UILabel = {
        let label = UILabel()
        label.text = "이 테마를 어떻게 생각하나요?"
        return label
    }()
    
    let emojiButton1: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.baseForegroundColor = .systemGray2
        config.image = UIImage(named: "Emoji1")
        config.imagePlacement = NSDirectionalRectEdge.top
        config.title = "맘에들어요"
        config.subtitle = "0"
        
        let button = UIButton(configuration: config)
        return button
    }()
    
    let emojiButton2: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.baseForegroundColor = .systemGray2
        config.image = UIImage(named: "Emoji2")
        config.imagePlacement = NSDirectionalRectEdge.top
        config.title = "심쿵했어요"
        config.subtitle = "0"
        
        let button = UIButton(configuration: config)
        return button
    }()
    
    let emojiButton3: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.baseForegroundColor = .systemGray2
        config.image = UIImage(named: "Emoji3")
        config.imagePlacement = NSDirectionalRectEdge.top
        config.title = "응원해요"
        config.subtitle = "0"
        
        let button = UIButton(configuration: config)
        return button
    }()
    
    let emojiButton4: UIButton = {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
        config.baseForegroundColor = .systemGray2
        config.image = UIImage(named: "Emoji4")
        config.imagePlacement = NSDirectionalRectEdge.top
        config.title = "갖고싶어요"
        config.subtitle = "0"
        
        let button = UIButton(configuration: config)
        return button
    }()
    
    let emojiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner")
        return imageView
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "구매 리뷰 10"
        label.font = UIFont.systemFont(ofSize: 22)
        
        let attributeString = NSMutableAttributedString(string: label.text!)
        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (label.text! as NSString).range(of: "10"))
        label.attributedText = attributeString
        return label
    }()
    
    let warningImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Warning")
        return imageView
    }()
    
    let warningLabel: UILabel = {
        let label = UILabel()
        label.text = "테마를 구매해야 리뷰를 남길 수 있어요."
        return label
    }()
    
    let testLabel: UILabel = {
        let label = UILabel()
        label.text = "테스트"
        return label
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
        view.backgroundColor = .blue
        return view
    }()
    
    let toolbar: UIToolbar = {
       let toolbar = UIToolbar()
        return toolbar
    }()
    
    let diamondImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Diamond")
        return imageView
    }()
    
    let diamondLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = .systemBlue
        return label
    }()
    
    let jamLabel: UILabel = {
        let label = UILabel()
        label.text = "0젬 보유 중"
        
        let attributeString = NSMutableAttributedString(string: label.text!)
        attributeString.addAttribute(.foregroundColor, value: UIColor.red, range: (label.text! as NSString).range(of: "0젬"))
        attributeString.addAttribute(.foregroundColor, value: UIColor.gray, range: (label.text! as NSString).range(of: "보유 중"))
        label.attributedText = attributeString
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.setTitle("구매하기", for: UIControl.State.normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [eventTagLabel, characterTagLabel, birdTagLabel, animalTagLabel, cuteTagLabel].map {
            self.tagStackView.addArrangedSubview($0)
        }
        
        [funView, hopeView, playView].map {
            self.reactionStackView.addArrangedSubview($0)
        }
        
        [emojiButton1, emojiButton2, emojiButton3, emojiButton4].map {
            self.emojiStackView.addArrangedSubview($0)
        }
        
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
        keywordContentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        keywordContentView.widthAnchor.constraint(equalTo: keywordScrollView.widthAnchor).isActive = true

        keywordContentView.addSubview(reactionStackView)
        reactionStackView.translatesAutoresizingMaskIntoConstraints = false
        reactionStackView.topAnchor.constraint(equalTo: keywordContentView.topAnchor, constant: 16).isActive = true
        reactionStackView.leadingAnchor.constraint(equalTo: keywordContentView.leadingAnchor).isActive = true
        reactionStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        contentView.addSubview(thinkLabel)
        thinkLabel.translatesAutoresizingMaskIntoConstraints = false
        thinkLabel.topAnchor.constraint(equalTo: reactionStackView.bottomAnchor, constant: 48).isActive = true
        thinkLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true

        contentView.addSubview(emojiStackView)
        emojiStackView.translatesAutoresizingMaskIntoConstraints = false
        emojiStackView.topAnchor.constraint(equalTo: thinkLabel.bottomAnchor, constant: 24).isActive = true
        emojiStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        contentView.addSubview(bannerImageView)
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.topAnchor.constraint(equalTo: emojiStackView.bottomAnchor, constant: 50).isActive = true
        bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true

        contentView.addSubview(reviewLabel)
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewLabel.topAnchor.constraint(equalTo: bannerImageView.bottomAnchor, constant: 48).isActive = true
        reviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        reviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.addSubview(warningImageView)
        warningImageView.translatesAutoresizingMaskIntoConstraints = false
        warningImageView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 13).isActive = true
        warningImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        warningImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        warningImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        contentView.addSubview(warningLabel)
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 13).isActive = true
        warningLabel.leadingAnchor.constraint(equalTo: warningImageView.trailingAnchor, constant: 11.33).isActive = true
        warningLabel.centerYAnchor.constraint(equalTo: warningImageView.centerYAnchor).isActive = true
        
        contentView.addSubview(testLabel)
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 20).isActive = true
        testLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        testLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        testLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        addSubview(toolbar)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        toolbar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        toolbar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        toolbar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        toolbar.addSubview(diamondImage)
        diamondImage.translatesAutoresizingMaskIntoConstraints = false
        diamondImage.topAnchor.constraint(equalTo: toolbar.topAnchor, constant: 18).isActive = true
        diamondImage.leadingAnchor.constraint(equalTo: toolbar.leadingAnchor, constant: 18.33).isActive = true
        
        toolbar.addSubview(diamondLabel)
        diamondLabel.translatesAutoresizingMaskIntoConstraints = false
        diamondLabel.topAnchor.constraint(equalTo: toolbar.topAnchor, constant: 11).isActive = true
        diamondLabel.leadingAnchor.constraint(equalTo: diamondImage.trailingAnchor, constant: 6.33).isActive = true
        diamondLabel.centerYAnchor.constraint(equalTo: diamondImage.centerYAnchor).isActive = true
        
        toolbar.addSubview(jamLabel)
        jamLabel.translatesAutoresizingMaskIntoConstraints = false
        jamLabel.topAnchor.constraint(equalTo: diamondLabel.bottomAnchor, constant: 3).isActive = true
        jamLabel.leadingAnchor.constraint(equalTo: toolbar.leadingAnchor, constant: 16).isActive = true
        
        toolbar.addSubview(buyButton)
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.topAnchor.constraint(equalTo: toolbar.topAnchor, constant: 12).isActive = true
        buyButton.trailingAnchor.constraint(equalTo: toolbar.trailingAnchor, constant: -16).isActive = true
        buyButton.widthAnchor.constraint(equalToConstant: 144).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

        
        
        
        

//        funView.addSubview(funImageView)
//        funImageView.translatesAutoresizingMaskIntoConstraints = false
//        funImageView.topAnchor.constraint(equalTo: keywordContentView.topAnchor, constant: 16).isActive = true
//        funImageView.leadingAnchor.constraint(equalTo: funView.leadingAnchor).isActive = true
//        funImageView.bottomAnchor.constraint(equalTo: funView.bottomAnchor).isActive = true
//
        
        
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

extension UIButton {
    func emojiButton(spacing: CGFloat = 6.0) {

    }
}
