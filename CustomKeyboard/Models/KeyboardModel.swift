//
//  KeyboardModel.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/03.
//

// TODO: Model에 UIKit이 임포트 되어야 하는 상황 자체는 좋지 않음
//다른 구조, 패턴으로 수정 필요
import Foundation
import UIKit

class KeyboardModel {
    //input
    
    //output
    
    //properties
    var textDocumentProxy: UITextDocumentProxy
    
    init(textDocumentProxy: UITextDocumentProxy) {
        self.textDocumentProxy = textDocumentProxy
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

extension KeyboardModel : KeyboardViewDelegate{
    
    func insertSpace(){
        textDocumentProxy.insertText(" ")
    }
    
    func insertCharacter(_ newCharacter: String) {
        //characterBeforeCursor호출하여 전 글자를 가져온다
        guard let last = characterBeforeCursor(), last != " " else {
            //전 글자가 없다면 그냥 입력
            textDocumentProxy.insertText(newCharacter)
            return
        }
        //전 글자가 있다면 합성할 수 있는지 없는지 검사(같은 프로토콜인지 아닌지 검사)
        let char = Character(newCharacter)
        let (cho,jung,jong) = decompose(char: last)
        //newCharacter가 모음인지 자음인지 검사
        if isVowel(char){ //newCharacter가 모음
            if jong != " "{//1.종성이 있을 때
                
                if isDoubleFinalConsonant(jong){ // 1.1 종성이 겹받침일 때
                    let oldJong = decomposeDoubleFinalConsonant(jong).0
                    let newJong = decomposeDoubleFinalConsonant(jong).1
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText(String(compose(c1: cho, c2: jung, c3: oldJong)))
                    textDocumentProxy.insertText(String(compose(c1: newJong, c2: char, c3: " ")))
                }else{ //1.2 종성이 겹받침이 아닐 때
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText(String(compose(c1: cho, c2: jung, c3: " ")))
                    textDocumentProxy.insertText(String(compose(c1: jong, c2: char, c3: " ")))
                }
            }else if jung != " "{//2.종성은 없고 중성이 있을 때
                if let newJung = exceptionForJungSung(jung: jung, input: char){//2.1 중성이 이중모음되는 것이 가능할 때
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText(String(compose(c1: cho, c2: newJung, c3: " ")))
                }else{//2.2 중성이 이중모음되는 것이 불가능할 때
                    textDocumentProxy.insertText(String(compose(c1: char, c2: " ", c3: " ")))
                }
            }else{//3.초성만 있을 때
                textDocumentProxy.deleteBackward()
                textDocumentProxy.insertText(String(compose(c1: cho, c2: char, c3: " ")))
            }
        }else{ //newCharacter가 자음
            if jong != " "{//1.종성이 있을 때
                if isDoubleFinalConsonant(jong){ // 1.1 종성이 겹받침일 때
                    textDocumentProxy.insertText(String(compose(c1: char, c2: " ", c3: " ")))
                }else{ //1.2 종성이 겹받침이 아닐 때
                    if let doubleConsonant = exceptionForJongSung(jong: jong, input: char){//1.2.1 새로 입력되는 글자가 겹받침이 가능할 때
                        textDocumentProxy.deleteBackward()
                        textDocumentProxy.insertText(String(compose(c1: cho, c2: jung, c3: doubleConsonant)))
                    }else{//1.2.2 새로 입력되는 글자가 겹받침이 불가능할 때
                        textDocumentProxy.insertText(String(compose(c1: char, c2: " ", c3: " ")))
                    }
                }
            }else if jung != " "{//2.종성은 없고 중성이 있을 때
                    textDocumentProxy.deleteBackward()
                    textDocumentProxy.insertText(String(compose(c1: cho, c2: jung, c3: char)))
            }else{//3.초성만 있을 때
                textDocumentProxy.insertText(String(compose(c1: char, c2:" ",c3:" ")))
            }
        }
    }
    
    func deleteCharacterBeforeCursor() {
        //characterBeforeCursor호출하여 지울 글자를 가져온다
        guard let last = characterBeforeCursor(), last != " " else {
            textDocumentProxy.deleteBackward()
            return
        }
        //가져온 글자를 분석한다
        //만약 공백이면 초성,중성,종성 모두 공백으로 반환
        let (cho,jung,jong) = decompose(char: last)
        //1.종성까지 모두 다 있는 상황
        if jong != " "{
            if isDoubleFinalConsonant(jong){//1-1.겹받침
                let newJong = decomposeDoubleFinalConsonant(jong).0
                textDocumentProxy.deleteBackward()
                textDocumentProxy.insertText(String(compose(c1: cho, c2: jung, c3: newJong)))
            }else{//1-2.일반받침
                textDocumentProxy.deleteBackward()
                textDocumentProxy.insertText(String(compose(c1: cho, c2: jung, c3: " ")))
            }
        }else if jung != " "{//2.중성까지 있는 상황
            textDocumentProxy.deleteBackward()
            textDocumentProxy.insertText(String(compose(c1: cho, c2: " ", c3: " ")))
        }else{//3.초성만 있는 상황 && 공백인 상황
            textDocumentProxy.deleteBackward()
        }
    }
    
    func characterBeforeCursor() -> Character? {
        guard let character = textDocumentProxy.documentContextBeforeInput?.last else {
          return nil
        }
        return character
    }
}
