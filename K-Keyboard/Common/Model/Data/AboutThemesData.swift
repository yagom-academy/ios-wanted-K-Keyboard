//
//  AboutThemesData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct AboutThemesData {
    /// 테마 평가 리스트
    let aboutThemes: [AboutThemeData]
    
    init(aboutThemes: [AboutThemeData]) {
        self.aboutThemes = aboutThemes
    }
}

struct AboutThemeData {
    /// 테마 평가 이미지
    let image: String
    /// 테마 평가 제목
    let title: String
    /// 선택된 수
    let numberOfSelect: Int?
    /// 선택 여부
    let isSelected: Bool?
    
    init(image: String, title: String, numberOfSelect: Int? = .zero, isSelected: Bool? = false) {
        self.image = image
        self.title = title
        self.numberOfSelect = numberOfSelect
        self.isSelected = isSelected
    }
}

extension AboutThemeData: Equatable {
    static func == (lhs: AboutThemeData, rhs: AboutThemeData) -> Bool {
        return lhs.title == rhs.title
    }
}
