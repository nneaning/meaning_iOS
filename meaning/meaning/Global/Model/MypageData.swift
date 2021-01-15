//
//  MypageData.swift
//  meaning
//
//  Created by 김민희 on 2021/01/12.
//

import Foundation

struct MypageData: Codable {
    let successDays: Int
    let getMyPage: [GetMyPage]?
}

// MARK: - GetMyPage
struct GetMyPage: Codable {
    let id: Int
    let timeStampImageURL: String
    let timeStampContents, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case timeStampImageURL = "timeStampImageUrl"
        case timeStampContents, createdAt
    }
}
