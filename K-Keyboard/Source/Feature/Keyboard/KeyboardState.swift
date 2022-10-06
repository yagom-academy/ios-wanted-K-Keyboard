//
//  KeyboardState.swift
//  K-Keyboard
//
//  Created by 권준상 on 2022/10/02.
//

import Foundation

enum KeyboardState {
    case start              // Space 키 입력한 상태 or 처음 시작 상태
    case firstConsonantOnly // 자음만 있는 상태 ex) ㄱ, ㄲ
    case vowelOnly          // 모음만 있는 상태 ex) ㅓ, ㅘ
    case consonantPlusVowel // 자음 + 모음 ex) 가, 과
    case finalConsonant     // 자음 + 모음 + 자음 ex) 강, 갏, 괋
}
