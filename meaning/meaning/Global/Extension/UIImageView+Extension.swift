//
//  UIImageView+Extension.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImage(from url: String, completion: @escaping (UIImage?) -> Void)
    // kingfisher를 이용해 서버에서 넘어오는 url을 cache 키로 사용해 UIImageView로 넣어주는 함수
    {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: url)!,
                         placeholder: UIImage(),
                         options: [.transition(.fade(1))],
                         progressBlock: nil) { result in
            switch result {
            
        case .success(let value):
            completion(value.image)
        case .failure(let err):
            print(err.errorCode)
            completion(nil)
            
            }
        }
    }
}
