//
//  Date+Extension.swift
//  meaning
//
//  Created by 김민희 on 2021/01/01.
//

import Foundation

extension Date {
    func datePickerToString() -> String {
        // date 타입을 string으로 바꾸기
        let formatter = DateFormatter()
        let format = "yyyy-MM-dd HH:mm:ss"
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = format
        let dateString = formatter.string(from: self)
        
        return dateString
    }
    
    func timeAgoSince() -> String {
        // 특정 date가 현재로부터 얼마나 지났는지 구하기
            let calendar = Calendar.current
            let now = Date().datePickerToString().stringToDate()
            let unitFlags: NSCalendar.Unit = [.second, .minute, .hour, .day, .weekOfYear, .month, .year]
            let components = (calendar as NSCalendar).components(unitFlags, from: self, to: now, options: [])

            if let year = components.year, year >= 1 {
                return "\(year)년 전"
            }
                    
            if let month = components.month, month >= 2 {
                return "\(month)달 전"
            }
            
            if let week = components.weekOfYear, week >= 2 {
                return "\(week)주 전"
            }
                    
            if let day = components.day, day >= 2 {
                return "\(day)일 전"
            }
            
            if let day = components.day, day >= 1 {
                return "1일 전"
            }
            
            if let hour = components.hour, hour >= 2 {
                return "\(hour)시간 전"
            }
            
            if let hour = components.hour, hour >= 1 {
                return "1시간 전"
            }
            
            if let minute = components.minute, minute >= 2 {
                return "\(minute)분 전"
            }
            
            if let minute = components.minute, minute >= 1 {
                return "1분 전"
            }
            
            if let second = components.second, second >= 3 {
                return "\(second)초 전"
            }
            
            return "지금"
        }

}
