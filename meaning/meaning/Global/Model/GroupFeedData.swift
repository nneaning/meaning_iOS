//
//  GroupFeedData.swift
//  meaning
//
//  Created by 김민희 on 2021/01/12.
//

import Foundation

struct GroupFeedData: Codable {
    let id: Int
    let timeStampImageURL: String
    let status: Int
    let timeStampContents, createdAt: String
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case timeStampImageURL = "timeStampImageUrl"
        case status, timeStampContents, createdAt
        case user = "User"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let userName, nickName, wakeUpTime: String
}
