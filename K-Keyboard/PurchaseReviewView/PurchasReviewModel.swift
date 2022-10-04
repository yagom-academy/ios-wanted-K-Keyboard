//
//  PurchasReviewModel.swift
//  K-Keyboard
//
//  Created by so on 2022/10/03.
//

import Foundation
import UIKit

struct PurchasReviewModel {
    
    let uesrImage: UIImage?
    let idLabel: String
    let infoLabel: String
    let timeLabel: String
    let declaration : String
    
    init(uesrImage: UIImage?, idLabel: String, infoLabel: String, timeLabel: String, declaration: String) {
        self.uesrImage = uesrImage
        self.idLabel = idLabel
        self.infoLabel = infoLabel
        self.timeLabel = timeLabel
        self.declaration = declaration
    }
}

