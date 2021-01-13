//
//  dailydiaryData.swift
//  meaning
//
//  Created by 선민승 on 2021/01/14.
//

import Foundation

struct DailydiaryData: Codable {
    let dailyDiaryID: Int

    enum CodingKeys: String, CodingKey {
        case dailyDiaryID = "dailyDiaryId"
    }
}
