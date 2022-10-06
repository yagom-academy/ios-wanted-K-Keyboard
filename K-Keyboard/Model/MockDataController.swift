//
//  MockDataController.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import Foundation

class MockDataController {
    static let shared = MockDataController()

    private init() { }

    private var items: [Item] = [
        // event
        .event(.init(content: """
            밀당해피니스 유튜브 채널을 방문하면 "테마명" 이벤트 테마를 무료로 받을 수 있다구요?
            지금 바로 '참여하기' 버튼을 눌러 새로워진 밀당해피니스 유튜브 채널을 확인해보세요!
            """)),
        // tag
        .tag(.init(keyword: "이벤트")),
        .tag(.init(keyword: "캐릭터")),
        .tag(.init(keyword: "새")),
        .tag(.init(keyword: "동물")),
        .tag(.init(keyword: "앙증맞은")),
        .tag(.init(keyword: "동글동글")),
        // reaction
        .reaction(.init(keyword: "신나🥳", imagePath: "excited.png")),
        .reaction(.init(keyword: "기대💗", imagePath: "expected.png")),
        .reaction(.init(keyword: "놀이🛝", imagePath: "play.png")),
        // opinion
        .opinion(.init(keyword: "맘에들어요", emoji: "😊")),
        .opinion(.init(keyword: "심쿵했어요", emoji: "😍")),
        .opinion(.init(keyword: "응원해요", emoji: "😉")),
        .opinion(.init(keyword: "갖고싶어요", emoji: "🤣")),
        // banner
        .banner(.init(imagePath: "banner.png")),
        // review
        .review(.init(content: "구매해주셔서 감사합니다💖", nickName: "크리에이터명", time: Date(), isOwner: true)),
        .review(.init(content: "아 진짜 귀여워요!", nickName: "o달빔o", time: Date(), isOwner: false)),
        .review(.init(content: "아 진짜 귀여워요! 야호 야호 야호 야호 야호 야호 야호 야호 야호", nickName: "o달빔o", time: Date(), isOwner: false))
    ]

    func items(for section: Section) -> [Item] {
        switch section {
        case .event:
            return items.filter {
                if case .event = $0 {
                    return true
                }
                return false
            }
        case .tag:
            return items.filter {
                if case .tag = $0 {
                    return true
                }
                return false
            }
        case .reaction:
            return items.filter {
                if case .reaction = $0 {
                    return true
                }
                return false
            }
        case .opinion:
            return items.filter {
                if case .opinion = $0 {
                    return true
                }
                return false
            }
        case .banner:
            return items.filter {
                if case .banner = $0 {
                    return true
                }
                return false
            }
        case .review:
            return items.filter {
                if case .review = $0 {
                    return true
                }
                return false
            }
        }
    }
}
