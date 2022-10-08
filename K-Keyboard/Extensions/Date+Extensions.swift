//
//  Date+Extensions.swift
//  K-Keyboard
//
//  Created by sokol on 2022/10/01.
//

import Foundation

extension Date {
    enum DateFormat: String {
        case fileName = "yyyy-MM-dd-hh-mm-ss"
        case forDisplay = "yyyy/MM/dd HH:mm:ss"
    }
    func asString(_ format: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.dateFormat = format.rawValue
        return formatter.string(from: self)
    }
}
