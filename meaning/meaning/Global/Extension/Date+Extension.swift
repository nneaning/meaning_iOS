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
    
    func weekDay() -> String {
        // 특정 Date에 대한 요일 구하기
        let weekDay = ["일","월","화","수","목","금","토"]
        let cal = Calendar(identifier: .gregorian)
        let now = self
        let comps = cal.dateComponents([.weekday], from: now)
        if let days = comps.weekday {
            return weekDay[days-1]
        } else {
            return "잘못된 날짜"
        }
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
                    
            if let month = components.month, month >= 1 {
                return "\(month)달 전"
            }
            
            if let week = components.weekOfYear, week >= 1 {
                return "\(week)주 전"
            }
                    
            if let day = components.day, day >= 1 {
                return "\(day)일 전"
            }
            
            if let hour = components.hour, hour >= 1 {
                return "\(hour)시간 전"
            }
            
            if let minute = components.minute, minute >= 1 {
                return "\(minute)분 전"
            }
            
            if let second = components.second, second >= 3 {
                return "\(second)초 전"
            }
            
            return "지금"
        }

}
