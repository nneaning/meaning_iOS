//
//  GroupFeedVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/09.
//

import UIKit

class GroupFeedVC: UIViewController {

    // MARK: Variable Part
    
    var feedList: [FeedImage] = []
    
    // MARK: IBOutlet
    
    @IBOutlet weak var groupFeedCollectionView: UICollectionView!
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    

}

// MARK: Extension

extension GroupFeedVC {
    
    // MARK: Function
    
    func setData() {
        let data1 = FeedImage(feedImageName: "IMG_0668")
        let data2 = FeedImage(feedImageName: "IMG_0668")
        let data3 = FeedImage(feedImageName: "IMG_0668")
        let data4 = FeedImage(feedImageName: "IMG_0668")
        let data5 = FeedImage(feedImageName: "IMG_0668")
        let data6 = FeedImage(feedImageName: "IMG_0668")
        let data7 = FeedImage(feedImageName: "IMG_0668")
        let data8 = FeedImage(feedImageName: "IMG_0668")
        let data9 = FeedImage(feedImageName: "IMG_0668")
        
        feedList = [data1,data2,data3,data4,data5,data6,data7,data8,data9]
    }
}
