//
//  FeedImage.swift
//  meaning
//
//  Created by 선민승 on 2021/01/08.
//

import UIKit

struct FeedImage {
    var feedImageName: String
    
    func makeFeedImage() -> UIImage? {
        return UIImage(named: feedImageName)
    }
}

