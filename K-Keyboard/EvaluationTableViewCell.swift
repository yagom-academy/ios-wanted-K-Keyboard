//
//  EvaluationTableViewCell.swift
//  K-Keyboard
//
//  Created by 유영훈 on 2022/10/07.
//

import UIKit

class EvaluationTableViewCell: UITableViewCell {

    var rootStackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        
        self.addSubview(rootStackView)
        
        var const = [NSLayoutConstraint]()
        defer { NSLayoutConstraint.activate(const) }
        const += [
            rootStackView.topAnchor.constraint(equalTo: self.topAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ]
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        rootStackView = UIStackView()
        rootStackView.axis = .horizontal
        rootStackView.distribution = .fillEqually
        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let emojiLabels = ["맘에들어요", "심쿵했어요", "응원해요", "갖고싶어요"]
        let emojies = ["😊", "😍", "😉", "🤣"]
        for i in 0..<emojies.count {
            let stackView = UIStackView()
            stackView.axis = .vertical
            let emojiLabel = UILabel()
                emojiLabel.text = emojies[i]
                emojiLabel.textAlignment = .center
                emojiLabel.font = UIFont.systemFont(ofSize: 30)
            let label = UILabel()
                label.text = emojiLabels[i]
                label.font = UIFont.systemFont(ofSize: 12)
                label.textAlignment = .center
            let countLabel = UILabel()
                countLabel.text = "0"
                countLabel.font = UIFont.systemFont(ofSize: 10)
                countLabel.textAlignment = .center
            stackView.addArrangedSubview(emojiLabel)
            stackView.addArrangedSubview(label)
            stackView.addArrangedSubview(countLabel)
            rootStackView.addArrangedSubview(stackView)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
    }

}
