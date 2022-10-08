//
//  MainViewRepository.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

class MainViewRepository {
    
    func fetchMainView(completion: ((MainViewDTO) -> Void)?) {
        let sampleMainData = SampleMainData()
        
        let itemData = sampleMainData.itemData
        var dto = MainViewDTO(dataSource: [(section: .item, items: [.item(itemData)])])
        
        if let noticeData = sampleMainData.itemData.notice {
            dto.dataSource.append((section: .notice, items: [.notice(noticeData)]))
        }
        
        if let tagsData = sampleMainData.itemData.tags {
            dto.dataSource.append((section: .tags, items: [.tags(tagsData.tags)]))
        }
        
        if let previewsData = sampleMainData.itemData.previews {
            dto.dataSource.append((section: .previews, items: [.previews(previewsData.previews)]))
        }
        
        let aboutThemesData = sampleMainData.itemData.aboutThemes
        dto.dataSource.append((section: .aboutThemes, items: [.aboutThemes(aboutThemesData.aboutThemes)]))
        
        if let adsData = sampleMainData.itemData.ads {
            dto.dataSource.append((section: .ads, items: [.ads(adsData)]))
        }
        
        if let reviewData = sampleMainData.itemData.reviews {
            dto.dataSource.append((section: .reviews, items: [.reviews(reviewData.reviews)]))
        }
        
        completion?(dto)
    }
}
