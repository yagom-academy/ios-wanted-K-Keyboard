//
//  KeyboardModel.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/03.
//

import Foundation

class KeyboardModel {
    //input
    
    //output
    
    //properties
    
    
    init() {
        
    }
    
    func decompose(char: Character) -> (Character, Character, Character) {
        return Hangle.decompose(char: char)
    }
    
    func isVowel(_ input: Character) -> Bool {
        return Hangle.isVowel(input)
    }
    
    func isDoubleFinalConsonant(_ input: Character) -> Bool {
        return Hangle.isDoubleFinalConsonant(input)
    }
    
    func decomposeDoubleFinalConsonant(_ input: Character) -> (Character, Character) {
        return Hangle.decomposeDoubleFinalConsonant(input)
    }
    
    func compose(c1: Character, c2: Character, c3: Character) -> Character {
        return Hangle.compose(c1: c1, c2: c2, c3: c3)
    }
    
    func exceptionForJungSung(jung: Character, input: Character) -> Character? {
        return Hangle.exceptionForJungSung(jung: jung, input: input)
    }
    
    func exceptionForJongSung(jong: Character, input: Character) -> Character? {
        return Hangle.exceptionForJongSung(jong: jong, input: input)
    }
    
}
