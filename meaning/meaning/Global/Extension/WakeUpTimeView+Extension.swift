//
//  WakeUpTimeView+Extension.swift
//  meaning
//
//  Created by 선민승 on 2021/01/08.
//

import UIKit

// MARK: dateConverter for 기상 시간 뷰

// Extension 설명: 서버에서 전달되는 "09:00:00" 문자열을 "매일 오전 9시 기상" 과 같은 형식으로 리턴해줍니다.

// 유의사항 :
// 1. dateData 는 서버에서 넘어오는 string을 넣어야합니다.
// 2. originalConstraint 는 extension이 사용되는 UIView의 NSLayoutConstraint 을 넣어야합니다. UIView의 Width constraint 여야 합니다.
// 3. convertedWidth 는 '분'이 넘어오게 될 때 늘어날 width를 의미합니다. 예를 들어 본래 UIView의 width 가 110이라면, ~분이 추가될 경우에 130 으로 늘어야하면 130을 입력해주세요.

// 사용법: self.userWakeTimeLabel.text = dateConverter(dateData: "00:00:00", originalConstraint: timeViewWidth, convertedWidth: 150)

extension UIViewController {
    func dateConverter(dateData: String, originalConstraint: NSLayoutConstraint, convertedWidth: CGFloat) -> String {
        
        //서버 데이터가 없거나 00:00:00 인 경우에 대한 예외 처리
        if (dateData.isEmpty || dateData == "00:00:00") {
            originalConstraint.constant = 130
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
                originalConstraint.constant = convertedWidth
            }
        }
        
        return "\(convertedDate)기상"
    }
    func dateConverter1(dateData: String) -> String {
        
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
