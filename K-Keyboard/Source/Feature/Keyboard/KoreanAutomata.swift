//
//  KoreanAutomata.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/09/30.
//

import UIKit

enum Korean {
    case consonant
    case vowel
}

class KoreanAutomata {
    static let shared = KoreanAutomata()
    
    let firstConsonants: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    let doubleConsonants: [String: String] = ["ㄱ" : "ㄲ", "ㄷ": "ㄸ", "ㅂ": "ㅃ", "ㅅ": "ㅆ", "ㅈ": "ㅉ"]
    
    let vowels: [String] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ",
                               "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
    let doubleVowels: [String : [String]] = ["ㅗ": ["ㅏ", "ㅐ", "ㅣ", "ㅘ", "ㅙ", "ㅚ"],
                                             "ㅜ": ["ㅓ", "ㅔ", "ㅣ", "ㅝ", "ㅞ", "ㅟ"],
                                             "ㅡ": ["ㅣ", "ㅢ"]]
    let finalConsonants: [String] = [" ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ","ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    var lastWord = ""
    var totalWords: [String] = []
    
    func insertLogic(state: KeyboardState, text: String, keyType: KeyType) -> (KeyboardState, String) {
        
        if keyType == .space {
            lastWord = " "
            return (.start, lastWord)
        }
        
        switch state {
        case .start:
            lastWord = text
            totalWords.append(text)
            if keyType == .vowel {
                return (.vowelOnly, lastWord)
            } else {
                return (.firstConsonantOnly, lastWord)
            }
        case .firstConsonantOnly:
            if keyType == .vowel {
                let value = combinationToComplete(chosung: lastWord, jungsung: text, jongsung: nil)
                lastWord = value ?? ""
                totalWords.append(text)
                return (.consonantPlusVowel, lastWord)
            } else {
                if doubleConsonants.keys.contains(lastWord) && totalWords.last == text {
                    lastWord = doubleConsonants[text] ?? ""
                    totalWords.append(text)
                    return (.firstConsonantOnly, lastWord)
                } else {
                    lastWord = text
                    totalWords.append(text)
                    return (.firstConsonantOnly, lastWord)
                }
            }
        case .vowelOnly:
            if keyType == .vowel {
                if doubleVowels.keys.contains(lastWord) {
                    if let isContain = doubleVowels[lastWord]?.contains(text) {
                        if isContain {
                            if lastWord == "ㅡ" {
                                lastWord = (doubleVowels[lastWord]?.last)!
                            } else {
                                let index = doubleVowels[lastWord]?.firstIndex(of: text)
                                lastWord = (doubleVowels[lastWord]?[index! + 3])!
                            }
                            totalWords.append(text)
                            return (.vowelOnly, lastWord)
                        } else {
                            lastWord = text
                            totalWords.append(text)
                            return (.vowelOnly, lastWord)
                        }
                    } else {
                        print("dictionary error")
                    }
                } else {
                    lastWord = text
                    totalWords.append(text)
                    return (.vowelOnly, lastWord)
                }
            } else {
                lastWord = text
                totalWords.append(text)
                return (.firstConsonantOnly, lastWord)
            }
        case .consonantPlusVowel:
            if keyType == .consonant {
                var (choUni, jungUni, jongUni) = completeToCombination(word: lastWord)
                
                for i in 0 ..< finalConsonants.count {
                    if finalConsonants[i] == text { jongUni = i }
                }
                
                if jongUni == 0 {
                    lastWord = text
                    totalWords.append(text)
                    return (.firstConsonantOnly, lastWord)
                } else {
                    let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + (jongUni) + 0xAC00;
                    if let uni = Unicode.Scalar(uniValue) {
                        lastWord = String(Character(uni))
                        return (.finalConsonant, lastWord)
                    }
                }
            } else {
                var (choUni, jungUni, _) = completeToCombination(word: lastWord)
                
                var lastVowel = totalWords.last!
                if doubleVowels.keys.contains(lastVowel) {
                    if let isContain = doubleVowels[lastVowel]?.contains(text) {
                        if isContain {
                            if lastVowel == "ㅡ" {
                                lastVowel = (doubleVowels[lastVowel]?.last)!
                            } else {
                                let index = doubleVowels[lastVowel]?.firstIndex(of: text)
                                lastVowel = (doubleVowels[lastVowel]?[index! + 3])!
                            }
                            totalWords.append(text)

                            for i in 0 ..< vowels.count {
                                if vowels[i] == lastVowel { jungUni = i }
                            }
                            
                            let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + 0xAC00;
                            if let uni = Unicode.Scalar(uniValue) {
                                lastWord = String(Character(uni))
                                return (.consonantPlusVowel, lastWord)
                            }
                        } else {
                            lastWord = text
                            totalWords.append(text)
                            return (.vowelOnly, lastWord)
                        }
                } else {
                    lastWord = text
                    totalWords.append(text)
                    return (.vowelOnly, lastWord)
                }
            } else {
                print("unicode transformation error")
            }
        }
        case .finalConsonant:
            return (.start, text)
        }
        
        
        
        return (.start, text)
    }
    
    func combinationToComplete(chosung: String, jungsung: String, jongsung:String?) -> String? {
        var chosungIndex = 0
        var jungsungIndex = 0
        var jongsungIndex = 0
        
        for i in 0 ..< firstConsonants.count {
            if firstConsonants[i] == chosung { chosungIndex = i }
        }
        
        for i in 0 ..< vowels.count {
            if vowels[i] == jungsung { jungsungIndex = i }
        }
        
        for i in 0 ..< finalConsonants.count {
            if finalConsonants[i] == jongsung { jongsungIndex = i }
        }
        
        let uniValue:Int = (chosungIndex * 21 * 28) + (jungsungIndex * 28) + (jongsungIndex) + 0xAC00;
        if let uni = Unicode.Scalar(uniValue) {
            return String(Character(uni))
        }
        
        return nil
    }
    
    func completeToCombination(word: String) -> (Int, Int, Int) {
        let completeUniValue = word.utf16.map { Int($0) }.reduce(0, +)
        let jongsungUniValue: Int = (completeUniValue - 0xAC00) % 28
        let jungsungUniValue: Int = (completeUniValue - 0xAC00) % (28 * 21) / 28
        let chosungUniValue: Int =  (completeUniValue - 0xAC00) / (28 * 21)
        return (chosungUniValue, jungsungUniValue, jongsungUniValue)
    }
    
}
