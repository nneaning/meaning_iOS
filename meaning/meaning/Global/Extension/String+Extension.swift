//
//  String+Extension.swift
//  meaning
//
//  Created by 김민희 on 2021/01/01.
//

import Foundation

extension String {
    func recordDate() -> String {
        // "yyyy-MM-dd HH:mm:ss"형식의 string 시간을 "yyyy년 MM월 dd일" 형식의 string time으로 바꾸기
        var format = "yyyy-MM-dd HH:mm:ss"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        guard let tempDate = formatter.date(from: self) else {
            return ""
        }
        
        format = "yyyy년 MM월 dd일"
        formatter.dateFormat = format
        
        return formatter.string(from: tempDate)
    }
    func recordTime() -> String {
        // "yyyy-MM-dd HH:mm:ss"형식의 string 시간을 "yyyy년 MM월 dd일" 형식의 string time으로 바꾸기
        var format = "yyyy-MM-dd HH:mm:ss"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        guard let tempDate = formatter.date(from: self) else {
            return ""
        }
        
        format = "HH:mm"
        formatter.dateFormat = format
        
        return formatter.string(from: tempDate)
    }
    
    func stringToDate() -> Date {
        // string타입을 date타입으로 바꾸기
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let date: Date = dateFormatter.date(from: self)!
        
        return date
    }
    
}
