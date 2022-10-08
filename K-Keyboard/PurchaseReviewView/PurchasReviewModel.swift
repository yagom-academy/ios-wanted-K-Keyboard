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
    let isCreater : Bool
    let idLabel: String
    let infoLabel: String
    let timeLabel: String
    let declaration : String
    
    init(uesrImage: UIImage?,isCreater : Bool, idLabel: String, infoLabel: String, timeLabel: String, declaration: String) {
        self.uesrImage = uesrImage
        self.isCreater = isCreater
        self.idLabel = idLabel
        self.infoLabel = infoLabel
        self.timeLabel = timeLabel
        self.declaration = declaration
    }
}

