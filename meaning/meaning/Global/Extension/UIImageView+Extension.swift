//
//  UIImageView+Extension.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import Foundation
import Kingfisher


extension UIImageView {
    func setImage(from url: String) {
        self.kf.indicatorType = .activity
        let cache = ImageCache.default
        
        cache.retrieveImage(forKey: url) { result in
            switch result {
            case .success(let value):
                if value.image != nil {
                    self.image = value.image
                    
                } else {
                    self.kf.setImage(with: URL(string: url))
                    
                }
            case .failure(let err):
                print(err.errorCode)
            }
        }
        
    }
}
