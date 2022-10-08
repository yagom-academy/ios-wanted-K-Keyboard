//
//  PreviewsData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct PreviewsData {
    /// 프리뷰 리스트
    let previews: [PreviewData]
    
    init(previews: [PreviewData]) {
        self.previews = previews
    }
}

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

extension PreviewData: Equatable {
    static func == (lhs: PreviewData, rhs: PreviewData) -> Bool {
        return lhs.title == rhs.title
    }
}
