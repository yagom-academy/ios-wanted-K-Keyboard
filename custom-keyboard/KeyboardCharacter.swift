//
//  KeyboardCharacter.swift
//  custom-keyboard
//
//  Created by 신동원 on 2022/09/30.
//

import UIKit

enum KeyboardLine:Int {
    case number = 0
    case qwerty
    case asdfgh
    case zxcvbn
}

class KeyboardCharacter {
    static let characterList = [
        ["1","2","3","4","5","6","7","8","9","0"],
        ["ㅂ","ㅈ","ㄷ","ㄱ","ㅅ","ㅛ","ㅕ","ㅑ","ㅐ","ㅔ"],
        ["ㅁ","ㄴ","ㅇ","ㄹ","ㅎ","ㅗ","ㅓ","ㅏ","ㅣ"],
        ["ㅋ","ㅌ","ㅊ","ㅍ","ㅠ","ㅜ","ㅡ"]
    ]
    
    
    static let KoKeyboardButtonText:[KeyboardLine: [String]] = [
        .number:characterList[0],
        .qwerty:characterList[1],//"ㅂ,ㅈ,ㄷ,ㄱ,ㅅ,ㅛ,ㅕ,ㅑ,ㅐ,ㅔ
        .asdfgh:characterList[2],//"ㅁ,ㄴ,ㅇ,ㄹ,ㅎ,ㅗ,ㅓ,ㅏ,ㅣ
        .zxcvbn:characterList[3]//"ㅋ,ㅌ,ㅊ,ㅍ,ㅠ,ㅜ,ㅡ
    ]
    
    static func getLineText(keyboardLine: KeyboardLine) -> ([String]){
        switch keyboardLine {
        case .qwerty: return (KoKeyboardButtonText[.qwerty]!)
        case .asdfgh: return (KoKeyboardButtonText[.asdfgh]!)
        case .zxcvbn: return (KoKeyboardButtonText[.zxcvbn]!)
        case .number: return (KoKeyboardButtonText[.number]!)
        }
    }
    
}

