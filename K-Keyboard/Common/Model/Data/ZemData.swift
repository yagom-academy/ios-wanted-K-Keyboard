//
//  ZemData.swift
//  K-Keyboard
//
//  Created by 신병기 on 2022/10/01.
//

import Foundation

struct ZemData {
    /// 구매할 젬 수
    let zemAmount: Int
    /// 가격
    let price: String
    
    init(zemAmount: Int, price: String) {
        self.zemAmount = zemAmount
        self.price = price
    }
}
