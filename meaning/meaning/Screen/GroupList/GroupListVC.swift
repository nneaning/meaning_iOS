//
//  GroupListVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/03.
//

import UIKit

class GroupListVC: UIViewController {

    @IBOutlet var logoView: UIView!
    @IBOutlet var GroupTableView: UITableView!
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var myGroupView: UIView!
    @IBOutlet var myGroupLabel: UILabel!
    @IBOutlet var groupAddLabel: UILabel!
    @IBOutlet var groupAddBtn: UIButton!
    
    @IBOutlet var noGroupBoxView: UIView!
    @IBOutlet var noGroupLabel: UILabel!
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()
    
    }
    

}

extension GroupListVC {
    func setHeader() {
        myGroupLabel.text = "내그룹"
        myGroupLabel.font = UIFont.spoqaMedium(size: 18)
        myGroupLabel.textColor = UIColor.gray1
        
        groupAddLabel.text = "그룹 생성"
        groupAddLabel.font = UIFont.spoqaMedium(size: 14)
        groupAddLabel.textColor = UIColor.meaningNavy
        
        noGroupBoxView.backgroundColor = UIColor.meaningLightblue
        
        noGroupLabel.text = "가입하신 그룹이 없네요!"
        noGroupLabel.font = UIFont.spoqaMedium(size: 15)
        noGroupLabel.textColor = UIColor.meaningNavy
        
        welcomeLabel.text = "그룹에 가입하고 그룹원들과 함께 미라클 모닝을 맞이해봐요!"
        welcomeLabel.font = UIFont.spoqaRegular(size: 14)
        welcomeLabel.textColor = UIColor.gray3
    }
    
}
