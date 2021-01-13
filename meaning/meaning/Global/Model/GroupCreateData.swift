//
//  GroupCreateData.swift
//  meaning
//
//  Created by Seri Park on 2021/01/13.
//

import Foundation

// MARK: - GroupCreateData
struct GroupCreateData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let groupID: Int

    enum CodingKeys: String, CodingKey {
        case groupID = "groupId"
    }
}
