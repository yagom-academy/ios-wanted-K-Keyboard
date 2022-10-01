//
//  ItemData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct ItemData {
    /// 아이템 이름
    let title: String
    /// 크리에이터 이름
    let creator: String
    /// 구매자 수
    let numberOfBuyer: Int?
    /// 아이템 가격
    let cost: Int
    
    /// 구매 여부
    let isPurchased: Bool?
    
    /// 공지
    let notice: NoticeData?
    /// 태그
    let tags: [TagData]?
    /// 이런 키워드에 반응해요
    let previews: [PreviewData]?
    /// 이 테마를 어떻게 생각하나요?
    let aboutThemes: [AboutThemeData]
    /// 광고
    let ads: [AdsData]?
    /// 구매 리뷰
    let reviews: [ReviewData]?
    
    init(title: String, creator: String, numberOfBuyer: Int? = .zero, cost: Int, isPurchased: Bool = false, notice: NoticeData?, tags: [TagData]?, previews: [PreviewData]?, aboutThemes: [AboutThemeData], ads: [AdsData]?, reviews: [ReviewData]?) {
        self.title = title
        self.creator = creator
        self.numberOfBuyer = numberOfBuyer
        self.cost = cost
        self.isPurchased = isPurchased
        self.notice = notice
        self.tags = tags
        self.previews = previews
        self.aboutThemes = aboutThemes
        self.ads = ads
        self.reviews = reviews
    }
}
