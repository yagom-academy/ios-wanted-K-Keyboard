//
//  AssembleHangul.swift
//  custom-keyboard
//
//  Created by 신동원 on 2022/10/02.
//

import Foundation

struct Hangle {
    var cho: Character = " "
    var jung: Character = " "
    var jong: Character = " "
}

enum Sung {
    case cho
    case jung
    case jong
}

class AssembleHangul {
    
    static let shared = AssembleHangul()
    
    let cho:[Character] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]

    let jung:[Character] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ",
                            "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
    let jong:[Character] = [" ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ",
                            "ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    
    let twiceJung:[String:Character] = ["ㅗㅏ":"ㅘ", "ㅗㅐ":"ㅙ", "ㅗㅣ":"ㅚ", "ㅜㅓ":"ㅝ", "ㅜㅔ":"ㅞ", "ㅜㅣ":"ㅟ", "ㅡㅣ":"ㅢ"]
    
    let twiceJong:[String:Character] = ["ㄱㄱ":"ㄲ", "ㄱㅅ":"ㄳ", "ㄴㅈ":"ㄵ", "ㄴㅎ":"ㄶ", "ㄹㄱ":"ㄺ", "ㄹㅁ":"ㄻ", "ㄹㅂ":"ㄼ", "ㄹㅅ":"ㄽ", "ㄹㅌ":"ㄾ", "ㄹㅍ":"ㄿ", "ㄹㅎ":"ㅀ" ]
    
    func whatIsSung(char: Character) -> Sung {
        
        if jong.contains(char) {
            return .jong
        } else if cho.contains(char) {
            return .cho
        } else {
            return .jung
        }
    }
    
    
    func hangle(c1:Character,c2:Character,c3:Character) -> Character? {
        var cho_i = 0
        var jung_i = 0
        var jong_i = 0
        for i in 0 ..< cho.count {
            if cho[i] == c1 { cho_i = i }
        }
        
        for i in 0 ..< jung.count {
            if jung[i] == c2 { jung_i = i }
        }
        
        for i in 0 ..< jong.count {
            if jong[i] == c3 { jong_i = i }
        }
        
        let uniValue:Int = (cho_i * 21 * 28) + (jung_i * 28) + (jong_i) + 0xAC00;
        if let uni = Unicode.Scalar(uniValue) {
            return Character(uni)
        }
        
        return nil
    }
}
