//
//  KorKeyboardView.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/05.
//

import UIKit

protocol KorKeyboardViewDelegate: class {
    func insertCharacter(_ input: String)
    func deleteCharacterBeforeCursor()
}

class KorKeyboardView: UIView {

    weak var delegate: KorKeyboardViewDelegate?
    var stack = [String]()
    var state = 0
    var letter: String { return KoreanData.letter(stack, state) }
    var isShiftPressed: Bool = false
    
    lazy var horizontal1 = UIStackView()
    lazy var horizontal1Shift = UIStackView()
    lazy var horizontal2 = UIStackView()
    lazy var horizontal3 = UIStackView()

    let shift: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "shift"), for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(shiftPressed), for: .touchUpInside)
        
        return button
    }()
    
    let delete: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "delete.backward"), for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .white
        button.tintColor = .black
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(deletePressed), for: .touchUpInside)

        return button
    }()

    let spaceBar: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.setTitle("space", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(spacePressed), for: .touchUpInside)
        return button
    }()

    let returnButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.setTitle("return", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        horizontal1 = makeHorizontal1()
        horizontal1Shift = makeHorizontal1Shift()
        horizontal2 = makeHorizontal2()
        horizontal3 = makeHorizontal3(shift: self.shift, delete: self.delete)
        
        addViews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension KorKeyboardView {
    
    func makeHorizontal1() -> UIStackView {
        let row1 = "ㅂㅈㄷㄱㅅㅛㅕㅑㅐㅔ".map { String($0) }
        let stackView = UIStackView()

        for char in row1 {
            let button = UIButton()
            button.layer.cornerRadius = 5
            button.setTitle(char, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(korButtonPressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)

        return stackView
    }
    
    func makeHorizontal2() -> UIStackView {
        let row2 = "ㅁㄴㅇㄹㅎㅗㅓㅏㅣ".map { String($0) }
        let stackView = UIStackView()

        for char in row2 {
            let button = UIButton()
            button.layer.cornerRadius = 5
            button.setTitle(char, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(korButtonPressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        return stackView
    }
    
    func makeHorizontal1Shift() -> UIStackView {
        let row1Shift = "ㅃㅉㄸㄲㅆㅛㅕㅑㅒㅖ".map { String($0) }
        let stackView = UIStackView()

        for char in row1Shift {
            let button = UIButton()
            button.layer.cornerRadius = 5
            button.setTitle(char, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(korButtonPressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        stackView.isHidden = true

        return stackView
    }
    
    func makeHorizontal3(shift: UIButton, delete: UIButton) -> UIStackView {
        let row3 = "ㅋㅌㅊㅍㅠㅜㅡ".map { String($0) }
        let stackView = UIStackView()
        stackView.addArrangedSubview(shift)

        for char in row3 {
            let button = UIButton()
            button.layer.cornerRadius = 5
            button.setTitle(char, for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(korButtonPressed), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        stackView.addArrangedSubview(delete)

        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)

        stackView.setCustomSpacing(16, after: shift)
        stackView.setCustomSpacing(16, after: stackView.arrangedSubviews[row3.count])

        return stackView
    }

}

extension KorKeyboardView {
    func addViews() {
        [horizontal1, horizontal1Shift, horizontal2, horizontal3, spaceBar, returnButton].forEach { self.addSubview($0) }
    }
    
    func setConstraints() {
        [horizontal1, horizontal1Shift, horizontal2, horizontal3, spaceBar, returnButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            horizontal1.topAnchor.constraint(equalTo: self.topAnchor),
            horizontal1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontal1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontal1Shift.topAnchor.constraint(equalTo: horizontal1.topAnchor),
            horizontal1Shift.leadingAnchor.constraint(equalTo: horizontal1.leadingAnchor),
            horizontal1Shift.trailingAnchor.constraint(equalTo: horizontal1.trailingAnchor),
            horizontal1Shift.bottomAnchor.constraint(equalTo: horizontal1.bottomAnchor),
            horizontal2.topAnchor.constraint(equalTo: horizontal1.bottomAnchor, constant: 12),
            horizontal2.leadingAnchor.constraint(equalTo: horizontal1.leadingAnchor),
            horizontal2.trailingAnchor.constraint(equalTo: horizontal1.trailingAnchor),
            horizontal3.topAnchor.constraint(equalTo: horizontal2.bottomAnchor, constant: 12),
            horizontal3.leadingAnchor.constraint(equalTo: horizontal1.leadingAnchor),
            horizontal3.trailingAnchor.constraint(equalTo: horizontal1.trailingAnchor),
            spaceBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            spaceBar.topAnchor.constraint(equalTo: horizontal3.bottomAnchor, constant: 12),
            spaceBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            returnButton.leadingAnchor.constraint(equalTo: spaceBar.trailingAnchor, constant: 6),
            returnButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4),
            returnButton.bottomAnchor.constraint(equalTo: spaceBar.bottomAnchor),
            returnButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
    }
}
