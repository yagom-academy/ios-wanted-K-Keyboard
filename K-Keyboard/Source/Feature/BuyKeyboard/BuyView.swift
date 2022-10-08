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
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let keyboardCreatorNameLabel: UILabel = {
        let label = UILabel()
        label.text = "코핀"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let participantLabel: UILabel = {
        let label = UILabel()
        label.text = "78명이 참여했어요!"
        label.font = UIFont.systemFont(ofSize: 14)
        let attributeString = NSMutableAttributedString(string: label.text!)
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: Color.mainColor.rawValue) ?? UIColor.systemPink, range: (label.text! as NSString).range(of: "78"))
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: Color.subDarkGray.rawValue) ?? UIColor.darkGray, range: (label.text! as NSString).range(of: "명이 참여했어요!"))
        label.attributedText = attributeString
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉"
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.text = "밀당해피니스 유튜브 채널을 방문하면 “테마명” 이벤트 테마 \n를 무료로 받을 수 있다구요? \n지금 바로 ‘참여하기' 버튼을 눌러 새로워진 밀당해피니스 유 \n튜브 채널을 확인해보세요!"
        label.textColor = UIColor(named: Color.bodyGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    //MARK: Tag View
    let tagLabel: UILabel = {
        let label = UILabel()
        label.text = "태그"
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let eventTagView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: Color.btnGray.rawValue)
        view.layer.cornerRadius = 15
        view.widthAnchor.constraint(equalToConstant: 60.8).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        return view
    }()
    
    let eventTagLabel: UILabel = {
        let label = UILabel()
        label.text = " 이벤트 "
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let characterTagView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: Color.btnGray.rawValue)
        view.layer.cornerRadius = 15
        view.widthAnchor.constraint(equalToConstant: 60.8).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        return view
    }()
    
    let characterTagLabel: UILabel = {
        let label = UILabel()
        label.text = " 캐릭터 "
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let birdTagView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: Color.btnGray.rawValue)
        view.layer.cornerRadius = 15
        view.widthAnchor.constraint(equalToConstant: 34.01).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        return view
    }()
    
    let birdTagLabel: UILabel = {
        let label = UILabel()
        label.text = "새"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let animalTagView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: Color.btnGray.rawValue)
        view.layer.cornerRadius = 15
        view.widthAnchor.constraint(equalToConstant: 47.4).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        return view
    }()
    
    let animalTagLabel: UILabel = {
        let label = UILabel()
        label.text = "동물"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let cuteTagView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: Color.btnGray.rawValue)
        view.layer.cornerRadius = 15
        view.widthAnchor.constraint(equalToConstant: 74.2).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        return view
    }()
    
    let cuteTagLabel: UILabel = {
        let label = UILabel()
        label.text = "앙증맞은"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4.12
        return stackView
    }()
    
    let roundTagView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(named: Color.btnGray.rawValue)
        view.layer.cornerRadius = 15
        view.widthAnchor.constraint(equalToConstant: 74.2).isActive = true
        view.heightAnchor.constraint(equalToConstant: 28).isActive = true
        return view
    }()
    
    let roundTagLabel: UILabel = {
        let label = UILabel()
        label.text = "동글동글"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    //MARK: Reaction View
    let reactionLabel: UILabel = {
        let label = UILabel()
        label.text = "이런 키워드에 반응해요"
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let funView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor // 색깔
        view.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        view.layer.shadowOffset = CGSize(width: 4, height: 4) // 위치조정
        view.layer.shadowRadius = 5 // 반경
        view.layer.shadowOpacity = 0.3 // alpha값
        view.layer.cornerRadius = 20
        view.widthAnchor.constraint(equalToConstant: 129).isActive = true
        view.heightAnchor.constraint(equalToConstant: 162).isActive = true
        return view
    }()
    
    let funImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Fun")
        return imageView
    }()
    
    let funLabel: UILabel = {
        let label = UILabel()
        label.text = "신나💃"
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let hopeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor // 색깔
        view.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        view.layer.shadowOffset = CGSize(width: 4, height: 4) // 위치조정
        view.layer.shadowRadius = 5 // 반경
        view.layer.shadowOpacity = 0.3 // alpha값
        view.layer.cornerRadius = 20
        view.widthAnchor.constraint(equalToConstant: 129).isActive = true
        view.heightAnchor.constraint(equalToConstant: 162).isActive = true
        return view
    }()
    
    let hopeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Hope")
        return imageView
    }()
    
    let hopeLabel: UILabel = {
        let label = UILabel()
        label.text = "기대💗"
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let playView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor // 색깔
        view.layer.masksToBounds = false  // 내부에 속한 요소들이 UIView 밖을 벗어날 때, 잘라낼 것인지. 그림자는 밖에 그려지는 것이므로 false 로 설정
        view.layer.shadowOffset = CGSize(width: 4, height: 4) // 위치조정
        view.layer.shadowRadius = 5 // 반경
        view.layer.shadowOpacity = 0.3 // alpha값
        view.layer.cornerRadius = 20
        view.widthAnchor.constraint(equalToConstant: 129).isActive = true
        view.heightAnchor.constraint(equalToConstant: 162).isActive = true
        return view
    }()
    
    let playImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(imageLiteralResourceName: "Play")
        return imageView
    }()
    
    let playLabel: UILabel = {
        let label = UILabel()
        label.text = "놀이"
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
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
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let emojiView1: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    let emojiImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Emoji1")
        return imageView
    }()
    
    let emojiLabel1: UILabel = {
        let label = UILabel()
        label.text = "맘에들어요"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let emojiNumLabel1: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let emojiView2: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    let emojiImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Emoji2")
        return imageView
    }()
    
    let emojiLabel2: UILabel = {
        let label = UILabel()
        label.text = "심쿵했어요"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let emojiNumLabel2: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let emojiView3: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    let emojiImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Emoji3")
        return imageView
    }()
    
    let emojiLabel3: UILabel = {
        let label = UILabel()
        label.text = "응원해요"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let emojiNumLabel3: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let emojiView4: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 60).isActive = true
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    let emojiImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Emoji4")
        return imageView
    }()
    
    let emojiLabel4: UILabel = {
        let label = UILabel()
        label.text = "갖고싶어요"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let emojiNumLabel4: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let emojiStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        return stackView
    }()
    
    let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Banner")
        return imageView
    }()
    
    let reviewLabel: UILabel = {
        let label = UILabel()
        label.text = "구매 리뷰 0"
        label.font = UIFont.systemFont(ofSize: 16)

        let attributeString = NSMutableAttributedString(string: label.text!)
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: Color.titleGray.rawValue) ?? UIColor.gray, range: (label.text! as NSString).range(of: "구매 리뷰"))
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: Color.mainColor.rawValue) ?? UIColor.systemPink, range: (label.text! as NSString).range(of: "0"))
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
        label.textColor = UIColor(named: Color.darkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    let downImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DownButton")
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Profile")
        return imageView
    }()
    
    let createrView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Color.mainColor.rawValue)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let createrLabel: UILabel = {
        let label = UILabel()
        label.text = "크리에이터"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    let commentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: Color.whiteGray.rawValue)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "크리에이터명"
        label.textColor = UIColor(named: Color.titleGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let commentLabel: UILabel = {
        let label = UILabel()
        label.text = "구매해주셔서 감사합니다💖"
        label.textColor = UIColor(named: Color.darkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let commentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "1일"
        label.textColor = UIColor(named: Color.subDarkGray.rawValue)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
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
    
    //MARK: ToolBar Ver.1
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
        label.textColor = UIColor(named: Color.gemColor.rawValue)
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let jamLabel: UILabel = {
        let label = UILabel()
        label.text = "0젬 보유 중"
        label.font = UIFont.systemFont(ofSize: 12)
        
        let attributeString = NSMutableAttributedString(string: label.text!)
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: Color.mainColor.rawValue) ?? UIColor.systemPink, range: (label.text! as NSString).range(of: "0젬"))
        attributeString.addAttribute(.foregroundColor, value: UIColor(named: Color.subDarkGray.rawValue) ?? UIColor.darkGray, range: (label.text! as NSString).range(of: "보유 중"))
        label.attributedText = attributeString
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = UIColor(named: Color.mainColor.rawValue)
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.setTitle("구매하기", for: UIControl.State.normal)
        return button
    }()
    
    //MARK: ToolBar Ver.2
    let commentToolbar: UIToolbar = {
       let toolbar = UIToolbar()
        return toolbar
    }()
    
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "댓글을 남겨보세요!"
        return textField
    }()
    
    let commentButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.backgroundColor = UIColor(named: Color.mainColor.rawValue)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.setTitle("등록", for: UIControl.State.normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        [eventTagView, characterTagView, birdTagView, animalTagView, cuteTagView].forEach {
            self.tagStackView.addArrangedSubview($0)
        }
        
        [funView, hopeView, playView].forEach {
            self.reactionStackView.addArrangedSubview($0)
        }
        
        [emojiView1, emojiView2, emojiView3, emojiView4].forEach {
            self.emojiStackView.addArrangedSubview($0)
        }
        
        [nicknameLabel, commentLabel].forEach {
            self.commentStackView.addArrangedSubview($0)
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
        
        eventTagView.addSubview(eventTagLabel)
        eventTagLabel.translatesAutoresizingMaskIntoConstraints = false
        eventTagLabel.centerXAnchor.constraint(equalTo: eventTagView.centerXAnchor).isActive = true
        eventTagLabel.centerYAnchor.constraint(equalTo: eventTagView.centerYAnchor).isActive = true
        
        characterTagView.addSubview(characterTagLabel)
        characterTagLabel.translatesAutoresizingMaskIntoConstraints = false
        characterTagLabel.centerXAnchor.constraint(equalTo: characterTagView.centerXAnchor).isActive = true
        characterTagLabel.centerYAnchor.constraint(equalTo: characterTagView.centerYAnchor).isActive = true
        
        birdTagView.addSubview(birdTagLabel)
        birdTagLabel.translatesAutoresizingMaskIntoConstraints = false
        birdTagLabel.centerXAnchor.constraint(equalTo: birdTagView.centerXAnchor).isActive = true
        birdTagLabel.centerYAnchor.constraint(equalTo: birdTagView.centerYAnchor).isActive = true
        
        animalTagView.addSubview(animalTagLabel)
        animalTagLabel.translatesAutoresizingMaskIntoConstraints = false
        animalTagLabel.centerXAnchor.constraint(equalTo: animalTagView.centerXAnchor).isActive = true
        animalTagLabel.centerYAnchor.constraint(equalTo: animalTagView.centerYAnchor).isActive = true
        
        cuteTagView.addSubview(cuteTagLabel)
        cuteTagLabel.translatesAutoresizingMaskIntoConstraints = false
        cuteTagLabel.centerXAnchor.constraint(equalTo: cuteTagView.centerXAnchor).isActive = true
        cuteTagLabel.centerYAnchor.constraint(equalTo: cuteTagView.centerYAnchor).isActive = true
        
        contentView.addSubview(roundTagView)
        roundTagView.translatesAutoresizingMaskIntoConstraints = false
        roundTagView.topAnchor.constraint(equalTo: tagStackView.bottomAnchor, constant: 8).isActive = true
        roundTagView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        roundTagView.addSubview(roundTagLabel)
        roundTagLabel.translatesAutoresizingMaskIntoConstraints = false
        roundTagLabel.centerXAnchor.constraint(equalTo: roundTagView.centerXAnchor).isActive = true
        roundTagLabel.centerYAnchor.constraint(equalTo: roundTagView.centerYAnchor).isActive = true
        
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
        
        funView.addSubview(funImageView)
        funImageView.translatesAutoresizingMaskIntoConstraints = false
        funImageView.topAnchor.constraint(equalTo: funView.topAnchor, constant: 10).isActive = true
        funImageView.leadingAnchor.constraint(equalTo: funView.leadingAnchor, constant: 12).isActive = true
        funImageView.trailingAnchor.constraint(equalTo: funView.trailingAnchor, constant: -12).isActive = true
        funImageView.widthAnchor.constraint(equalToConstant: 105).isActive = true
        funImageView.heightAnchor.constraint(equalToConstant: 105).isActive = true
        
        funView.addSubview(funLabel)
        funLabel.translatesAutoresizingMaskIntoConstraints = false
        funLabel.topAnchor.constraint(equalTo: funImageView.bottomAnchor, constant: 15).isActive = true
        funLabel.centerXAnchor.constraint(equalTo: funView.centerXAnchor).isActive = true
        
        hopeView.addSubview(hopeImageView)
        hopeImageView.translatesAutoresizingMaskIntoConstraints = false
        hopeImageView.topAnchor.constraint(equalTo: hopeView.topAnchor, constant: 10).isActive = true
        hopeImageView.leadingAnchor.constraint(equalTo: hopeView.leadingAnchor, constant: 12).isActive = true
        hopeImageView.trailingAnchor.constraint(equalTo: hopeView.trailingAnchor, constant: -12).isActive = true
        hopeImageView.widthAnchor.constraint(equalToConstant: 105).isActive = true
        hopeImageView.heightAnchor.constraint(equalToConstant: 105).isActive = true
        
        hopeView.addSubview(hopeLabel)
        hopeLabel.translatesAutoresizingMaskIntoConstraints = false
        hopeLabel.topAnchor.constraint(equalTo: hopeImageView.bottomAnchor, constant: 15).isActive = true
        hopeLabel.centerXAnchor.constraint(equalTo: hopeView.centerXAnchor).isActive = true
        
        playView.addSubview(playImageView)
        playImageView.translatesAutoresizingMaskIntoConstraints = false
        playImageView.topAnchor.constraint(equalTo: playView.topAnchor, constant: 10).isActive = true
        playImageView.leadingAnchor.constraint(equalTo: playView.leadingAnchor, constant: 12).isActive = true
        playImageView.trailingAnchor.constraint(equalTo: playView.trailingAnchor, constant: -12).isActive = true
        playImageView.widthAnchor.constraint(equalToConstant: 105).isActive = true
        playImageView.heightAnchor.constraint(equalToConstant: 105).isActive = true
        
        playView.addSubview(playLabel)
        playLabel.translatesAutoresizingMaskIntoConstraints = false
        playLabel.topAnchor.constraint(equalTo: playImageView.bottomAnchor, constant: 15).isActive = true
        playLabel.leadingAnchor.constraint(equalTo: playView.leadingAnchor, constant: 35).isActive = true

        keywordContentView.addSubview(reactionStackView)
        reactionStackView.translatesAutoresizingMaskIntoConstraints = false
        reactionStackView.topAnchor.constraint(equalTo: keywordContentView.topAnchor, constant: 16).isActive = true
        reactionStackView.leadingAnchor.constraint(equalTo: keywordContentView.leadingAnchor).isActive = true
        reactionStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        contentView.addSubview(thinkLabel)
        thinkLabel.translatesAutoresizingMaskIntoConstraints = false
        thinkLabel.topAnchor.constraint(equalTo: reactionStackView.bottomAnchor, constant: 48).isActive = true
        thinkLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        emojiView1.addSubview(emojiImageView1)
        emojiImageView1.translatesAutoresizingMaskIntoConstraints = false
        emojiImageView1.topAnchor.constraint(equalTo: emojiView1.topAnchor).isActive = true
        emojiImageView1.centerXAnchor.constraint(equalTo: emojiView1.centerXAnchor).isActive = true
        emojiImageView1.widthAnchor.constraint(equalToConstant: 30).isActive = true
        emojiImageView1.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emojiView1.addSubview(emojiLabel1)
        emojiLabel1.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel1.topAnchor.constraint(equalTo: emojiImageView1.bottomAnchor, constant: 8).isActive = true
        emojiLabel1.centerXAnchor.constraint(equalTo: emojiView1.centerXAnchor).isActive = true
        
        emojiView1.addSubview(emojiNumLabel1)
        emojiNumLabel1.translatesAutoresizingMaskIntoConstraints = false
        emojiNumLabel1.topAnchor.constraint(equalTo: emojiLabel1.bottomAnchor, constant: 8).isActive = true
        emojiNumLabel1.centerXAnchor.constraint(equalTo: emojiView1.centerXAnchor).isActive = true
        
        emojiView2.addSubview(emojiImageView2)
        emojiImageView2.translatesAutoresizingMaskIntoConstraints = false
        emojiImageView2.topAnchor.constraint(equalTo: emojiView2.topAnchor).isActive = true
        emojiImageView2.centerXAnchor.constraint(equalTo: emojiView2.centerXAnchor).isActive = true
        emojiImageView2.widthAnchor.constraint(equalToConstant: 30).isActive = true
        emojiImageView2.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emojiView2.addSubview(emojiLabel2)
        emojiLabel2.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel2.topAnchor.constraint(equalTo: emojiImageView2.bottomAnchor, constant: 8).isActive = true
        emojiLabel2.centerXAnchor.constraint(equalTo: emojiView2.centerXAnchor).isActive = true
        
        emojiView2.addSubview(emojiNumLabel2)
        emojiNumLabel2.translatesAutoresizingMaskIntoConstraints = false
        emojiNumLabel2.topAnchor.constraint(equalTo: emojiLabel2.bottomAnchor, constant: 8).isActive = true
        emojiNumLabel2.centerXAnchor.constraint(equalTo: emojiView2.centerXAnchor).isActive = true
        
        emojiView3.addSubview(emojiImageView3)
        emojiImageView3.translatesAutoresizingMaskIntoConstraints = false
        emojiImageView3.topAnchor.constraint(equalTo: emojiView3.topAnchor).isActive = true
        emojiImageView3.centerXAnchor.constraint(equalTo: emojiView3.centerXAnchor).isActive = true
        emojiImageView3.widthAnchor.constraint(equalToConstant: 30).isActive = true
        emojiImageView3.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emojiView3.addSubview(emojiLabel3)
        emojiLabel3.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel3.topAnchor.constraint(equalTo: emojiImageView3.bottomAnchor, constant: 8).isActive = true
        emojiLabel3.centerXAnchor.constraint(equalTo: emojiView3.centerXAnchor).isActive = true
        
        emojiView3.addSubview(emojiNumLabel3)
        emojiNumLabel3.translatesAutoresizingMaskIntoConstraints = false
        emojiNumLabel3.topAnchor.constraint(equalTo: emojiLabel3.bottomAnchor, constant: 8).isActive = true
        emojiNumLabel3.centerXAnchor.constraint(equalTo: emojiView3.centerXAnchor).isActive = true
        
        emojiView4.addSubview(emojiImageView4)
        emojiImageView4.translatesAutoresizingMaskIntoConstraints = false
        emojiImageView4.topAnchor.constraint(equalTo: emojiView4.topAnchor).isActive = true
        emojiImageView4.centerXAnchor.constraint(equalTo: emojiView4.centerXAnchor).isActive = true
        emojiImageView4.widthAnchor.constraint(equalToConstant: 30).isActive = true
        emojiImageView4.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emojiView4.addSubview(emojiLabel4)
        emojiLabel4.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel4.topAnchor.constraint(equalTo: emojiImageView4.bottomAnchor, constant: 8).isActive = true
        emojiLabel4.centerXAnchor.constraint(equalTo: emojiView4.centerXAnchor).isActive = true
        
        emojiView4.addSubview(emojiNumLabel4)
        emojiNumLabel4.translatesAutoresizingMaskIntoConstraints = false
        emojiNumLabel4.topAnchor.constraint(equalTo: emojiLabel4.bottomAnchor, constant: 8).isActive = true
        emojiNumLabel4.centerXAnchor.constraint(equalTo: emojiView4.centerXAnchor).isActive = true

        contentView.addSubview(emojiStackView)
        emojiStackView.translatesAutoresizingMaskIntoConstraints = false
        emojiStackView.topAnchor.constraint(equalTo: thinkLabel.bottomAnchor, constant: 24).isActive = true
        emojiStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        emojiStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        emojiStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        addSubview(bannerImageView)
        bannerImageView.translatesAutoresizingMaskIntoConstraints = false
        bannerImageView.topAnchor.constraint(equalTo: emojiStackView.bottomAnchor, constant: 50).isActive = true
        bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -20).isActive = true
        bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20).isActive = true

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
        
        contentView.addSubview(downImageView)
        downImageView.translatesAutoresizingMaskIntoConstraints = false
        downImageView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 18).isActive = true
        downImageView.leadingAnchor.constraint(equalTo: warningLabel.trailingAnchor, constant: 79).isActive = true
        downImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        downImageView.heightAnchor.constraint(equalToConstant: 6.91).isActive = true

        contentView.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 13).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true

        contentView.addSubview(createrView)
        createrView.translatesAutoresizingMaskIntoConstraints = false
        createrView.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 38).isActive = true
        createrView.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor).isActive = true
        createrView.widthAnchor.constraint(equalToConstant: 58).isActive = true
        createrView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        createrView.addSubview(createrLabel)
        createrLabel.translatesAutoresizingMaskIntoConstraints = false
        createrLabel.centerXAnchor.constraint(equalTo: createrView.centerXAnchor).isActive = true
        createrLabel.centerYAnchor.constraint(equalTo: createrView.centerYAnchor).isActive = true

        contentView.addSubview(commentView)
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        commentView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        commentView.widthAnchor.constraint(equalToConstant: 183).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        commentView.addSubview(commentStackView)
        commentStackView.translatesAutoresizingMaskIntoConstraints = false
        commentStackView.centerXAnchor.constraint(equalTo: commentView.centerXAnchor).isActive = true
        commentStackView.centerYAnchor.constraint(equalTo: commentView.centerYAnchor).isActive = true
        
        contentView.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 6).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 98).isActive = true
        
        addSubview(commentToolbar)
        commentToolbar.translatesAutoresizingMaskIntoConstraints = false
        commentToolbar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        commentToolbar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        commentToolbar.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        commentToolbar.heightAnchor.constraint(equalToConstant: 80).isActive = true

        commentToolbar.addSubview(commentTextField)
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.leadingAnchor.constraint(equalTo: commentToolbar.leadingAnchor, constant: 20).isActive = true
        commentTextField.centerYAnchor.constraint(equalTo: commentToolbar.centerYAnchor).isActive = true
        commentTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        commentTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        commentToolbar.addSubview(commentButton)
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.trailingAnchor.constraint(equalTo: commentToolbar.trailingAnchor, constant: -10).isActive = true
        commentButton.centerYAnchor.constraint(equalTo: commentToolbar.centerYAnchor).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
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
