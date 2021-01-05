//
//  Toast+Extension.swift
//  meaning
//
//  Created by 선민승 on 2021/01/05.
//

import UIKit

// MARK: Toast Alert Extension

// 사용법: showToast( "원하는 메시지 내용", UIFont.~ )

extension UIViewController {
    
    func showToast(message : String, font: UIFont) {
        let guide = view.safeAreaInsets.bottom
        let height = self.view.frame.size.height-guide
        
        let toastLabel = UILabel(
            frame: CGRect( x: self.view.frame.size.width/2 - 83,
                           y: height-181,
                           width: 166,
                           height: 29
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
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}


