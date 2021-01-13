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
    var groupPersonCount: Int = 0 // 앞의 뷰에서 받아오기
    var groupFeedData: [GroupFeedData]?
    var groupNumber: Int = 39 // 앞에 뷰에서 받아오기
    
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
        uploadGroupFeed("토큰",groupNumber)
        // 토큰넣기(88)
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
    
    func makeBlankViewa() {
        // 그룹에 올린 글이 하나도 없을 때 뷰 코드로 제작
        
        var insets = 0
        if self.view.safeAreaInsets.bottom == 0.0 {
            // se기준으로 작은 폰은 조금 위로 올려줌
            insets = -30
        }
        let blankFrame = CGRect(x: 0, y: groupFeedCollectionView.frame.minY+50, width: groupFeedCollectionView.frame.width, height: groupFeedCollectionView.frame.height)
        let blankView : UIView = UIView(frame: blankFrame)
        blankView.backgroundColor = .white
        self.view.addSubview(blankView)
        
        let docsFrame = CGRect(x: Int(blankView.frame.width)/2 - 23, y: 181+insets, width: 46, height: 46)
        let docsImage : UIImageView = UIImageView(frame: docsFrame)
        docsImage.image = UIImage(named: "groupBlankIc")
        blankView.addSubview(docsImage)
        
        let firstMentFrame = CGRect(x: 0, y: 253+insets, width: Int(groupFeedCollectionView.frame.width), height: 22)
        let firstMentLabel : UILabel = UILabel(frame: firstMentFrame)
        firstMentLabel.text = "아직 게시글이 없네요"
        firstMentLabel.font = UIFont.spoqaMedium(size: 18)
        firstMentLabel.textColor = .meaningNavy
        firstMentLabel.textAlignment = .center
        blankView.addSubview(firstMentLabel)
        
        let secondMentFrame = CGRect(x: 0, y: 279+insets, width: Int(groupFeedCollectionView.frame.width), height: 24)
        let secondMentLabel : UILabel = UILabel(frame: secondMentFrame)
        secondMentLabel.text = "기상미션을 수행하고 게시글을 남겨봐요"
        secondMentLabel.font = UIFont.spoqaRegular(size: 15)
        secondMentLabel.textColor = .gray3
        secondMentLabel.textAlignment = .center
        blankView.addSubview(secondMentLabel)
        
        let buttonFrame = CGRect(x: 43, y: 375, width: self.view.frame.width - 86, height: 54)
        let homeButton : UIButton = UIButton(frame: buttonFrame)
        homeButton.backgroundColor = .meaningNavy
        homeButton.setRounded(radius: 6)
        homeButton.setTitle("홈으로 돌아가기", for: .normal)
        homeButton.setTitleColor(.white, for: .normal)
        homeButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        blankView.addSubview(homeButton)
    }
    
    @objc func buttonAction() {
        // 홈으로 가기 버튼 클릭 시
        self.navigationController?.tabBarController?.selectedIndex = 0
        // 탭바의 0번으로 이동하기
    }
    
    func uploadGroupFeed(_ token: String, _ groupid: Int) {
        APIService.shared.groupFeed(token: token, groupid: groupid) { [self] result in
                switch result {
                case .success(let data):
                    self.groupFeedData = data
                    if let feed = groupFeedData {
                        if feed.count == 0 { // 그룹에 글이 없어요
                            makeBlankViewa()
                        } else { // 그룹에 글이 있어요
                            groupFeedCollectionView.reloadData()
                        }
                    }

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
