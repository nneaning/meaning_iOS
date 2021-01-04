//
//  Group.swift
//  meaning
//
//  Created by Seri Park on 2021/01/04.
//

import UIKit

struct Group {
    
    var headerImage: String
    var groupName: String
    var peopleCount: Int
    
    
    func makeImage () -> UIImage? {
        return UIImage (named: headerImage)
    }
}

