//
//  FeedDetailVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/08.
//

import UIKit

class FeedDetailVC: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var feedDetailTableView: UITableView!
    @IBOutlet weak var feedNameLabel: UILabel!
    
    @IBOutlet weak var sloganView: UIView!
    @IBOutlet weak var sloganLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
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
}
