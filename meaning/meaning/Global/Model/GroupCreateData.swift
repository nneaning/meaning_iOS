//
//  GroupCreateData.swift
//  meaning
//
//  Created by Seri Park on 2021/01/13.
//

import Foundation

// MARK: - DataClass
struct GroupCreateData: Codable {
    let groupID: Int

    enum CodingKeys: String, CodingKey {
        case groupID = "groupId"
    }
}
