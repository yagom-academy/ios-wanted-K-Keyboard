//
//  NoticeData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct NoticeData {
    /// 공지 제목
    let title: String
    /// 공지 내용
    let text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
}
