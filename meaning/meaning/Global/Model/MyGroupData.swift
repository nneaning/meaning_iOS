//
//  MyGroupData.swift
//  meaning
//
//  Created by 김민희 on 2021/01/13.
//

import Foundation

struct MyGroupData: Codable {
    let groupID: Int
    let groupName, introduction: String
    let countMember, maximumMemberNumber: Int

    enum CodingKeys: String, CodingKey {
        case groupID = "groupId"
        case groupName, introduction, countMember, maximumMemberNumber
    }
}
