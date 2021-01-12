//
//  NetworkResult.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import Foundation


enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
    case failure(Int)
}
