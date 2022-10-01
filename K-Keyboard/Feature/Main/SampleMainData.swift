//
//  SampleMainData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct SampleMainData {
    let itemData: ItemData
    
    init() {
        let noticeData = NoticeData(
            title: "🎉플레이키보드 첫 이벤트 테마를 공개합니다.🎉",
            text: "밀당해피니스 유튜브 채널을 방문하면 “테마명” 이벤트 테마를 무료로 받을 수 있다구요?\n지금 바로 ‘참여하기' 버튼을 눌러 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!"
        )
        
        let tagsData = TagsData(
            tags: [
                TagData(tag: "이벤트"),
                TagData(tag: "캐릭터"),
                TagData(tag: "새"),
                TagData(tag: "동물"),
                TagData(tag: "앙증맞은"),
                TagData(tag: "동글동글")
            ]
        )
        
        let previewsData = PreviewsData(
            previews: [
                PreviewData(image: "img_preview1", title: "신나💃"),
                PreviewData(image: "img_preview2", title: "기대💗"),
                PreviewData(image: "img_preview3", title: "놀아💃")
            ]
        )
        
        let aboutThemesData = AboutThemesData(
            aboutThemes: [
                AboutThemeData(image: "😊", title: "맘에들어요"),
                AboutThemeData(image: "😍", title: "심쿵했어요", numberOfSelect: 1, isSelected: true),
                AboutThemeData(image: "😉", title: "응원해요"),
                AboutThemeData(image: "🤣", title: "갖고싶어요")
            ]
        )
        
        let adsData = AdsData(image: "img_ads")
        
        let reviewsData = ReviewsData(
            reviews: [
                ReviewData(id: 0, Image: "img_profile", isCreator: true, name: "코핀", review: "구매해주셔서 감사합니다💖", time: Date()),
                ReviewData(id: 1, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date()),
                ReviewData(id: 2, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date()),
                ReviewData(id: 3, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date()),
                ReviewData(id: 4, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date()),
                ReviewData(id: 5, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date()),
                ReviewData(id: 6, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date()),
                ReviewData(id: 7, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date()),
                ReviewData(id: 8, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date()),
                ReviewData(id: 9, Image: "img_profile", name: "o달빔o", review: "아진짜 귀여워요 !!!!", time: Date())
            ]
        )
        
        let itemData = ItemData(title: "앙무", creator: "코핀", cost: 78, notice: noticeData, tags: tagsData, previews: previewsData, aboutThemes: aboutThemesData, ads: adsData, reviews: reviewsData)
        
        self.itemData = itemData
    }
}
