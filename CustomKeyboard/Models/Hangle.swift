

import UIKit

//enum HangleType{
//    case cho,jung,jong
//}

struct Hangle{
    static let cho  : [Character] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
    static let jung : [Character] = ["ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ", "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"]
    static let jong : [Character] = [" ", "ㄱ", "ㄲ", "ㄳ", "ㄴ", "ㄵ", "ㄶ", "ㄷ", "ㄹ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅁ", "ㅂ", "ㅄ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"]
    
    //글자 합성 함수
    static func compose(c1:Character,c2:Character,c3:Character) -> Character {
        var cho_i = 0
        var jung_i = 0
        var jong_i = 0
        for i in 0 ..< cho.count {
            if cho[i] == c1 { cho_i = i }
        }
        
        guard c2 != " " else { return c1 }
        
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
        return "n"
    }
    
    //글자 검사(분해) 함수
    static func decompose(char : Character) -> (Character,Character,Character) {
        guard let inputUnicodeValue = char.unicodeScalars.first?.value else { return (" "," "," ") }
        if 12593...12622 ~= inputUnicodeValue {
            return (char," "," ")
        }else if 12623...12643 ~= inputUnicodeValue {
            return (" ",char," ")
        }else if inputUnicodeValue < 44032 || inputUnicodeValue > 55202{ //한글의 범위
            return (" "," "," ")
        }
        let choIndex = (inputUnicodeValue - 44032) / 588        //char가 space(" ")일 경우 음수가 되며(inputUnicodeValue = 32)에러 발생. 일단 char에 space가 못들어오게 막아놓은 상태
        let jungIndex = (inputUnicodeValue - 44032) % 588 / 28
        let jongIndex = (inputUnicodeValue - 44032) % 588 % 28
        return (cho[Int(choIndex)], jung[Int(jungIndex)], jong[Int(jongIndex)])
    }
    
    //겹받침 검사 함수
    //종성에 해당되는 case를 찾는다
    //해당되는 케이스에서 input값을 찾아 결합된 값을 반환한다
    static func exceptionForJongSung(jong:Character, input : Character) -> Character?{
        var result : Character?
        switch jong{
        case "ㄱ":
            switch input{
            //case "ㄱ" : result = "ㄲ"
            case "ㅅ" : result = "ㄳ"
            default : result = nil
            }
        case "ㄴ":
            switch input{
            case "ㅈ" : result = "ㄵ"
            case "ㅎ" : result = "ㄶ"
            default : result = nil
            }
        case "ㄹ":
            switch input{
            case "ㄱ" : result = "ㄺ"
            case "ㅁ" : result = "ㄻ"
            case "ㅂ" : result = "ㄼ"
            case "ㅅ" : result = "ㄽ"
            case "ㅌ" : result = "ㄾ"
            case "ㅍ" : result = "ㄿ"
            case "ㅎ" : result = "ㅀ"
            default : result = nil
            }
        case "ㅂ":
            switch input{
            case "ㅅ" : result = "ㅄ"
            default : result = nil
            }
        default : result =  nil
        }
        return result
    }
    
    //이중모음 검사 함수
    //중성에 해당되는 case를 찾는다
    //해당되는 케이스에서 input값을 찾아 결합된 값을 반환한다
    static func exceptionForJungSung(jung:Character, input : Character) -> Character?{
        var result : Character?
        switch jung{
        case "ㅗ":
            switch input{
            case "ㅏ" : result = "ㅘ"
            case "ㅐ" : result = "ㅙ"
            case "ㅣ" : result = "ㅚ"
            default : result = nil
            }
        case "ㅜ":
            switch input{
            case "ㅓ" : result = "ㅝ"
            case "ㅔ" : result = "ㅞ"
            case "ㅣ" : result = "ㅟ"
            default : result = nil
            }
        case "ㅡ":
            switch input{
            case "ㅣ" : result = "ㅢ"
       
            default : result = nil
            }
        default : result =  nil
        }
        return result
    }
    
    static func decomposeDoubleFinalConsonant(_ input:Character) -> (Character,Character) {
        var result : (Character,Character) = (" "," ")
        switch input{
        case "ㄳ":
            result = ("ㄱ","ㅅ")
        case "ㄵ":
            result = ("ㄴ","ㅈ")
        case "ㄶ":
            result = ("ㄴ","ㅎ")
        case "ㄺ":
            result = ("ㄹ","ㄱ")
        case "ㄻ" :
            result = ("ㄹ","ㅁ")
        case "ㄼ" :
            result = ("ㄹ","ㅂ")
        case "ㄽ" :
            result = ("ㄹ","ㅅ")
        case "ㄾ" :
            result = ("ㄹ","ㅌ")
        case "ㄿ" :
            result = ("ㄹ","ㅍ")
        case "ㅀ" :
            result = ("ㄹ","ㅎ")
        case "ㅄ":
            result = ("ㅂ","ㅅ")
        default :
            result = (" "," ")
        }
        return result
    }
    
    static func isVowel(_ input:Character) -> Bool{
        return jung.contains(input)
    }
    
    static func isDoubleFinalConsonant(_ input:Character) -> Bool{
        return [ "ㄳ", "ㄵ", "ㄶ", "ㄺ", "ㄻ", "ㄼ", "ㄽ", "ㄾ", "ㄿ", "ㅀ", "ㅄ"].contains(input)
    }
    
    static func isFinalConsonant(_ input:Character) -> Bool{    //ㅃ,ㅉ,ㄸ 는 받침이 될 수 없다
        return !["ㅃ","ㅉ","ㄸ"].contains(input)
    }

}
