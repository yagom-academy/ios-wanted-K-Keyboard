//
//  KeyboardModel.swift
//  CustomKeyboard
//
//  Created by pablo.jee on 2022/10/03.
//

// TODO: Model에 UIKit이 임포트 되어야 하는 상황 자체는 좋지 않음
//다른 구조, 패턴으로 수정 필요
import Foundation

class KeyboardModel {
    //input
    var characterBeforeCursorClosure: () -> (Character?) = { return nil }
    
    //output
    var insertText: (String) -> () = { value in }
    var deleteBackward: () -> () = {  }
    var presentShortCut : () -> () = {  }
    var dismissShortCut : () -> () = {  }
    
    //properties
    init() {

    }
    
    private func decompose(char: Character) -> (Character, Character, Character) {
        return Hangle.decompose(char: char)
    }
    
    private func isVowel(_ input: Character) -> Bool {
        return Hangle.isVowel(input)
    }
    
    private func isDoubleFinalConsonant(_ input: Character) -> Bool {
        return Hangle.isDoubleFinalConsonant(input)
    }
    
    private func decomposeDoubleFinalConsonant(_ input: Character) -> (Character, Character) {
        return Hangle.decomposeDoubleFinalConsonant(input)
    }
    
    private func compose(c1: Character, c2: Character, c3: Character) -> Character {
        return Hangle.compose(c1: c1, c2: c2, c3: c3)
    }
    
    private func exceptionForJungSung(jung: Character, input: Character) -> Character? {
        return Hangle.exceptionForJungSung(jung: jung, input: input)
    }
    
    private func exceptionForJongSung(jong: Character, input: Character) -> Character? {
        return Hangle.exceptionForJongSung(jong: jong, input: input)
    }
    
    private func isFinalConsonant(input: Character) -> Bool {
        return Hangle.isFinalConsonant(input)
    }
    
}

extension KeyboardModel : KeyboardViewDelegate{
    
    
    func insertNextLine() {
        insertText("\n")
    }
    
    func dismissShortCutView(){
        dismissShortCut()
    }
    
    func presentShortCutView() {
        presentShortCut()
    }
        
    func insertSpace(){
        insertText(" ")
    }
    
    func insertCharacter(_ newCharacter: String) {
        //characterBeforeCursor호출하여 전 글자를 가져온다
        guard let last = characterBeforeCursor(), last != " " && newCharacter.count <= 1 && decompose(char: Character(newCharacter)) != (" "," "," ") else {
            //전 글자가 없다면 그냥 입력
            insertText(newCharacter)
            return
        }
              
        let char = Character(newCharacter)
        
        let (cho,jung,jong) = decompose(char: last)
        
        print(cho,jung,jong)
        
        if (cho,jung,jong) == (" "," "," "){
            insertText(newCharacter)
            return
        }
                
        //newCharacter가 모음인지 자음인지 검사
        if isVowel(char){ //newCharacter가 모음
            if jong != " "{//1.종성이 있을 때
                if isDoubleFinalConsonant(jong){ // 1.1 종성이 겹받침일 때
                    let oldJong = decomposeDoubleFinalConsonant(jong).0
                    let newJong = decomposeDoubleFinalConsonant(jong).1
                    deleteBackward()
                    insertText(String(compose(c1: cho, c2: jung, c3: oldJong)))
                    insertText(String(compose(c1: newJong, c2: char, c3: " ")))
                }else{ //1.2 종성이 겹받침이 아닐 때
                    deleteBackward()
                    insertText(String(compose(c1: cho, c2: jung, c3: " ")))
                    insertText(String(compose(c1: jong, c2: char, c3: " ")))
                }
            }else if jung != " "{//2.종성은 없고 중성이 있을 때
                if let newJung = exceptionForJungSung(jung: jung, input: char){//2.1 중성이 이중모음되는 것이 가능할 때
                    deleteBackward()
                    insertText(String(compose(c1: cho, c2: newJung, c3: " ")))
                }else{//2.2 중성이 이중모음되는 것이 불가능할 때
                    insertText(String(compose(c1: char, c2: " ", c3: " ")))
                }
            }else{//3.초성만 있을 때
                deleteBackward()
                insertText(String(compose(c1: cho, c2: char, c3: " ")))
            }
        }else{ //newCharacter가 자음
            if jong != " "{//1.종성이 있을 때
                if isDoubleFinalConsonant(jong){ // 1.1 종성이 겹받침일 때
                    insertText(String(compose(c1: char, c2: " ", c3: " ")))
                }else{ //1.2 종성이 겹받침이 아닐 때
                    if let doubleConsonant = exceptionForJongSung(jong: jong, input: char){//1.2.1 새로 입력되는 글자가 겹받침이 가능할 때
                        deleteBackward()
                        insertText(String(compose(c1: cho, c2: jung, c3: doubleConsonant)))
                    }else{//1.2.2 새로 입력되는 글자가 겹받침이 불가능할 때
                        insertText(String(compose(c1: char, c2: " ", c3: " ")))
                    }
                }
            }else if jung != " "{//2.종성은 없고 중성이 있을 때
                    deleteBackward()
                    insertText(String(compose(c1: cho, c2: jung, c3: char)))
                if isFinalConsonant(input: char){//2.1 입력하려는 글자가 ㅃ,ㅉ,ㄸ가 아니라면 받침이 될 수 있다
                    deleteBackward()
                    insertText(String(compose(c1: cho, c2: jung, c3: char)))
                }else{//2.1 입력하려는 글자가 ㅃ,ㅉ,ㄸ 라면 받침이 될 수 없다
                    insertText(String(compose(c1:char , c2:" " , c3: " ")))
                }
            }else{//3.초성만 있을 때
                insertText(String(compose(c1: char, c2:" ",c3:" ")))
            }
        }
    }
    
    func deleteCharacterBeforeCursor() {
        //characterBeforeCursor호출하여 지울 글자를 가져온다
        guard let last = characterBeforeCursor(), last != " " else {
            deleteBackward()
            return
        }
        //가져온 글자를 분석한다
        //만약 공백이면 초성,중성,종성 모두 공백으로 반환
        let (cho,jung,jong) = decompose(char: last)
        //1.종성까지 모두 다 있는 상황
        if jong != " "{
            if isDoubleFinalConsonant(jong){//1-1.겹받침
                let newJong = decomposeDoubleFinalConsonant(jong).0
                deleteBackward()
                insertText(String(compose(c1: cho, c2: jung, c3: newJong)))
            }else{//1-2.일반받침
                deleteBackward()
                insertText(String(compose(c1: cho, c2: jung, c3: " ")))
            }
        }else if jung != " "{//2.중성까지 있는 상황
            if cho != " "{//2-1 초성이 있을 때
                deleteBackward()
                insertText(String(compose(c1: cho, c2: " ", c3: " ")))
            }else{//2-2 중성만 있을 때
                deleteBackward()
            }
        }else{//3.초성만 있는 상황 && 공백인 상황
            deleteBackward()
        }
    }
    
    func characterBeforeCursor() -> Character? {
        let value = characterBeforeCursorClosure()
        return value
    }
}
