//
//  UIViewController+Extension.swift
//  meaning
//
//  Created by 선민승 on 2021/01/05.
//

import UIKit

extension UIViewController {
    
    // MARK: Toast Alert Extension

    // 사용법: showToast( "원하는 메시지 내용", UIFont.~ )
    
    func showToast(message : String, font: UIFont, width: Int, bottomY: Int) {
        let guide = view.safeAreaInsets.bottom
        let y = self.view.frame.size.height-guide
        
        let toastLabel = UILabel(
            frame: CGRect( x: self.view.frame.size.width/2 - CGFloat(width)/2,
                           y: y-CGFloat(bottomY),
                           width: CGFloat(width),
                           height: 30
            )
        )
        
        toastLabel.backgroundColor = UIColor.gray4
        toastLabel.textColor = UIColor.gray6
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 6
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    // MARK: dateConverter for 기상 시간 뷰

    // Extension 설명: 서버에서 전달되는 "09:00:00" 문자열을 "매일 오전 9시 기상" 과 같은 형식으로 리턴해줍니다.

    // 유의사항 :
    // 1. dateData 는 서버에서 넘어오는 string을 넣어야합니다.

    // 사용법: self.userWakeTimeLabel.text = dateConverter(dateData: "00:00:00")
    
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


