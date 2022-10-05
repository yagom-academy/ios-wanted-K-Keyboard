//
//  KorKeyboardView.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/05.
//

import UIKit

class KorKeyboardView: UIView {

    weak var delegate: KorKeyboardViewDelegate?
    var stack = [String]()
    var state = 0
    var letter: String { return KoreanData.letter(stack, state) }

    static let row1 = "ㅂㅈㄷㄱㅅㅛㅕㅑㅐㅔ".map { String($0) }
    static let row2 = "ㅁㄴㅇㄹㅎㅗㅓㅏㅣ".map { String($0) }
    static let row3 = "ㅋㅌㅊㅍㅠㅜㅡ".map { String($0) }

    let horizontal1: UIStackView = {
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
    }()

    let horizontal2: UIStackView = {
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
    }()

    let horizontal3: UIStackView = {
        let stackView = UIStackView()

        let shift: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "shift"), for: .normal)
            button.layer.cornerRadius = 5
            button.backgroundColor = .white
            button.tintColor = .black
            button.contentMode = .scaleAspectFit
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

        addViews()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension KorKeyboardView {
    func addViews() {
        [horizontal1, horizontal2, horizontal3, spaceBar, returnButton].forEach { self.addSubview($0) }
    }

    func setConstraints() {
        [horizontal1, horizontal2, horizontal3, spaceBar, returnButton].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            horizontal1.topAnchor.constraint(equalTo: self.topAnchor),
            horizontal1.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontal1.trailingAnchor.constraint(equalTo: self.trailingAnchor),
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

    @objc func korButtonPressed(_ sender: UIButton) {
        print(sender.currentTitle!)

        let char = sender.currentTitle!

        if KoreanData.vowel.contains(char) {

            switch state {
            case 0:
                delegate?.insertCharacter(char)
            case 0b10000:
                stack.append(char)
                state |= (1 << 3)
                delegate?.deleteCharacterBeforeCursor()
                delegate?.insertCharacter(letter)
            case 0b11000:
                if KoreanData.medialVowel[stack.last! + char] != nil {
                    stack.append(char)
                    state |= (1 << 2)
                    delegate?.deleteCharacterBeforeCursor()
                    delegate?.insertCharacter(letter)
                } else {
                    stack.removeAll()
                    state = 0
                    delegate?.insertCharacter(char)
                }

            default:
                if (state & 1) != 0 {
                    delegate?.deleteCharacterBeforeCursor()
                    let prev = stack.removeLast()
                    state -= 1
                    delegate?.insertCharacter(letter)
                    stack.removeAll()
                    stack.append(prev)
                    stack.append(char)
                    state = 0b11000
                    delegate?.insertCharacter(letter)

                } else if (state & (1 << 1)) != 0 {
                    delegate?.deleteCharacterBeforeCursor()
                    let prev = stack.removeLast()
                    state ^= (1 << 1)
                    delegate?.insertCharacter(letter)
                    stack.removeAll()
                    stack.append(prev)
                    stack.append(char)
                    state = 0b11000
                    delegate?.insertCharacter(letter)

                } else {
                    print("모음 예외 케이스 발생")
                }
            }

        } else {
            switch state {
            case 0:
                stack.append(char)
                state |= (1 << 4)
                delegate?.insertCharacter(letter)

            case 0b10000:
                stack.removeAll()
                stack.append(char)
                delegate?.insertCharacter(letter)
            case 0b11000, 0b11100:
                stack.append(char)
                state |= (1 << 1)
                delegate?.deleteCharacterBeforeCursor()
                delegate?.insertCharacter(letter)

            case 0b11010, 0b11110:
                if KoreanData.finalConsonant[stack.last! + char] != nil {
                    stack.append(char)
                    state |= (1 << 0)
                    delegate?.deleteCharacterBeforeCursor()
                    delegate?.insertCharacter(letter)

                } else {
                    stack.removeAll()
                    stack.append(char)
                    state = 0b10000
                    delegate?.insertCharacter(letter)
                }

            default:
                if (state & 1) != 0 {
                    stack.removeAll()
                    stack.append(char)
                    state = 0b10000
                    delegate?.insertCharacter(letter)

                } else {
                    print("자음 예외 케이스 발생")
                }
            }
        }
    }

    @objc func deletePressed() {
        if stack.isEmpty {
            delegate?.deleteCharacterBeforeCursor()
        } else {
            stack.removeLast()

            var pos = 0
            for i in 0 ..< 5 {
                if (state & (1 << i)) != 0 {
                    pos = i
                    break
                }
            }

            state ^= (1 << pos)
            delegate?.deleteCharacterBeforeCursor()
            delegate?.insertCharacter(letter)
        }
    }

    @objc func spacePressed() {
        if stack.isEmpty {
            delegate?.insertCharacter(" ")
        } else {
            stack.removeAll()
            state = 0
        }
    }
}
