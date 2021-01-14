//
//  FeedDetailVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/08.
//

import UIKit

class FeedDetailVC: UIViewController {

    // MARK: Variable Part

    var feedDetailMyPage: [GetMyPage]? // 마이페이지에서 넘겨 받을 배열
    var feedDetailGroup: [GroupFeedData]? // 그룹에서 넘겨받을 배열
    var sloganMent: String?
    var groupName: String?
    var indexScroll: IndexPath?
    
    // MARK: IBOutlet
    
    @IBOutlet weak var feedDetailTableView: UITableView!
    @IBOutlet weak var feedNameLabel: UILabel!
    
    @IBOutlet weak var sloganView: UIView!
    @IBOutlet weak var sloganLabel: UILabel!
    
    // MARK: IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setRefresh()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        if let indexScroll = indexScroll {
            self.feedDetailTableView.scrollToRow(at: indexScroll, at: .middle, animated: false)
            // 클릭한 인덱스 위치로 이동
        }
    }
    
}

// MARK: Extension

extension FeedDetailVC {
    
    // MARK: Function
    
    func setView() {
        
        feedNameLabel.text = groupName
        feedNameLabel.font = UIFont.notoMedium(size: 17)
        feedNameLabel.textColor = UIColor.gray1
        
        sloganView.backgroundColor = UIColor.meaningLightblue
        
        sloganLabel.font = UIFont.spoqaMedium(size: 14)
        sloganLabel.textColor = .meaningNavy
        sloganLabel.text = sloganMent
        
        feedDetailTableView.separatorStyle = .none
        feedDetailTableView.dataSource = self
        feedDetailTableView.allowsSelection = false
        // cell 선택 금지
        
    }
    
    func setRefresh() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateData(refresh:)), for: .valueChanged)
        feedDetailTableView.addSubview(refresh)
    }
    @objc func updateData(refresh: UIRefreshControl) {
        refresh.endRefreshing()
        feedDetailTableView.reloadData()
    }
}

extension FeedDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let feedDetailMyPage = feedDetailMyPage { // 마이피드에서 왔다면?
            return feedDetailMyPage.count
        }
        if let feedDetailGroup = feedDetailGroup { // 그룹에서 왔다면?
            return feedDetailGroup.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let feedDetailCell = tableView.dequeueReusableCell(withIdentifier: FeedDetailCell.identifier, for:
        indexPath) as? FeedDetailCell else {
            
            return UITableViewCell()
            
        }
        if let feedDetailMyPage = feedDetailMyPage {
            // 마이피드를 처리해주기
            feedDetailCell.setData(nick: UserDefaults.standard.string(forKey: "userNick")!, writeTime: feedDetailMyPage[indexPath.row].createdAt, wakeupTime: dateConverter(dateData: UserDefaults.standard.string(forKey: "wakeUpTime")!), context: feedDetailMyPage[indexPath.row].timeStampContents, uploadImageName: feedDetailMyPage[indexPath.row].timeStampImageURL, index: indexPath.row)
        }
        if let feedDetailGroup = feedDetailGroup {
            // 그룹을 처리해주기
            feedDetailCell.setData(nick: feedDetailGroup[indexPath.row].user.nickName, writeTime: feedDetailGroup[indexPath.row].createdAt, wakeupTime: dateConverter(dateData: feedDetailGroup[indexPath.row].user.wakeUpTime), context: feedDetailGroup[indexPath.row].timeStampContents, uploadImageName: feedDetailGroup[indexPath.row].timeStampImageURL, index: indexPath.row)
        }
        return feedDetailCell
    }
    
    
}
