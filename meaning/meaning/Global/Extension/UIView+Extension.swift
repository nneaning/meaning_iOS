//
//  UIView+Extension.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import UIKit

extension UIView {
    func snapShot() -> UIImage {
        // View 자체를 캡쳐 후 Image로 변환해주기
        
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image { context in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        
        return image
    }
}
