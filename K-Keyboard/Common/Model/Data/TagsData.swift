//
//  TagsData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct TagsData {
    /// 테그 리스트
    let tags: [TagData]
    
    init(tags: [TagData]) {
        self.tags = tags
    }
}

struct TagData {
    /// 테그명
    let tag: String
    
    init(tag: String) {
        self.tag = tag
    }
}

extension TagData: Equatable {
    static func == (lhs: TagData, rhs: TagData) -> Bool {
        return lhs.tag == rhs.tag
    }
}
