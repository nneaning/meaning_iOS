//
//  LoginData.swift
//  meaning
//
//  Created by 선민승 on 2021/01/12.
//

import Foundation

// MARK: - DataClass

struct LoginData: Codable {
    let accessToken, refreshToken: String
    let userNick, wakeUpTime: String?
}
