//
//  FeedDetailVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/08.
//

import UIKit

class FeedDetailVC: UIViewController {

    // MARK: Variable Part
    
    var feedDetailList: [FeedDetail] = []
    var sloganMent: String = "오늘은 365일 중에 30번째 의미있는 아침입니다."
    var groupName: String = "마이피드"
    
    // MARK: IBOutlet
    
    @IBOutlet weak var feedDetailTableView: UITableView!
    @IBOutlet weak var feedNameLabel: UILabel!
    
    @IBOutlet weak var sloganView: UIView!
    @IBOutlet weak var sloganLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setFeed()
        setRefresh()
        // Do any additional setup after loading the view.
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
    
    func setFeed() {
        let date1 = FeedDetail(nick: "김민희", writeTime: "2021/01/08 05:00:00", wakeupTime: "05:00:00", context: "저는 오늘 일어나자마자 책을 읽었습니다.\n여러분들은 오늘 아침 뭐하셨나요?", imageName: "IMG_0668")
        let date2 = FeedDetail(nick: "밍찌", writeTime: "2021/01/01 17:00:00", wakeupTime: "05:30:00", context: "여러분 잘 일어나셨죠?", imageName: "IMG_0668")
        let date3 = FeedDetail(nick: "밍찌리", writeTime: "2020/12/25 21:30:00", wakeupTime: "08:45:00", context: "냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠", imageName: "IMG_0668")
        
        feedDetailList = [date1, date2, date3]
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
        return feedDetailList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let feedDetailCell = tableView.dequeueReusableCell(withIdentifier: FeedDetailCell.identifier, for:
        indexPath) as? FeedDetailCell else {
            
            return UITableViewCell()
            
        }
        feedDetailCell.setData(nick: feedDetailList[indexPath.row].nick, writeTime: feedDetailList[indexPath.row].writeTime, wakeupTime: dateConverter(dateData: feedDetailList[indexPath.row].wakeupTime), context: feedDetailList[indexPath.row].context, uploadImageName: feedDetailList[indexPath.row].timeStamp, index: indexPath.row % 2)
        return feedDetailCell
    }
    
    
}
