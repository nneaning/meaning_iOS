//
//  FeedDetail.swift
//  meaning
//
//  Created by 김민희 on 2021/01/08.
//

import UIKit

struct FeedDetail {
    var nick: String
    var writeTime: String
    var wakeupTime: String
    var context: String
    var timeStamp: String
    
    init(nick: String, writeTime: String, wakeupTime: String, context: String, imageName: String) {
        self.nick = nick
        self.writeTime = writeTime
        self.wakeupTime = wakeupTime
        self.context = context
        self.timeStamp = imageName
    }
    
    
}
