//
//  TimestampData.swift
//  meaning
//
//  Created by 김민희 on 2021/01/12.
//

import Foundation

struct TimestampData: Codable {
    let timeStampID: Int
    let missionStatusMessage: String
    let postedOnGroup: Bool

    enum CodingKeys: String, CodingKey {
        case timeStampID = "timeStampId"
        case missionStatusMessage, postedOnGroup
    }
}
