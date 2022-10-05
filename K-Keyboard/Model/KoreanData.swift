//
//  File.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/06.
//

import Foundation

struct KoreanData {
    static let vowel = Set("ㅛㅕㅑㅐㅔㅗㅓㅏㅣㅠㅜㅡ".map { String($0) })

    static let initialConsonant: [String: Int] = [
        "ㄱ": 0,
        "ㄲ": 1,
        "ㄴ": 2,
        "ㄷ": 3,
        "ㄸ": 4,
        "ㄹ": 5,
        "ㅁ": 6,
        "ㅂ": 7,
        "ㅃ": 8,
        "ㅅ": 9,
        "ㅆ": 10,
        "ㅇ": 11,
        "ㅈ": 12,
        "ㅉ": 13,
        "ㅊ": 14,
        "ㅋ": 15,
        "ㅌ": 16,
        "ㅍ": 17,
        "ㅎ": 18
    ]

    static let medialVowel: [String: Int] = [
        "ㅏ": 0,
        "ㅐ": 1,
        "ㅑ": 2,
        "ㅒ": 3,
        "ㅓ": 4,
        "ㅔ": 5,
        "ㅕ": 6,
        "ㅖ": 7,
        "ㅗ": 8,
        "ㅗㅏ": 9,
        "ㅗㅐ": 10,
        "ㅗㅣ": 11,
        "ㅛ": 12,
        "ㅜ": 13,
        "ㅜㅓ": 14,
        "ㅜㅔ": 15,
        "ㅜㅣ": 16,
        "ㅠ": 17,
        "ㅡ": 18,
        "ㅡㅣ": 19,
        "ㅣ": 20
    ]

    static let finalConsonant: [String: Int] = [
        "ㄱ": 1,
        "ㄲ": 2,
        "ㄱㅅ": 3,
        "ㄴ": 4,
        "ㄴㅈ": 5,
        "ㄴㅎ": 6,
        "ㄷ": 7,
        "ㄹ": 8,
        "ㄹㄱ": 9,
        "ㄹㅁ": 10,
        "ㄹㅂ": 11,
        "ㄹㅅ": 12,
        "ㄹㅌ": 13,
        "ㄹㅍ": 14,
        "ㄹㅎ": 15,
        "ㅁ": 16,
        "ㅂ": 17,
        "ㅂㅅ": 18,
        "ㅅ": 19,
        "ㅆ": 20,
        "ㅇ": 21,
        "ㅈ": 22,
        "ㅊ": 23,
        "ㅋ": 24,
        "ㅌ": 25,
        "ㅍ": 26,
        "ㅎ": 27
    ]

    private static let unicodeBase = 44032
    private static let initialNum = 588
    private static let medialNum = 28
    private static let mask = 0b11111

    static func letter(_ stack: [String], _ state: Int) -> String {
        var unicodeValue = unicodeBase

        switch stack.count {
        case 2:
            unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1]]! * medialNum
        case 3:
            if (state & mask) == 0b11010 {
                unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1]]! * medialNum + finalConsonant[stack[2]]!
            } else {
                unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1] + stack[2]]! * medialNum
            }
        case 4:
            if (state & mask) == 0b11011 {
                unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1]]! * medialNum + finalConsonant[stack[2] + stack[3]]!
            } else {
                unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1] + stack[2]]! * medialNum + finalConsonant[stack[3]]!
            }
        case 5:
            unicodeValue += initialConsonant[stack[0]]! * initialNum + medialVowel[stack[1] + stack[2]]! * medialNum + finalConsonant[stack[3] + stack[4]]!
        default:
            return stack.isEmpty ? "" : stack[0]
        }

        return String(UnicodeScalar(unicodeValue)!)
    }
}
