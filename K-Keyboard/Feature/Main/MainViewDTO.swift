//
//  MainViewDTO.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct MainViewDTO {
    
    let dataSource: [(section: SectionItem, items: [RowItem])]
    
    enum SectionItem: Equatable {
        case item
        case notice
        case tags
        case previews
        case aboutThemes
        case ads
        case reviews
        
        static func == (lhs: SectionItem, rhs: SectionItem) -> Bool {
            switch (lhs, rhs) {
            case (.item, .item):
                return true
            case (.notice, .notice):
                return true
            case (.tags, .tags):
                return true
            case (.previews, .previews):
                return true
            case (.aboutThemes, aboutThemes):
                return true
            case (.ads, .ads):
                return true
            case (.reviews, .reviews):
                return true
            default:
                return false
            }
        }
    }
    
    enum RowItem: Equatable {
        case item
        case notice
        case tags([TagData])
        case previews([PreviewData])
        case aboutThemes([AboutThemeData])
        case ads
        case reviews([ReviewData])
        
        static func == (lhs: RowItem, rhs: RowItem) -> Bool {
            switch (lhs, rhs) {
            case (.item, .item):
                return true
            case (.notice, .notice):
                return true
            case (.tags(let lhs), .tags(let rhs)):
                return lhs == rhs
            case (.previews(let lhs), .previews(let rhs)):
                return lhs == rhs
            case (.aboutThemes(let lhs), aboutThemes(let rhs)):
                return lhs == rhs
            case (.ads, .ads):
                return true
            case (.reviews(let lhs), .reviews(let rhs)):
                return lhs == rhs
            default:
                return false
            }
        }
    }
}
