//
//  ReviewData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct ReviewData {
    /// 리뷰어 이미지
    let Image: String
    /// 크리에이터 여부
    let isCreator: Bool?
    /// 리뷰어 이름
    let name: String
    /// 리뷰 내용
    let review: String
    /// 작성 시간
    let time: Date
    
    init(Image: String, isCreator: Bool? = false, name: String, review: String, time: Date) {
        self.Image = Image
        self.isCreator = isCreator
        self.name = name
        self.review = review
        self.time = time
    }
}
