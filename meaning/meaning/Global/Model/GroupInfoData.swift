//
//  GroupInfoData.swift
//  meaning
//
//  Created by Seri Park on 2021/01/13.
//

import Foundation

// MARK: - DataClass
struct GroupInfoData: Codable {
    let group: Group
    let users: [Users]
}

// MARK: - Group
struct Group: Codable {
    let groupID, groupName, introduction: String
    let maximumMemberNumber: Int
    let createdAt: String
    let currentMemberNumber: Int

    enum CodingKeys: String, CodingKey {
        case groupID = "groupId"
        case groupName, introduction, maximumMemberNumber, createdAt, currentMemberNumber
    }
}

// MARK: - User
struct Users: Codable {
    let id: Int
    let userName: String
    let nickName, wakeUpTime: String?
    let dayPassed: Int
}
