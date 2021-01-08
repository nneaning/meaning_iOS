//
//  WakeUpTimeView+Extension.swift
//  meaning
//
//  Created by 선민승 on 2021/01/08.
//

import UIKit



extension UIViewController {
    func dateConverter(dateData: String) -> String {
        
        //서버 데이터가 없거나 00:00:00 인 경우에 대한 예외 처리
        if (dateData.isEmpty || dateData == "00:00:00") {
            return "시간 설정을 해주세요."
        }
        
        // return 될 최종 string
        var convertedDate: String = "매일 오전 "
        let arr = dateData.components(separatedBy: ":")
        let intArray = arr.map{Int($0)!}
        
        // 분기 처리 
        for i in 0...1 {
            if (intArray[i] != 0 && i == 0) {
                convertedDate.append("\(String(intArray[i]))시 ")
            } else if (intArray[i] != 0 && i == 1) {
                convertedDate.append("\(String(intArray[i]))분 ")
            }
        }
        
        return "\(convertedDate)기상"
    }
}
