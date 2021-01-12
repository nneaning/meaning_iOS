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
    var groupName: String?
    var groupPersonCount: Int = 3 // 앞의 뷰에서 받아오기
    var groupFeedData: [GroupFeedData]?
    
    // MARK: IBOutlet
    
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var groupFeedCollectionView: UICollectionView!
    
    // MARK: IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        uploadGroupFeed("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwibmFtZSI6IuuwleyDgeyImCIsImlhdCI6MTYxMDQ2NDEyMSwiZXhwIjoxNjEyMjc4NTIxLCJpc3MiOiJTZXJ2ZXJCYWQifQ.6awmeWcIrODlWpJnHTiRIH93SyX0MxcVuIXpwf1L8lg",39)
    }
    
}

// MARK: Extension

extension GroupFeedVC {
    
    // MARK: Function
    
    func setView() {
        // View Style Setting
        
        groupNameLabel.text = groupName
        groupNameLabel.font = UIFont.notoMedium(size: 17)
        
        groupFeedCollectionView.delegate = self
        groupFeedCollectionView.dataSource = self
    }
    
    func uploadGroupFeed(_ token: String, _ groupid: Int) {
        APIService.shared.groupFeed(token: token, groupid: groupid) { [self] result in
                switch result {
                case .success(let data):
                    self.groupFeedData = data
                    if let feed = groupFeedData {
                        if feed.count == 0 { // 그룹에 글이 없어요
                            
                        } else { // 그룹에 글이 있어요
                            
                        }
                        groupFeedCollectionView.reloadData()
                    }
                    
                case .requestErr:
                    print("requestErr")
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                case .failure(let error):
                    print(error)
                }
            }
    }
}

extension GroupFeedVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupFeedData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: GroupFeedCell.identifier, for: indexPath) as? GroupFeedCell else {
            
            return UICollectionViewCell()
            
        }
        
        if let data = groupFeedData {
            feedCell.setCell(data, index: indexPath.row)
        }
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 이미지 클릭 시 디테일 뷰로 이동
        
        let detailStoryboard = UIStoryboard.init(name: "GroupFeed", bundle: nil)
        guard let feedDetailTap = detailStoryboard.instantiateViewController(identifier: "FeedDetailVC") as? FeedDetailVC else {
            return
        }
        
        feedDetailTap.indexScroll = indexPath
        feedDetailTap.groupName = groupName
        feedDetailTap.sloganMent = "\(groupPersonCount)명의 사람들이 함께 아침을 맞이하고 있어요!"
        self.navigationController?.pushViewController(feedDetailTap, animated: true)
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

extension APIService {
    
    func groupFeed(token: String, groupid: Int, completion: @escaping (NetworkResult<[GroupFeedData]>)->(Void)) {
        let target: APITarget = .groupFeed(token: token, groupid: groupid)
        judgeObject(target, completion: completion)
    }
    
}
