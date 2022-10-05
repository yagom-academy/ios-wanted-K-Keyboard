//
//  Item.swift
//  K-Keyboard
//
//  Created by sole on 2022/10/06.
//

import UIKit

struct Item: Hashable {
    private let identifier = UUID()
    let itemType: Section
    var content: String?
    var keyword: String?
    var imagePath: String?
    var emoji: String?
    var count: Int?
    var nickName: String?
    var time: Date?
    var isOwner: Bool?
    
    func hash(into hasher: inout Hasher) {
                    hasher.combine(identifier)
            }

    static func == (lhs: Item, rhs: Item) -> Bool {
            return lhs.identifier == rhs.identifier
    }
}

struct Owner: Hashable {
    let nickName: String
    var themeName: String
    var themeNickName: String
    var themeImagePath: String
    var numberOfConsumer: Int = 0
}
