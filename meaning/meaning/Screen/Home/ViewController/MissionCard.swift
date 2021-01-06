//
//  MissionCard.swift
//  meaning
//
//  Created by 김민희 on 2021/01/06.
//

import UIKit

struct MissionCard {
    var missionImage: UIImage?
    var missionIndex: Int
    var missonMent: String
    
    init(index: Int, ment: String, imageName: String) {
        self.missionIndex = index
        self.missonMent = ment
        self.missionImage = UIImage(named: imageName)
    }
}
