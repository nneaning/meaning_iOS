//
//  GroupFeedData.swift
//  meaning
//
//  Created by 김민희 on 2021/01/12.
//

import Foundation

struct GroupFeedData: Codable {
    let myGroup: GroupListDetail?
    let hasImageGroupList, noImageGroupList: [GroupListDetail]
}

struct GroupListDetail: Codable {
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
