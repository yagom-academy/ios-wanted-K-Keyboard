//
//  MockDataController.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import UIKit

enum Section: Int, CaseIterable {
    case event
    case tag
    case reaction
    case opinion
    case banner
    case review
    
    var title: String {
        switch self {
        case .event:
            return "플레이키보드 첫 이벤트 테마를 공개합니다"
        case .tag:
            return "태그"
        case .reaction:
            return "이런 캐워드에 반응해요"
        case .opinion:
            return "이 테마를 어떻게 생각하나요?"
        case .banner:
            return ""
        case .review:
            return "구매리뷰"
        }
    }
}
