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
    
    // MARK: IBOutlet
    
    @IBOutlet weak var feedDetailTableView: UITableView!
    @IBOutlet weak var feedNameLabel: UILabel!
    
    @IBOutlet weak var sloganView: UIView!
    @IBOutlet weak var sloganLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setFeed()
        // Do any additional setup after loading the view.
    }
    
}

// MARK: Extension

extension FeedDetailVC {
    
    func setView() {
        
        feedNameLabel.text = "마이피드"
        feedNameLabel.font = UIFont.notoMedium(size: 17)
        feedNameLabel.textColor = UIColor.gray1
        
        sloganView.backgroundColor = UIColor.meaningLightblue
        
        sloganLabel.font = UIFont.spoqaMedium(size: 14)
        sloganLabel.textColor = .meaningNavy
        sloganLabel.text = "오늘은 365일 중에 30번째 의미있는 아침입니다."
        
        feedDetailTableView.backgroundColor = .gray1
        
    }
    
    func setFeed() {
        let date1 = FeedDetail(nick: "김민희", writeTime: "2021/01/08 05:00:00", wakeupTime: "05:00:00", context: "저는 오늘 일어나자마자 책을 읽었습니다.\n여러분들은 오늘 아침 뭐하셨나요?", imageName: "test_img")
        let date2 = FeedDetail(nick: "밍찌", writeTime: "2021/01/01 17:00:00", wakeupTime: "05:30:00", context: "여러분 잘 일어나셨죠?", imageName: "test_img")
        let date3 = FeedDetail(nick: "밍찌리", writeTime: "2020/12/25 21:30:00", wakeupTime: "08:45:00", context: "냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠냠", imageName: "test_img")
        
        feedDetailList = [date1, date2, date3]
    }
}
