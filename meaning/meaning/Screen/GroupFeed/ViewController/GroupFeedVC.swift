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
    var groupName: String = "미닝 아요팀 최고야"
    var groupPersonCount: Int = 3
    
    // MARK: IBOutlet
    
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupFeedCollectionView: UICollectionView!
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setView()
    }
    
}

// MARK: Extension

extension GroupFeedVC {
    
    // MARK: Function
    
    func setData() {
        // Data 삽입
        
        let data1 = FeedImage(feedImageName: "IMG_0668")
        let data2 = FeedImage(feedImageName: "IMG_0668")
        let data3 = FeedImage(feedImageName: "IMG_0668")
        let data4 = FeedImage(feedImageName: "IMG_0668")
        let data5 = FeedImage(feedImageName: "IMG_0668")
        let data6 = FeedImage(feedImageName: "IMG_0668")
        let data7 = FeedImage(feedImageName: "IMG_0668")
        let data8 = FeedImage(feedImageName: "IMG_0668")
        let data9 = FeedImage(feedImageName: "IMG_0668")
        let data10 = FeedImage(feedImageName: "IMG_0668")
        let data11 = FeedImage(feedImageName: "IMG_0668")
        let data12 = FeedImage(feedImageName: "IMG_0668")
        let data13 = FeedImage(feedImageName: "IMG_0668")
        let data14 = FeedImage(feedImageName: "IMG_0668")
        let data15 = FeedImage(feedImageName: "IMG_0668")
        let data16 = FeedImage(feedImageName: "IMG_0668")
        let data17 = FeedImage(feedImageName: "IMG_0668")
        let data18 = FeedImage(feedImageName: "IMG_0668")
        
        
        feedList = [data1,data2,data3,data4,data5,data6,data7,data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18]
    }
    
    func setView() {
        // View Style Setting
        
        groupNameLabel.text = groupName
        groupNameLabel.font = UIFont.notoMedium(size: 17)
        
        groupFeedCollectionView.delegate = self
        groupFeedCollectionView.dataSource = self
    }
}

extension GroupFeedVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupFeedCell.identifier, for: indexPath) as? GroupFeedCell else {
            
            return UICollectionViewCell()
            
        }
        
        feedCell.setCell(feedList[indexPath.row])
        return feedCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // CollectionView Header 지정
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GroupFeedReusableView", for: indexPath) as? GroupFeedReusableView else {
            return UICollectionReusableView()
        }
        headerView.setMent(count: groupPersonCount)
        return headerView

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // CollectionView Header 높이 지정
        
        return CGSize(width: collectionView.frame.width, height: 50)
    }

}

extension GroupFeedVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
                            indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width) / 3 - 1, height: (collectionView.frame.width) / 3 - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.5
    }
}
