//
//  ReviewsData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct ReviewsData {
    let reviews: [ReviewData]
    
    init(reviews: [ReviewData]) {
        self.reviews = reviews
    }
}

struct ReviewData {
    /// 리뷰 id
    let id: Int
    /// 리뷰어 이미지
    let image: String
    /// 크리에이터 여부
    let isCreator: Bool
    /// 리뷰어 이름
    let name: String
    /// 리뷰 내용
    let review: String
    /// 작성 시간
    let time: Date
    
    init(id: Int, image: String, isCreator: Bool = false, name: String, review: String, time: Date) {
        self.id = id
        self.image = image
        self.isCreator = isCreator
        self.name = name
        self.review = review
        self.time = time
    }
}

extension ReviewData: Equatable {
    static func == (lhs: ReviewData, rhs: ReviewData) -> Bool {
        return lhs.id == rhs.id
    }
}
