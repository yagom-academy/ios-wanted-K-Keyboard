//
//  KorKeyboardView+Action.swift
//  K-Keyboard
//
//  Created by channy on 2022/10/07.
//

import UIKit

extension KorKeyboardView {
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
            case 0b11100:
                delegate?.deleteCharacterBeforeCursor()
                delegate?.insertCharacter(letter)
                stack.removeAll()
                delegate?.insertCharacter(char)
                state = 0
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
        
        if self.isShiftPressed == true {
            shiftPressed()
        }
    }

    @objc func deletePressed() {
        if stack.isEmpty {
            delegate?.deleteCharacterBeforeCursor()
        } else {
            stack.removeLast()

            for i in 0 ..< 5 {
                if (state & (1 << i)) != 0 {
                    state ^= (1 << i)
                    break
                }
            }

            delegate?.deleteCharacterBeforeCursor()
            delegate?.insertCharacter(letter)
        }
        
        if self.isShiftPressed == true {
            shiftPressed()
        }
    }

    @objc func spacePressed() {
        if stack.isEmpty {
            delegate?.insertCharacter(" ")
        } else {
            stack.removeAll()
            state = 0
        }
        
        if self.isShiftPressed == true {
            shiftPressed()
        }
    }
    
    @objc func shiftPressed() {
        if self.isShiftPressed {
            print("change to X")
            self.isShiftPressed = false
            DispatchQueue.main.async {
                self.horizontal1.isHidden = false
                self.horizontal1Shift.isHidden = true
            }
        } else {
            print("Shift pressed")
            self.isShiftPressed = true
            DispatchQueue.main.async {
                self.horizontal1.isHidden = true
                self.horizontal1Shift.isHidden = false
            }
        }
    }

    @objc func shortcutPressed(_ sender: UIButton) {
        delegate?.insertCharacter(ShortcutData.now)
    }

    @objc func shortcutLongTapped() {
        delegate?.showShortcutView()
    }
}
