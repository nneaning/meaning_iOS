//
//  Group.swift
//  meaning
//
//  Created by Seri Park on 2021/01/04.
//

import UIKit

struct Group {
    var groupName : String
    var peopleCount : Int
    var imageName : String
    
    func makeImage () -> UIImage? {
        return UIImage (named: imageName)
    }
}

