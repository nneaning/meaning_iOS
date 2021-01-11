//
//  SimpleData.swift
//  meaning
//
//  Created by 김민희 on 2021/01/12.
//

import Foundation

struct SimpleData: Codable {
    var status: Int
    var success: Bool
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
    }
}
