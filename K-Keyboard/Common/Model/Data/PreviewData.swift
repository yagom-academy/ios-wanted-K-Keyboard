//
//  PreviewData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct PreviewData {
    /// 프리뷰 이미지
    let image: String
    /// 프리뷰 제목
    let title: String
    
    init(image: String, title: String) {
        self.image = image
        self.title = title
    }
}
