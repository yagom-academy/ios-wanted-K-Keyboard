//
//  MockDataController.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import Foundation

struct MockDataController {
    static func generateItems() -> [Item] {
        let items = [
            Item(itemType: .event, content: """
            밀당해피니스 유튜브 채널을 방문하면 "테마명" 이벤트 테마를 무료로 받을 수 있다구요?
            지금 바로 '참여하기' 버튼을 눌러 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!
            """),
            
            Item(itemType: .tag, keyword: "이벤트"),
            Item(itemType: .tag, keyword: "캐릭터"),
            Item(itemType: .tag, keyword: "새"),
            Item(itemType: .tag, keyword: "동물"),
            Item(itemType: .tag, keyword: "앙증맞은"),
            Item(itemType: .tag, keyword: "동글동글"),
            
            Item(itemType: .reaction, keyword: "신나🥳", imagePath: "excited.png"),
            Item(itemType: .reaction, keyword: "기대💗", imagePath: "expected.png"),
            Item(itemType: .reaction, keyword: "놀이🛝", imagePath: "play.png"),
            Item(itemType: .reaction, keyword: "신나🥳", imagePath: "excited.png"),
            
            Item(itemType: .opinion, keyword: "맘에들어요", emoji: "😊"),
            Item(itemType: .opinion, keyword: "심쿵했어요", emoji: "😍"),
            Item(itemType: .opinion, keyword: "응원해요", emoji: "😉"),
            Item(itemType: .opinion, keyword: "갖고싶어요", emoji: "🤣"),
            
            Item(itemType: .banner, imagePath: "banner.png"),
            
            Item(itemType: .review, content: "구매해주셔서 감사합니다💖", nickName: "크리에이터명", time: Date(), isOwner: true),
            Item(itemType: .review, content: "아 진짜 귀여워요!", nickName: "o달빔o", time: Date()),
            Item(itemType: .review, content: "아 진짜 귀여워요!", nickName: "o달빔o", time: Date()),
            Item(itemType: .review, content: "아 진짜 귀여워요!", nickName: "o달빔o", time: Date()),
            Item(itemType: .review, content: "아 진짜 귀여워요!", nickName: "o달빔o", time: Date()),
            Item(itemType: .review, content: "아 진짜 귀여워요! 야호 야호 야호 야호 야호 야호 야호 야호 야호", nickName: "o달빔o", time: Date())
            
        ]
        return items
    }
}
