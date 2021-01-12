//
//  CalendarData.swift
//  meaning
//
//  Created by 김민희 on 2021/01/12.
//

import UIKit

struct CalendarData {
    var starImage: UIImage?
    var dateIndex: Int
    
    init(index: Int, imageName: String) {
        self.dateIndex = index
        self.starImage = UIImage(named: imageName)
    }
}

