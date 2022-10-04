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
    let doubleFinalConsonants: [String : [String]] = ["ㄱ" : ["ㅅ", "ㄳ"],
                                                      "ㄴ" : ["ㅈ", "ㅎ", "ㄵ", "ㄶ"],
                                                      "ㄹ" : ["ㄱ", "ㅁ", "ㅂ", "ㅅ", "ㅌ", "ㅍ", "ㅎ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ","ㅀ"],
                                                      "ㅂ" : ["ㅅ", "ㅄ"]]
    let doubleFinalConsonantReverses: [String : [String]] = [
                                                        "ㄳ" : ["ㄱ", "ㅅ"],
                                                        "ㄵ" : ["ㄴ", "ㅈ"],
                                                        "ㄶ" : ["ㄴ", "ㅎ"],
                                                        "ㄺ" : ["ㄹ", "ㄱ"],
                                                        "ㄻ" : ["ㄹ", "ㅁ"],
                                                        "ㄼ" : ["ㄹ", "ㅂ"],
                                                        "ㄽ" : ["ㄹ", "ㅅ"],
                                                        "ㄾ" : ["ㄹ", "ㅌ"],
                                                        "ㄿ" : ["ㄹ", "ㅍ"],
                                                        "ㅀ" : ["ㄹ", "ㅎ"],
                                                        "ㅄ" : ["ㅂ", "ㅅ"]]
    var lastWord = ""
    var totalWords: [String] = []
    
    func insertLogic(state: KeyboardState, text: String, keyType: KeyType) -> (KeyboardState, String, Bool) {
        
        if keyType == .space {
            lastWord = " "
            totalWords.append(" ")
            return (.start, lastWord, false)
        }
        
        switch state {
        case .start:
            lastWord = text
            totalWords.append(text)
            if keyType == .vowel {
                return (.vowelOnly, lastWord, false)
            } else {
                return (.firstConsonantOnly, lastWord, false)
            }
        case .firstConsonantOnly:
            if keyType == .vowel {
                let value = combinationToComplete(chosung: lastWord, jungsung: text, jongsung: nil)
                lastWord = value
                totalWords.append(text)
                return (.consonantPlusVowel, lastWord, true)
            } else {
                if doubleConsonants.keys.contains(lastWord) && totalWords.last == text {
                    lastWord = doubleConsonants[text] ?? ""
                    totalWords.append(text)
                    return (.firstConsonantOnly, lastWord, true)
                } else {
                    lastWord = text
                    totalWords.append(text)
                    return (.firstConsonantOnly, lastWord, false)
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
                            return (.vowelOnly, lastWord, true)
                        } else {
                            lastWord = text
                            totalWords.append(text)
                            return (.vowelOnly, lastWord, false)
                        }
                    } else {
                        print("dictionary error")
                    }
                } else {
                    lastWord = text
                    totalWords.append(text)
                    return (.vowelOnly, lastWord, false)
                }
            } else {
                lastWord = text
                totalWords.append(text)
                return (.firstConsonantOnly, lastWord, false)
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
                    return (.firstConsonantOnly, lastWord, false)
                } else {
                    let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + (jongUni) + 0xAC00;
                    if let uni = Unicode.Scalar(uniValue) {
                        lastWord = String(Character(uni))
                        return (.finalConsonant, lastWord, true)
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
                                return (.consonantPlusVowel, lastWord, true)
                            }
                        } else {
                            lastWord = text
                            totalWords.append(text)
                            return (.vowelOnly, lastWord, false)
                        }
                } else {
                    print("unicode transformation error")
                }
            } else {
                lastWord = text
                totalWords.append(text)
                return (.vowelOnly, lastWord, false)
            }
        }
        case .finalConsonant:
            if keyType == .consonant {
                var (choUni, jungUni, jongUni) = completeToCombination(word: lastWord)
                var lastFinalConsonant = finalConsonants[jongUni]
                if doubleFinalConsonants.keys.contains(lastFinalConsonant) {
                    if let isContain = doubleFinalConsonants[lastFinalConsonant]?.contains(text) {
                        if isContain {
                            switch lastFinalConsonant {
                            case "ㄱ", "ㅂ":
                                lastFinalConsonant = (doubleFinalConsonants[lastFinalConsonant]?.last)!
                            case "ㄹ":
                                let index = doubleFinalConsonants[lastFinalConsonant]?.firstIndex(of: text)
                                lastFinalConsonant = (doubleFinalConsonants[lastFinalConsonant]?[index! + 7])!
                            case "ㄴ":
                                let index = doubleFinalConsonants[lastFinalConsonant]?.firstIndex(of: text)
                                lastFinalConsonant = (doubleFinalConsonants[lastFinalConsonant]?[index! + 2])!
                            default:
                                lastFinalConsonant = ""
                            }
                            totalWords.append(text)

                            for i in 0 ..< finalConsonants.count {
                                if finalConsonants[i] == lastFinalConsonant { jongUni = i }
                            }
                            
                            let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + jongUni + 0xAC00;
                            if let uni = Unicode.Scalar(uniValue) {
                                lastWord = String(Character(uni))
                                return (.finalConsonant, lastWord, true)
                            }
                        } else {
                            totalWords.append(text)
                            lastWord = text
                            return (.firstConsonantOnly, lastWord, false)
                        }
                    } else {
                        print("unicode transformation error")
                    }
                } else {
                    lastWord = text
                    totalWords.append(text)
                    return (.firstConsonantOnly, lastWord, false)
                }
            } else {
                var (choUni, jungUni, jongUni) = completeToCombination(word: lastWord)
                let finalConsonant = finalConsonants[jongUni]
                if doubleFinalConsonantReverses.keys.contains(finalConsonant) {
                    let firstFinalConsonant = doubleFinalConsonantReverses[finalConsonant]?.first
                    let lastFinalConsonant = (doubleFinalConsonantReverses[finalConsonant]?.last)!
                    
                    for i in 0 ..< finalConsonants.count {
                        if finalConsonants[i] == firstFinalConsonant { jongUni = i }
                    }
                    
                    let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + jongUni + 0xAC00
                    guard let uni = Unicode.Scalar(uniValue) else { return (.start, lastWord, false) }
                    let previousValue = String(Character(uni))
                    let newValue = combinationToComplete(chosung: lastFinalConsonant, jungsung: text, jongsung: nil)
                    lastWord = newValue
                    totalWords.append(text)
                    return (.consonantPlusVowel, previousValue + newValue, true)
                    
                } else {
                    let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + 0xAC00;
                    guard let uni = Unicode.Scalar(uniValue) else { return (.start, lastWord, false) }
                    let previousValue = String(Character(uni))
                    let newValue = combinationToComplete(chosung: finalConsonant, jungsung: text, jongsung: nil)
                    lastWord = newValue
                    totalWords.append(text)
                    return (.consonantPlusVowel, previousValue + newValue, true)
                }
            }
        }
        return (.start, text, false)
    }
    
    func combinationToComplete(chosung: String, jungsung: String, jongsung:String?) -> String {
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
        
        return ""
    }
    
    func completeToCombination(word: String) -> (Int, Int, Int) {
        let completeUniValue = word.utf16.map { Int($0) }.reduce(0, +)
        let jongsungUniValue: Int = (completeUniValue - 0xAC00) % 28
        let jungsungUniValue: Int = (completeUniValue - 0xAC00) % (28 * 21) / 28
        let chosungUniValue: Int =  (completeUniValue - 0xAC00) / (28 * 21)
        return (chosungUniValue, jungsungUniValue, jongsungUniValue)
    }
    
}
