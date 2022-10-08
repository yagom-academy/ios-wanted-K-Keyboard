//
//  HangulCombinator.swift
//  custom-keyboard
//
//  Created by 유영훈 on 2022/10/02.
//

import Foundation

extension CharacterSet{
    static var modernHangul: CharacterSet{
        return CharacterSet(charactersIn: ("가".unicodeScalars.first!)...("힣".unicodeScalars.first!))
    }
}

class HangulCombinater {
    
    enum HangulType {
        /// 초성
        case cho
        /// 중성
        case jung
        /// 종성
        case jong
    }
    
    static let shared = HangulCombinater()
    
    private let HANGUL_START_INDEX: UInt32 = 44032
    private let CYCLE_CHO :UInt32 = 588
    private let CYCLE_JUNG :UInt32 = 28
    private let charList: [HangulType: [String]] = [
        .cho: ["ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"],
        .jung: ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅗㅏ", "ㅗㅐ", "ㅗㅣ", "ㅛ", "ㅜ", "ㅜㅓ", "ㅜㅔ", "ㅜㅣ", "ㅠ", "ㅡ", "ㅡㅣ", "ㅣ"],
        .jong: [" ", "ㄱ", "ㄲ", "ㄱㅅ", "ㄴ", "ㄴㅈ", "ㄴㅎ", "ㄷ", "ㄹ", "ㄹㄱ", "ㄹㅁ", "ㄹㅂ", "ㄹㅅ", "ㄹㅌ", "ㄹㅍ", "ㄹㅎ", "ㅁ", "ㅂ", "ㅂㅅ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    ]
    
    /**
        문자의 자음, 모음을 분해합니다.
     
        - Returns: 문자를 이루는 자음, 모음 배열
     */
    func getJamo(_ char: String) -> [String] {
        if getUnicode(char)! < HANGUL_START_INDEX {
            return []
        }
        let index = getUnicode(char)! - HANGUL_START_INDEX
        let cho = charList[.cho]![Int(index / CYCLE_CHO)]
        let jung = charList[.jung]![Int((index % CYCLE_CHO) / CYCLE_JUNG)]
        let jong = charList[.jong]![Int(index % CYCLE_JUNG)]
        return [cho, jung, jong]
    }
    
    
    /**
        문자의 유니코드를 반환합니다.
     
        - Returns: 해당 한글의 유니코드 반환, 한글이 아니거나 자음, 모음만 인경우는 0반환
     */
    func getUnicode(_ char: String) -> UInt32? {
        if CharacterSet.modernHangul.contains(char.unicodeScalars.first!) {
            return char.unicodeScalars.first!.value
        } else {
            return 0
        }
    }
    
    /**
        유니코드 위치 계산을 위한 자음, 모음의 index를 계산합니다.
     
        - Returns: 자음, 모음의 index 반환, charList에 정의되지않은 문자는 nil 반환
     */
    func getJamoIndex(_ type: HangulType, _ jamo: String) -> Int? {
        return charList[type]!.firstIndex(where: { $0 == jamo })
    }
    
    /**
        한글 자모를 케이스에 맞게 조합하여 반환합니다.
     
        ```
        preChar: 직전 입력된 텍스트
        curChar: 최근 입력된 텍스트
        ```
     
        - Returns: 조합된 한글, 혹은 조합되지 않는 케이스에는 입력값 그대로 반환
     */
    func replaceJamo(_ preChar: String, _ curChar: String) -> [String] {
        // preChar가 완성된 한글인가?
        if getUnicode(preChar) != 0 {
            let jamo = getJamo(preChar)
            // MARK: 종성 있음.
            if jamo.last! == " " {
                // 자음은 종성에 결합, 모음은 모음끼리 결합.
                if isJongsung(curChar) {
                    return [getCombinedJamo(jamo[0], jamo[1], curChar)]
                }
                else {
                    // 결합 가능한 모음인가?
                    if getJamoIndex(.jung, jamo[1]+curChar) != nil {
                        return [getCombinedJamo(jamo[0], jamo[1]+curChar)]
                    }
                    else {
                        return [curChar]
                    }
                }
            }
            // MARK: 종성 없음
            else {
                if isJungsung(curChar) {
                    if Array(jamo[2]).count == 2 {
                        let jong = Array(jamo[2])
                        return [getCombinedJamo(String(jong[1]), curChar), getCombinedJamo(jamo[0], jamo[1], String(jong[0]))]
                    }
                    else {
                        return [getCombinedJamo(jamo[2], curChar), getCombinedJamo(jamo[0], jamo[1])]
                    }
                }
                else {
                    // 겹받침 조합이 가능한가?
                    if getJamoIndex(.jong, jamo[2]+curChar) != nil {
                        return [getCombinedJamo(jamo[0], jamo[1], jamo[2]+curChar)]
                    }
                    else {
                        return [curChar]
                    }
                }
            }
        }
        else {
            // no
            if isJungsung(curChar) {
                // 초성 + 중성
                if isChosung(preChar) {
                    return [getCombinedJamo(preChar, curChar)]
                }
                else {
                    return [curChar]
                }
            }
            else {
                return [curChar]
            }
        }
    }
    
    func isChosung(_ char: String) -> Bool {
        return (charList[.cho]!.firstIndex(where: { $0 == char }) != nil)
    }
    
    func isJungsung(_ char: String) -> Bool {
        return (charList[.jung]!.firstIndex(where: { $0 == char }) != nil)
    }
    
    func isJongsung(_ char: String) -> Bool {
        return (charList[.jong]!.firstIndex(where: { $0 == char }) != nil)
    }
    
    func getCombinedJamo(_ cho: String, _ jung: String, _ jong: String = " ") -> String {
        let choIndex = charList[.cho]!.firstIndex(where: { $0 == cho })!
        let jungIndex = charList[.jung]!.firstIndex(where: { $0 == jung })!
        let jongIndex = charList[.jong]!.firstIndex(where: { $0 == jong })!
        var unicode = ((choIndex * Int(CYCLE_CHO)) + (jungIndex * Int(CYCLE_JUNG)) + jongIndex) + Int(HANGUL_START_INDEX)
        
        return (Unicode.Scalar(unicode)?.escaped(asASCII: false))!
    }
    
    func separateJamo(_ preChar: String) -> String? {
        var unicode = 0
        let jamo = getJamo(preChar)
        if jamo.isEmpty { return nil }
        let choIndex = getJamoIndex(.cho, jamo[0])!
        let jungIndex = getJamoIndex(.jung, jamo[1])!
        let jongIndex = getJamoIndex(.jong, jamo[2])!
        
        unicode = ((choIndex * Int(CYCLE_CHO)) + (jungIndex * Int(CYCLE_JUNG)) + jongIndex) + Int(HANGUL_START_INDEX)
        
        //겹받침일 경우 종성을 나누고 두번째 종성을 지운다 ex) ㄹㅂ -> ㄹ
        //겹받침이 아니라면 newJongIndex의 값은 0 이므로 jongIndex 값만 빠지고, 종성이 사라진다
        let newIndex = separateJungSungJongSung(jamo[1],jamo[2])
        
        
        if jongIndex != 0 {        //받침이 존재 할때
            unicode -= jongIndex    //기존 받침을 모두 지우고
            unicode += newIndex[1]     //겹받침 이라면 첫번째 종성을 새로 다시 더한다
            
        } else if newIndex[0] != 0 {        //받침이 존재하지 않고 결합된 모음 ex) ㅚ ㅙ ㅟ... 이라면
            unicode -= jungIndex * Int(CYCLE_JUNG)    //기존 중성을 모두 지우고
            unicode += newIndex[0] * Int(CYCLE_JUNG)     // 첫번째 중성을 새로 다시 더한다
        }
        
        else {
            if jamo.last == " " {
                return jamo.first!
            }
        }
        
        return Unicode.Scalar(unicode)?.escaped(asASCII: false)
    }
    
    func separateJungSungJongSung(_ jungSung: String, _ jongSung: String) -> [Int] {
        
        var jungIndex: Int = 0
        var jongIndex: Int = 0
        var jungArray: [Character] = []
        var jongArray: [Character] = []
        
        for index in jungSung.indices {
            jungArray.append(jungSung[index])
        }
        
        for index in jongSung.indices {
            jongArray.append(jongSung[index])
        }
        
        if jungArray.count > 1 {
            jungIndex = getJamoIndex(.jung, String(jungArray[0]))!
        }
        
        if jongArray.count > 1 {
            jongIndex = getJamoIndex(.jong, String(jongArray[0]))!
        }
        
        return [jungIndex, jongIndex]
        
    }
    
}
