//
//  EvaluationTableViewCell.swift
//  K-Keyboard
//
//  Created by 유영훈 on 2022/10/07.
//

import UIKit

class EvaluationTableViewCell: UITableViewCell {

    static let identifier = "EvaluationTableViewCell"
    
    let keywordLabel: UILabel = {
        let view = UILabel()
        view.text = "이 테마를 어떻게 생각하나요?"
        view.textColor = .customBlack()
        view.font = .NotoSanKR(weight: .Bold, size: 16)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let rootStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        
        let emojiLabels = ["맘에들어요", "심쿵했어요", "응원해요", "갖고싶어요"]
        let emojies = ["😊", "😍", "😉", "🤣"]
        for i in 0..<emojies.count {
            let stackView = UIStackView()
            stackView.axis = .vertical
            let emojiLabel = UILabel()
                emojiLabel.text = emojies[i]
                emojiLabel.textAlignment = .center
                emojiLabel.font = .NotoSanKR(weight: .Regular, size: 30)
            let label = UILabel()
                label.text = emojiLabels[i]
                label.textColor = i == 1 ? .allMainColor() : .allSubDarkGray()
                label.font = .NotoSanKR(weight: .Regular, size: 12)
                label.textAlignment = .center
            let countLabel = UILabel()
                countLabel.text = i == 1 ? "1": "0"
                countLabel.textColor = i == 1 ? .allMainColor() : .allSubDarkGray()
                countLabel.font = .NotoSanKR(weight: .Regular, size: 10)
                countLabel.textAlignment = .center
            stackView.addArrangedSubview(emojiLabel)
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(countLabel)
            rootStackView.addArrangedSubview(stackView)
        }
        
        [keywordLabel, rootStackView].forEach {
            addSubview($0)
        }
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            keywordLabel.topAnchor.constraint(equalTo: topAnchor),
            keywordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            keywordLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            rootStackView.topAnchor.constraint(equalTo: keywordLabel.bottomAnchor, constant: 16),
            rootStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            rootStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            rootStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }

}
