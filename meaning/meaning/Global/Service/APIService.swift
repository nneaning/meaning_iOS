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
    
    //Ex)
    
    /*
     func checkUser(uuid: String, completion: @escaping (NetworkResult<UserData>)->(Void)) {
     //UserData은 서버에서 받아올 data 구조체입니다!
         let target: APITarget = .checkUser(uuid: uuid)
         // APITarget에서 만들어준 case 중 하나를 선택합니다!
         judgeObject(target, completion: completion)

     }
     */
    
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
                    completion(.pathErr)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
