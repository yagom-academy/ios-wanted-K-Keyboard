//
//  CellModel.swift
//  K-Keyboard
//
//  Created by 엄철찬 on 2022/10/07.
//

import Foundation

struct CellModel{
    var id : String
    var comment : String
    var isCreator: Bool
    var timeString: String
    
    init() {
        self.id = ""
        self.comment = ""
        self.isCreator = true
        self.timeString = ""
    }
}
