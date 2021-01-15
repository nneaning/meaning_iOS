//
//  APIService.swift
//  meaning
//
//  Created by 김민희 on 2021/01/10.
//

import Foundation
import Moya

struct APIService {
    
    static let shared = APIService()
    // 싱글톤객체로 생성
    let provider = MoyaProvider<APITarget>()
    // MoyaProvider(->요청 보내는 클래스) 인스턴스 생성
    
    
    func splash(_ refreshtoken: String, completion: @escaping (NetworkResult<RefreshtokenData>)->(Void)) {
        
        let target: APITarget = .refreshtoken(refreshtoken: refreshtoken)
        judgeObject(target, completion: completion)
        
    }
    
    func login(_ email: String, _ password: String, completion: @escaping (NetworkResult<LoginData>)->(Void)) {
        
        let target: APITarget = .login(email: email, password: password)
        judgeObject(target, completion: completion)

    }
    
    func onboarding(_ token: String, _ nickName: String, _ wakeUpTime: String, completion: @escaping (NetworkResult<Any>)->(Void)) {
        
        let target: APITarget = .onboard(token: token, nickName: nickName, wakeUpTime: wakeUpTime)
        judgeSimpleObject(target, completion: completion)
    }
    
    func calendarDay(token: String, completion: @escaping (NetworkResult<CalendarData>)->(Void)) {
        
        let target: APITarget = .calendarDay(token: token)
        judgeObject(target, completion: completion)
    }
    
    func daypromise(_ token: String, completion: @escaping (NetworkResult<DaypromiseData>)->(Void)) {
        
        let target: APITarget = .daypromise(token: token)
        judgeObject(target, completion: completion)
        
    }
    
    func dailydiary(_ token: String, _ diaryContents: String, completion: @escaping (NetworkResult<DailydiaryData>)->(Void)) {
        
        let target: APITarget = .dailydiary(token: token, diaryContents: diaryContents)
        judgeObject(target, completion: completion)
    }
    
    func bookreview(_ token: String, _ bookTitle: String, _ bookCommentContents: String, completion: @escaping (NetworkResult<Any>)->(Void)) {
        
        let target: APITarget = .bookreview(token: token, bookTitle: bookTitle, bookCommentContents: bookCommentContents)
        judgeSimpleObject(target, completion: completion)
        
    }
    
    func timestamp(_ token: String, _ dateTime: String, _ timeStampContents: String, _ image: UIImage, completion: @escaping (NetworkResult<TimestampData>)->(Void)) {
        
        let target: APITarget = .timestamp(token: token, dateTime: dateTime, timeStampContents: timeStampContents, image: image)
        judgeObject(target, completion: completion)
        
    }
    
    func myGroup(_ token: String, completion: @escaping (NetworkResult<MyGroupData>)->(Void)) {
        
        let target: APITarget = .myGroup(token: token)
        judgeObject(target, completion: completion)
        
    }
    
    func mypage(token: String, completion: @escaping (NetworkResult<MypageData>)->(Void)) {
        
        let target: APITarget = .mypage(token: token)
        judgeObject(target, completion: completion)
        
    }
    
    func groupList(token: String, completion: @escaping (NetworkResult<GroupListData>)->(Void)) {
        
        let target: APITarget = .groupList(token: token)
        judgeObject(target, completion: completion)
    }
    
    func groupDetail(token : String, groupid: Int, completion: @escaping (NetworkResult<GroupDetailData>)->(Void)) {
        
        let target: APITarget = .groupDetail(token: token, groupid: groupid)
        judgeObject(target, completion: completion)
    }
    
    func groupJoin(token: String, groupId: Int, completion: @escaping (NetworkResult<Any>)->(Void)) {
        
        let target: APITarget = .groupJoin(token: token, groupId: groupId)
        judgeSimpleObject(target, completion: completion)
    }
    
    func groupCreate(token: String, groupName: String, maximumMemberNumber: Int, introduction: String, completion: @escaping (NetworkResult<GroupCreateData>)->(Void)) {
        
        let target: APITarget = .groupMake(token: token, groupName: groupName, maximumMemberNumber: maximumMemberNumber, introduction: introduction)
        judgeObject(target, completion: completion)
    }
    
    func groupInfo(token: String, groupid: Int, completion: @escaping (NetworkResult<GroupInfoData>)->(Void)) {
       
        let target: APITarget = .groupEdit(token: token, groupid: groupid)
        judgeObject(target, completion: completion)
        
    }
    
    func groupFeed(token: String, groupid: Int, completion: @escaping (NetworkResult<[GroupFeedData]>)->(Void)) {
        
        let target: APITarget = .groupFeed(token: token, groupid: groupid)
        judgeObject(target, completion: completion)
        
    }
    
    
    
    
}

extension APIService {
    
    func judgeObject<T: Codable>(_ target: APITarget, completion: @escaping (NetworkResult<T>) -> Void) {
        provider.request(target) { response in
            switch response {
            case .success(let result):
                do {
                    let decoder = JSONDecoder()
                    let body = try decoder.decode(GenericResponse<T>.self, from: result.data)
                    if let data = body.data {
                        completion(.success(data))
                    }
                } catch {
                    print("구조체를 확인해보세요")
                }
            case .failure(let error):
                completion(.failure(error.response!.statusCode))
            }
        }
    }
    
    func judgeSimpleObject(_ target: APITarget, completion: @escaping (NetworkResult<Any>) -> Void) {
        // data를 받아오지 않을때 사용하기!
        provider.request(target) { response in
            switch response {
            case .success(let result):
                do {
                    let decoder = JSONDecoder()
                    let body = try decoder.decode(SimpleData.self, from: result.data)
                    completion(.success(body))
                } catch {
                    print("구조체를 확인해보세요")
                }
            case .failure(let error):
                completion(.failure(error.response!.statusCode))
            }
        }
    }
}
