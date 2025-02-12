//
//  GroupListData.swift
//  meaning
//
//  Created by Seri Park on 2021/01/12.
//

import Foundation

// MARK: - DataClass
struct GroupListData: Codable {
    let hasImageGroupList, noImageGroupList: [GroupReportData]
}

// MARK: - MyGroup
struct GroupReportData: Codable {
    let groupID: Int
    let groupName: String
    let imageURL: String?
    let countMember: Int
    let maximumMemberNumber: Int?

    enum CodingKeys: String, CodingKey {
        case groupID = "groupId"
        case groupName
        case imageURL = "imageUrl"
        case countMember, maximumMemberNumber
    }
}
