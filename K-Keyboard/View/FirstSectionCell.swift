//
//  FirstSectionCell.swift
//  K-Keyboard
//
//  Created by channy on 2022/09/30.
//

import UIKit

class FirstSectionCell: UITableViewCell {
    static let identifier = "section1"
    
    let keyboardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.image = UIImage(named: "keyboard")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.259, green: 0.267, blue: 0.298, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Bold", size: 20)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.95
        label.attributedText = NSMutableAttributedString(string: "앙무", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.alpha = 1
        label.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        label.attributedText = NSMutableAttributedString(string: "코핀", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    let participantsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.alpha = 1
        label.textColor = UIColor(red: 0.569, green: 0.573, blue: 0.6, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Medium", size: 14)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.99
        var userNum: Int = 78
        let highlightedColor: UIColor = UIColor(red: 0.792, green: 0.278, blue: 0.426, alpha: 1)
        let attributedString = NSMutableAttributedString(string: "\(userNum)명이참여했어요!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        attributedString.addAttribute(.foregroundColor, value: highlightedColor, range: (attributedString.string as NSString).range(of: "\(userNum)"))
        
        label.attributedText = attributedString
        return label
    }()

    let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.16
        label.attributedText = NSMutableAttributedString(string: "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = UIColor(red: 0.294, green: 0.306, blue: 0.341, alpha: 1)
        label.font = UIFont(name: "NotoSansKR-Regular", size: 14)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.18
        label.attributedText = NSMutableAttributedString(string: "밀당해피니스 유튜브 채널을 방문하면 “테마명” 이벤트 테마를 무료로 받을 수 있다구요?\n지금 바로 ‘참여하기' 버튼을 눌러 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addViews()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstSectionCell {
    func addViews() {
        [keyboardImageView, titleLabel, subTitleLabel, participantsLabel, descriptionTitleLabel, descriptionLabel].forEach {
            contentView.addSubview($0)
        }
    }
    func setConstraints() {
        [keyboardImageView, titleLabel, subTitleLabel, participantsLabel, descriptionTitleLabel, descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            keyboardImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            keyboardImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            keyboardImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            keyboardImageView.heightAnchor.constraint(equalToConstant: 264),
            titleLabel.widthAnchor.constraint(equalToConstant: 37),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            titleLabel.topAnchor.constraint(equalTo: keyboardImageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            subTitleLabel.widthAnchor.constraint(equalToConstant: 26),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subTitleLabel.leadingAnchor.constraint(equalTo: contentView
                .leadingAnchor, constant: 16),
            participantsLabel.widthAnchor.constraint(equalToConstant: 111),
            participantsLabel.heightAnchor.constraint(equalToConstant: 20),
            participantsLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 16),
            participantsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionTitleLabel.widthAnchor.constraint(equalToConstant: 343),
            descriptionTitleLabel.heightAnchor.constraint(equalToConstant: 24),
            descriptionTitleLabel.topAnchor.constraint(equalTo: participantsLabel.bottomAnchor, constant: 40),
            descriptionTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            descriptionLabel.heightAnchor.constraint(equalToConstant: 96),
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -48)
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewPreview<View: UIView>: UIViewRepresentable {
    let view: View
    
    init(_ builder: @escaping () -> View) {
        view = builder()
    }
    
    // MARK: - UIViewRepresentable
    
    func makeUIView(context: Context) -> some UIView {
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
struct FirstSectionCellPreview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let cell = FirstSectionCell(frame: .zero)
            return cell
        }.previewLayout(.fixed(width: 343, height: 544))
    }
}
#endif
