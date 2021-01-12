//
//  GroupDetailData.swift
//  meaning
//
//  Created by Seri Park on 2021/01/12.
//

import Foundation

// MARK: - DataClass
struct DataClass: Codable {
    let groupDetail: GroupDetail
}

// MARK: - GroupDetail
struct GroupDetail: Codable {
    let groupID, groupName, introduction: String
    let maximumMemberNumber, countMember: Int

    enum CodingKeys: String, CodingKey {
        case groupID = "groupId"
        case groupName, introduction, maximumMemberNumber, countMember
    }
}
