//
//  MissionCard.swift
//  meaning
//
//  Created by 김민희 on 2021/01/06.
//

import UIKit

struct MissionCard {
    var missionImage: UIImage?
    
    init(imageName: String) {
        self.missionImage = UIImage(named: imageName)
    }
}
