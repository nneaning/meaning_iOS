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
    case login(email: String, password: String) // 로그인
    case refreshtoken(refreshtoken: String) // 토큰 재발급
    case onboard(token: String, nickName: String, wakeUpTime: String) // 온보드
    case timestamp(token: String, dateTime: String, timeStampContents: String, image: UIImage) // 타임스탬프 작성
    case groupList(token: String) // 그룹 리스트
    case groupJoin(token: String, groupId: Int) // 그룹 참가 신청
    case groupFeed(token: String, groupid: Int) // 그룹 내부 피드
    case groupEdit(token: String, groupid: Int) // 그룹 설정
    case groupDetail(token : String, groupid: Int) // 그룹 상세보기
    case groupMake(token: String, groupName: String, maximumMemberNumber: Int, introduction: String) // 그룹 생성
    case mypage(token: String) // 마이페이지
    case daypromise(token: String) // 오늘 하루 다짐
    case dailydiary(token: String, diaryContents: String) // 자기 회고 작성
    // 짧은 독서 작성
}

// MARK: TargetType Protocol 구현

extension APITarget: TargetType {
    var baseURL: URL {
        // baseURL - 서버의 도메인
        return URL(string: "http://13.124.61.0:3000")!
    }
    
    var path: String {
        // path - 서버의 도메인 뒤에 추가 될 경로
        switch self {
        case .login:
            return "/user/signin"
        case .refreshtoken:
            return "/user/refreshtoken"
        case .onboard:
            return "/user/onboard"
        case .timestamp:
            return "/timestamp"
        case .groupList:
            return "/group?offset=0"
        case .groupJoin:
            return "/group/join"
        case .groupFeed(_, let groupid):
            return "/group/\(groupid))/feed?offset=0"
        case .groupEdit(_, let groupid):
            return "/group/\(groupid))/edit"
        case .groupDetail(_, let groupid):
            return "/group/\(groupid)"
        case .groupMake:
            return "/group"
        case .mypage:
            return "/user/mypage?offset=0"
        case .daypromise:
            return "/user/daypromise"
        case .dailydiary:
            return "/user/dailydiary"
        }
    }
    
    var method: Moya.Method {
        // method - 통신 method (get, post, put, delete ...)
        switch self {
        case .login, .timestamp, .groupJoin, .groupMake, .dailydiary:
            return .post
        case .onboard, .refreshtoken:
            return .put
        case .groupFeed, .groupEdit, .mypage, .groupDetail, .daypromise, .groupList:
            return .get
        }
    }
    
    var sampleData: Data {
        // sampleDAta - 테스트용 Mock Data
        return Data()
    }
    
    var task: Task {
        // task - 리퀘스트에 사용되는 파라미터 설정
        // 파라미터가 없을 때는 - .requestPlain
        // 파라미터 존재시에는 - .requestParameters(parameters: ["first_name": firstName, "last_name": lastName], encoding: JSONEncoding.default)
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email" : email, "password": password], encoding: JSONEncoding.default)
            
        case .onboard( _, let nickName, let wakeUpTime):
            return .requestParameters(parameters: ["nickName" : nickName, "wakeUpTime": wakeUpTime], encoding: JSONEncoding.default)
            
        case .timestamp(_, let dateTime, let timeStampContents, let image):
            let dateTimeData = MultipartFormData(provider: .data(dateTime.data(using: .utf8)!), name: "dateTime")
            let timeStampContentsData = MultipartFormData(provider: .data(timeStampContents.data(using: .utf8)!), name: "timeStampContents")
            let imageData = MultipartFormData(provider: .data(image.jpegData(compressionQuality: 1.0)!), name: "image", fileName: "timestamp", mimeType: "image/jpeg")
            let multipartData = [dateTimeData, timeStampContentsData, imageData]
            return .uploadMultipart(multipartData)
            
        case .groupJoin(_, let groupId):
            return .requestParameters(parameters: ["groupId" : groupId], encoding: JSONEncoding.default)
            
        case .dailydiary(_, let diaryContents):
            return .requestParameters(parameters: ["diaryContents" : diaryContents], encoding: JSONEncoding.default)
            
        case .groupMake(_, let groupName, let maximumMemberNumber, let introduction):
            return .requestParameters(parameters: ["groupName" : groupName, "maximumMemberNumber" : maximumMemberNumber, "introduction" : introduction], encoding: JSONEncoding.default)
            
        case .groupFeed, .groupEdit, .mypage, .groupDetail, .daypromise, .refreshtoken, .groupList:
            return .requestPlain
            
        }
    }
    
    var validationType: Moya.ValidationType {
        // validationType - 허용할 response의 타입
        return .successAndRedirectCodes
    }
    
    var headers: [String : String]? {
        // headers - HTTP header
        switch self {
        case .login:
            return ["Content-Type" : "application/json"]
        case .onboard(let token, _, _):
            return ["Content-Type" : "application/json", "token" : token]
        case .timestamp(let token, _, _, _):
            return ["Content-Type" : "multipart/form-data", "token" : token]
            
        case .groupJoin(let token, _), .groupFeed(let token, _), .groupEdit(let token, _), .groupDetail(let token, _), .mypage(let token), .daypromise(let token), .dailydiary(let token, _), .groupMake(let token, _, _, _), .groupList(let token):
            return ["Content-Type" : "application/json", "token" : token]
            
        case .refreshtoken(let refreshtoken):
            return ["Content-Type" : "application/json", "refreshtoken" : refreshtoken]
        }
    }
    
}

public protocol PluginType {
    func onFail(_ request: URLRequest, target: TargetType) -> URLRequest
    func willSend(_ request: RequestType, target: TargetType)
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType)
    func onSucceed(_ result: Result<Moya.Response, MoyaError>, target: TargetType) -> Result<Moya.Response, MoyaError>
}
//
//final class APILoggingPlugin: PluginType {
//
//    func onFail(_ request: URLRequest, target: TargetType) -> URLRequest{
//        if let response = error.response {
//              onSuceed(response, target: target, isFromError: true)
//              return
//            }
//            var log = "<-- \(error.errorCode) \(target)\n"
//            log.append("\(error.failureReason ?? error.errorDescription ?? "unknown error")\n")
//            log.append("<-- END HTTP")
//            print(log)
//          }
//    }
//
//    func onSucceed(_ result: Result<Response, MoyaError>, target: TargetType) -> Result<Response, MoyaError> {
//        <#code#>
//    }
//
//
//    func willSend(_ request: RequestType, target: TargetType) {
//        guard let httpRequest = request.request else {
//            print("--> invalid request")
//            return
//        }
//        let url = httpRequest.description
//        let method = httpRequest.httpMethod ?? "unknown method"
//        var log = "--> \(method) \(url)\n"
//        log.append("API: \(target)\n")
//        if let headers = httpRequest.allHTTPHeaderFields, !headers.isEmpty {
//            log.append("header: \(headers)\n")
//        }
//        if let body = httpRequest.httpBody, let bodyString = String(bytes: body, encoding: String.Encoding.utf8) {
//            log.append("\(bodyString)\n")
//        }
//        log.append("--> END \(method)")
//        print(log)
//    }
//
//
//
//    public func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
//        switch result {
//        case let .success(response):
//            onSuceed(response, target: target, isFromError: false)
//        case let .failure(error):
//            onFail(error, target: target)
//        }
//
//    }
//}
