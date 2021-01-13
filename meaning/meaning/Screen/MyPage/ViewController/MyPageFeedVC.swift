//
//  MyPageFeedVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/07.
//

import UIKit

class MyPageFeedVC: UIViewController {
    
    // MARK: Variable Part
    
    let randomProfile = Int.random(in: 0...1)
    var userNick: String = UserDefaults.standard.string(forKey: "userNick")!
    var wakeUpTimeText: String = ""
    var mypageData: MypageData? // 서버 구조체 생성
    
    // MARK: IBOutlet
    
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var headerView: UIView!
    
    @IBOutlet var myProfileView: UIView!
    @IBOutlet var userNameInitial: UILabel!
    
    @IBOutlet var userNameLabel: UILabel!
    
    @IBOutlet var userWakeTimeView: UIView!
    
    @IBOutlet var timeViewWidth: NSLayoutConstraint!
    @IBOutlet var userWakeTimeLabel: UILabel!
    
    @IBOutlet var feedHeaderView: UIView!
    @IBOutlet var feedHeaderLabel: UILabel!
    
    @IBOutlet var feedCollectionView: UICollectionView!
    
    // MARK: IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setCollectionView()
        setRefresh()
        loadMypage(token: UserDefaults.standard.string(forKey: "accesstoken")!)
        // 토큰 넣어줘야함(88)

    }
    
    
    override func viewWillLayoutSubviews() {
        self.myProfileView.setRounded(radius: nil)
        
        if (randomProfile == 0) {
            self.myProfileView.backgroundColor = .meaningLightblue
            self.userNameInitial.textColor = .meaningNavy
        } else if (randomProfile == 1) {
            self.myProfileView.backgroundColor = .meaningNavy
            self.userNameInitial.textColor = .meaningIvory
        }
        
    }
    
    // MARK: CollectionView
    
    func setCollectionView(){
        feedCollectionView.delegate = self
        feedCollectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        feedCollectionView.collectionViewLayout = layout
        feedCollectionView.register(FeedCollectionViewCell.nib(), forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
        
        // SE 외는 scroll view inset adjustment behavior = never 처리
        
        if #available(iOS 11.0, *) {
            feedCollectionView.contentInsetAdjustmentBehavior = .never
        }
    }
    
    // MARK: Layout
    
    func setLayout() {
        
        let initial: String = String(self.userNick.prefix(1))
        
        self.view.backgroundColor = UIColor.meaningWhite
        self.headerView.backgroundColor = UIColor.meaningWhite
        
        self.headerLabel.font = UIFont.notoMedium(size: 17.0)
        self.headerLabel.text = "마이 피드"
        self.headerLabel.textColor = UIColor.gray1
        
        self.userNameInitial.text = initial
        self.userNameInitial.font = .spoqaMedium(size: 20)
        self.userNameInitial.textAlignment = .center
        
        self.userNameLabel.text = userNick
        self.userNameInitial.font = .spoqaMedium(size: 16)
        self.userNameLabel.textColor = .gray1
        self.userNameLabel.lineSetting(kernValue: -0.64)

        wakeUpTimeText = dateConverter(dateData: UserDefaults.standard.string(forKey: "wakeUpTime")!)
        self.userWakeTimeLabel.text = wakeUpTimeText

        if (wakeUpTimeText == "시간 설정을 해주세요.") {
            timeViewWidth.constant = 130
        } else if (wakeUpTimeText.count > 12) {
            timeViewWidth.constant = 150
        }
        
        self.userWakeTimeLabel.textColor = .skyBlue
        self.userWakeTimeLabel.font = .spoqaMedium(size: 13)
        self.userWakeTimeLabel.lineSetting(kernValue: -0.52)
        self.userWakeTimeLabel.textAlignment = .center
        self.userWakeTimeView.setBorder(borderColor: .skyBlue, borderWidth: 1)
        self.userWakeTimeView.setRounded(radius: 13.5)
        self.userWakeTimeView.backgroundColor = .meaningWhite
        
        self.feedHeaderLabel.text = "오늘은 365일 중에 0번째 의미있는 아침입니다."
        self.feedHeaderView.backgroundColor = .meaningLightblue
        self.feedHeaderLabel.font = .spoqaMedium(size: 14)
        self.feedHeaderLabel.lineSetting(kernValue: -0.56)
        self.feedHeaderLabel.textAlignment = .center
        
    }
    
    func setRefresh() {
        // 당겨서 feedCollectionView 새로고침
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateData(refresh:)), for: .valueChanged)
        feedCollectionView.addSubview(refresh)
    }
    
    @objc func updateData(refresh: UIRefreshControl) {
        refresh.endRefreshing()
        loadMypage(token: "")
        // 토큰 값 넣어주기(88)
        feedCollectionView.reloadData()
    }
    
    // MARK: setData

    
    func loadMypage(token: String) {
            APIService.shared.mypage(token: token) { result in
                switch result {
                case .success(let data):
                    self.mypageData = data
                    if let mypage = self.mypageData?.getMyPage {
                        self.feedHeaderLabel.text = "오늘은 365일 중에 \(mypage.count + 1)번째 의미있는 아침입니다."
                    }
                    self.feedCollectionView.reloadData()

                case .failure(_):
                    print("FailureError")
                }
            }
        }
}

// MARK: Extension

// CollectionViewDataSource

extension MyPageFeedVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mypageData?.getMyPage?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath) as! FeedCollectionViewCell
        if let mypageData = mypageData {
            cell.configure(image: mypageData.getMyPage![indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 디테일 뷰로 이동
        
        let detailStoryboard = UIStoryboard.init(name: "GroupFeed", bundle: nil)
        guard let feedDetailTap = detailStoryboard.instantiateViewController(identifier: "FeedDetailVC") as? FeedDetailVC else {
            return
        }
        
        feedDetailTap.groupName = "마이 피드"
        feedDetailTap.indexScroll = indexPath
        self.navigationController?.pushViewController(feedDetailTap, animated: true)
        
    }

}

//FlowLayout

extension MyPageFeedVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/3
        return CGSize(width: width-0.5, height: width-0.5)
    }
    
    //전체 적으로 좌우상하 inset
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
    }
    
    //한 줄에서 아이템 좌우 사이 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    // 한 줄씩 사이의 거리
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

extension APIService {

    func mypage(token: String, completion: @escaping (NetworkResult<MypageData>)->(Void)) {
        
        let target: APITarget = .mypage(token: token)
        judgeObject(target, completion: completion)
        
    }
}
