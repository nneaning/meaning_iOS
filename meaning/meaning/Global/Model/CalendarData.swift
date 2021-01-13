//
//  CalendarData.swift
//  meaning
//
//  Created by 김민희 on 2021/01/13.
//

import Foundation

struct CalendarData: Codable {
    let successDays: Int
    let calendar: [CalendarDay]
}

// MARK: - CalendarDay
struct CalendarDAy: Codable {
    let dateTime: String
    let status: Int
}
