//
//  APITarget.swift
//  meaning
//
//  Created by 김민희 on 2021/01/10.
//

import Foundation
import Moya

enum APITarget {
    // case 별로 api 나누기
}

// MARK: TargetType Protocol 구현
extension APITarget: TargetType {
    var baseURL: URL {
    // baseURL - 서버의 도메인
        return URL(string: "http://13.124.61.0:3000")!
    }
    
    var path: String {
    // path - 서버의 도메인 뒤에 추가 될 경로
        return ""
    }
    
    var method: Moya.Method {
    // method - 통신 method (get, post, put, delete ...)
        return .get
    }
    
    var sampleData: Data {
    // sampleDAta - 테스트용 Mock Data
        return Data()
    }
    
    var task: Task {
    // task - 리퀘스트에 사용되는 파라미터 설정
    // 파라미터가 없을 때는 - .requestPlain
    // 파라미터 존재시에는 - .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
                
        return .requestPlain
    }
    
    var validationType: Moya.ValidationType {
    // validationType - 허용할 response의 타입
        return .successAndRedirectCodes
    }
    
    var headers: [String : String]? {
    // headers - HTTP header
    // ex. ["Content-Type" : "application/json"]
    // ex. ["Content-Type" : "multipart/form-data"]
    // ex. ["jwt" : "token"]
        return ["Content-Type" : "application/json"]
    }
    
    
    
    
}
