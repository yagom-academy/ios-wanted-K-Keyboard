//
//  ShortcutData.swift
//  K-Keyboard
//
//  Created by Subin Kim on 2022/10/07.
//

import Foundation

struct ShortcutData {
    static var shortcutList = ["😀", "ㅋㅋㅋㅋㅋㅋ", "❤️", "넵넵!!", "안녕하세요!", "ㅠㅠㅠㅠ"]
    static var now = shortcutList[0]

    static func change(_ text: String) {
        now = text
    }
}
