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
    let doubleConsonants: [String: String] = ["ㄱ" : "ㄲ",
                                              "ㄷ": "ㄸ",
                                              "ㅂ": "ㅃ",
                                              "ㅅ": "ㅆ",
                                              "ㅈ": "ㅉ"]
    let doubleConsonantReverses: [String: String] = ["ㄲ" : "ㄱ",
                                                     "ㄸ": "ㄷ",
                                                     "ㅃ": "ㅂ",
                                                     "ㅆ": "ㅅ",
                                                     "ㅉ": "ㅈ"]
    let vowels: [String] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ",
                               "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
    let doubleVowels: [String : [String]] = ["ㅗ": ["ㅏ", "ㅐ", "ㅣ", "ㅘ", "ㅙ", "ㅚ"],
                                             "ㅜ": ["ㅓ", "ㅔ", "ㅣ", "ㅝ", "ㅞ", "ㅟ"],
                                             "ㅡ": ["ㅣ", "ㅢ"]]
    let doubleVowelReverses: [String : [String]] = ["ㅘ" : ["ㅗ", "ㅏ"],
                                                    "ㅙ" : ["ㅗ", "ㅐ"],
                                                    "ㅚ" : ["ㅗ", "ㅣ"],
                                                    "ㅝ" : ["ㅜ", "ㅓ"],
                                                    "ㅞ" : ["ㅜ", "ㅔ"],
                                                    "ㅟ" : ["ㅜ", "ㅣ"],
                                                    "ㅢ" : ["ㅡ", "ㅣ"]]
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
    var latestStatus: [KeyboardState] = []
    
    func insertLogic(state: KeyboardState, text: String, keyType: KeyType) -> (KeyboardState, String, Bool) {
        
        // Space 키 입력시 처리
        if keyType == .space {
            return sendKeyboardData(state: .start,
                                    text: " ",
                                    shouldDelete: false)
        }
        
        switch state {
        // Space 키 입력한 상태 or 처음 시작 상태
        case .start:
            if keyType == .vowel {
                return sendKeyboardData(state: .vowelOnly,
                                        text: text,
                                        shouldDelete: false)
            } else {
                return sendKeyboardData(state: .firstConsonantOnly,
                                        text: text,
                                        shouldDelete: false)
            }
        // 자음만 있는 상태 ex) ㄱ, ㄲ
        case .firstConsonantOnly:
            if keyType == .vowel {
                let newWord = combinationToComplete(chosung: lastWord,
                                                    jungsung: text,
                                                    jongsung: nil)
                return sendKeyboardData(state: .consonantPlusVowel,
                                        text: newWord,
                                        shouldDelete: true)
            } else {
                // 이중 초성의 경우 ex) ㄲ, ㄸ, ㅃ
                if doubleConsonants.keys.contains(lastWord) && lastWord == text {
                    return sendKeyboardData(state: .firstConsonantOnly,
                                            text: doubleConsonants[text] ?? "",
                                            shouldDelete: true)
                } else {
                    return sendKeyboardData(state: .firstConsonantOnly,
                                            text: text,
                                            shouldDelete: false)
                }
            }
        // 모음만 있는 상태 ex) ㅓ, ㅘ
        case .vowelOnly:
            if keyType == .vowel {
                // 이중 중성의 경우 ex) ㅘ, ㅟ
                if doubleVowels.keys.contains(lastWord) {
                    if let isContain = doubleVowels[lastWord]?.contains(text) {
                        if isContain {
                            if lastWord == "ㅡ" {
                                return sendKeyboardData(state: .vowelOnly,
                                                        text: (doubleVowels[lastWord]?.last)!,
                                                        shouldDelete: true)
                            } else {
                                let index = doubleVowels[lastWord]?.firstIndex(of: text)
                                return sendKeyboardData(state: .vowelOnly,
                                                        text: (doubleVowels[lastWord]?[index! + 3])!,
                                                        shouldDelete: true)
                            }
                        } else {
                            return sendKeyboardData(state: .vowelOnly,
                                                    text: text,
                                                    shouldDelete: false)
                        }
                    } else {
                        print("dictionary error")
                    }
                } else {
                    return sendKeyboardData(state: .vowelOnly,
                                            text: text,
                                            shouldDelete: false)
                }
            } else {
                return sendKeyboardData(state: .firstConsonantOnly,
                                        text: text,
                                        shouldDelete: false)
            }
        // 자음 + 모음 ex) 가, 과
        case .consonantPlusVowel:
            if keyType == .consonant {
                var (choUni, jungUni, jongUni) = completeToCombination(word: lastWord)
                
                for i in 0 ..< finalConsonants.count {
                    if finalConsonants[i] == text { jongUni = i }
                }
                
                if jongUni == 0 {
                    return sendKeyboardData(state: .firstConsonantOnly,
                                            text: text,
                                            shouldDelete: false)
                } else {
                    let newWord = combinationIndexToComplete(chosungIndex: choUni,
                                                             jungsungIndex: jungUni,
                                                             jongsungIndex: jongUni)
                    
                    return sendKeyboardData(state: .finalConsonant,
                                            text: newWord,
                                            shouldDelete: true)
                    
                }
            } else {
                var (choUni, jungUni, _) = completeToCombination(word: lastWord)
                
                var lastVowel = vowels[jungUni]
                if doubleVowels.keys.contains(lastVowel) {
                    if let isContain = doubleVowels[lastVowel]?.contains(text) {
                        if isContain {
                            if lastVowel == "ㅡ" {
                                lastVowel = (doubleVowels[lastVowel]?.last)!
                            } else {
                                let index = doubleVowels[lastVowel]?.firstIndex(of: text)
                                lastVowel = (doubleVowels[lastVowel]?[index! + 3])!
                            }

                            for i in 0 ..< vowels.count {
                                if vowels[i] == lastVowel { jungUni = i }
                            }
                            let newWord = combinationIndexToComplete(chosungIndex: choUni,
                                                                     jungsungIndex: jungUni)
                            return sendKeyboardData(state: .consonantPlusVowel,
                                                    text: newWord,
                                                    shouldDelete: true)
                        } else {
                            return sendKeyboardData(state: .vowelOnly,
                                                    text: text,
                                                    shouldDelete: false)
                        }
                } else {
                    print("dictionary error")
                }
            } else {
                return sendKeyboardData(state: .vowelOnly,
                                        text: text,
                                        shouldDelete: false)
            }
        }
        // 자음 + 모음 + 자음 ex) 강, 갏, 괋
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

                            for i in 0 ..< finalConsonants.count {
                                if finalConsonants[i] == lastFinalConsonant { jongUni = i }
                            }
                            
                            let newWord = combinationIndexToComplete(chosungIndex: choUni,
                                                                     jungsungIndex: jungUni,
                                                                     jongsungIndex: jongUni)
                            
                            return sendKeyboardData(state: .finalConsonant,
                                                    text: newWord,
                                                    shouldDelete: true)
                        } else {
                            return sendKeyboardData(state: .firstConsonantOnly,
                                                    text: text,
                                                    shouldDelete: false)
                        }
                    } else {
                        print("dictionary error")
                    }
                } else {
                    return sendKeyboardData(state: .firstConsonantOnly,
                                            text: text,
                                            shouldDelete: false)
                }
            } else {
                var (choUni, jungUni, jongUni) = completeToCombination(word: lastWord)
                print("lastWord: \(lastWord), jungUni: \(jungUni), jongUni: \(jongUni)")
                let finalConsonant = finalConsonants[jongUni]
                if doubleFinalConsonantReverses.keys.contains(finalConsonant) {
                    let firstFinalConsonant = doubleFinalConsonantReverses[finalConsonant]?.first
                    let lastFinalConsonant = (doubleFinalConsonantReverses[finalConsonant]?.last)!
                    
                    for i in 0 ..< finalConsonants.count {
                        if finalConsonants[i] == firstFinalConsonant { jongUni = i }
                    }
                    
                    let word = combinationIndexToComplete(chosungIndex: choUni,
                                                             jungsungIndex: jungUni,
                                                             jongsungIndex: jongUni)
                    let previousValue = word
                    let newValue = combinationToComplete(chosung: lastFinalConsonant, jungsung: text, jongsung: nil)
                    return sendKeyboardDoubleData(state: .consonantPlusVowel,
                                                  previousText: previousValue,
                                                  newText: newValue)
                    
                } else {
                    let word = combinationIndexToComplete(chosungIndex: choUni,
                                                             jungsungIndex: jungUni)
                    let previousValue = word
                    let newValue = combinationToComplete(chosung: finalConsonant, jungsung: text, jongsung: nil)
                    return sendKeyboardDoubleData(state: .consonantPlusVowel,
                                                  previousText: previousValue,
                                                  newText: newValue)
                }
            }
        }
        return (.start, text, false)
    }
    
    func deleteLogic(state: KeyboardState) -> (KeyboardState, String) {
        
        if latestStatus.isEmpty || totalWords.isEmpty {
            lastWord = ""
            return (.start, "")
        }
        
        let deletedWord = totalWords.removeLast()
        latestStatus.removeLast()
        
        switch state {
        case .start:
            if !latestStatus.isEmpty && deletedWord == " " {
                lastWord = totalWords.last!
                return (latestStatus.last!, "")
            } else {
                lastWord = ""
                return (.start, "")
            }
        case .firstConsonantOnly:
            if doubleConsonantReverses.keys.contains(deletedWord) {
                lastWord = doubleConsonantReverses[deletedWord]!
                totalWords.append(lastWord)
                return (latestStatus.last!, lastWord)
            } else {
                if latestStatus.isEmpty || totalWords.isEmpty {
                    lastWord = ""
                    return (.start, "")
                } else {
                    lastWord = totalWords.last!
                    return (latestStatus.last!, "")
                }
            }
        case .vowelOnly:
            if doubleVowelReverses.keys.contains(deletedWord) {
                lastWord = (doubleVowelReverses[deletedWord]?.first)!
                totalWords.append(lastWord)
                return (latestStatus.last!, lastWord)
            } else {
                if latestStatus.isEmpty || totalWords.isEmpty {
                    lastWord = ""
                    return (.start, "")
                } else {
                    lastWord = totalWords.last!
                    return (latestStatus.last!, "")
                }
            }
        case .consonantPlusVowel:
            var (choUni, jungUni, _) = completeToCombination(word: deletedWord)
            var lastVowel = vowels[jungUni]
            let lastFirstConsonant = firstConsonants[choUni]
            
            if doubleVowelReverses.keys.contains(lastVowel) {
                lastVowel = (doubleVowelReverses[lastVowel]?.first)!
                
                for i in 0 ..< vowels.count {
                    if vowels[i] == lastVowel { jungUni = i }
                }
                
                let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + 0xAC00
                guard let uni = Unicode.Scalar(uniValue) else { return (.start, "") }
                lastWord = String(uni)
                totalWords.append(lastWord)
                return (latestStatus.last!, lastWord)
            } else {
                lastWord = lastFirstConsonant
                totalWords.append(lastFirstConsonant)
                return (latestStatus.last!, lastWord)
            }
        case .finalConsonant:
            var (choUni, jungUni, jongUni) = completeToCombination(word: deletedWord)
            if jungUni < 0 || jongUni < 0 {
                latestStatus.append(.finalConsonant)
                totalWords.append(deletedWord)
                return deleteLogic(state: .firstConsonantOnly)
            }
            var lastFinalConsonant = finalConsonants[jongUni]

            if doubleFinalConsonantReverses.keys.contains(lastFinalConsonant) {
                lastFinalConsonant = (doubleFinalConsonantReverses[lastFinalConsonant]?.first)!
                
                for i in 0 ..< vowels.count {
                    if finalConsonants[i] == lastFinalConsonant { jongUni = i }
                }
                
                let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + jongUni + 0xAC00
                guard let uni = Unicode.Scalar(uniValue) else { return (.start, "") }
                lastWord = String(uni)
                totalWords.append(lastWord)
                return (latestStatus.last!, lastWord)
            } else {
                let uniValue:Int = (choUni * 21 * 28) + (jungUni * 28) + 0xAC00
                guard let uni = Unicode.Scalar(uniValue) else { return (.start, "") }
                lastWord = String(uni)
                totalWords.append(lastWord)
                return (latestStatus.last!, lastWord)
            }
        }        
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
            return String(uni)
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
    
    func combinationIndexToComplete(chosungIndex: Int, jungsungIndex : Int, jongsungIndex: Int = 0) -> String {
        var uniValue:Int = (chosungIndex * 21 * 28) + (jungsungIndex * 28) + (jongsungIndex) + 0xAC00
        if let uni = Unicode.Scalar(uniValue) {
            return String(uni)
        }
        
        return ""
    }
    
    
    
    func sendKeyboardData(state: KeyboardState, text: String, shouldDelete: Bool) -> (KeyboardState, String, Bool) {
        lastWord = text
        if shouldDelete {
            totalWords.removeLast()
        }
        totalWords.append(text)
        latestStatus.append(state)
        return (state, lastWord, shouldDelete)
    }
    
    func sendKeyboardDoubleData(state: KeyboardState, previousText: String, newText: String) -> (KeyboardState, String, Bool) {
        lastWord = newText
        totalWords.removeLast()
        totalWords.append(previousText)
        totalWords.append(newText)
        latestStatus.append(state)
        return (state, previousText + newText, true)
    }
    
}
