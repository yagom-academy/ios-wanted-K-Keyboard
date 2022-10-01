//
//  UserData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct UserData {
    /// 유저이름
    let name: String
    /// 보유 젬 수
    let zem: Int
    
    init(name: String, zem: Int) {
        self.name = name
        self.zem = zem
    }
}
