//
//  GroupInfoVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/06.
//

import UIKit

class GroupInfoVC: ViewController {
    
    // MARK: - Variable Part
    
    var groupInfoData: GroupInfoData?
    var groupID: Int = 0
    
    //MARK: - IBOutlet
    
    @IBOutlet var memberTableView: UITableView!
    @IBOutlet var headerView: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var groupSettingLabel: UILabel!
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var groupBirthLabel: UILabel!
    @IBOutlet var memberCountLabel: UILabel!
    
    @IBOutlet var memberLabel: UILabel!
    
    //MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memberTableView.dataSource = self
        memberTableView.separatorStyle = .none
        
        setHeader()
        groupInfo(token: UserDefaults.standard.string(forKey: "accesstoken")!, groupid: groupID)
        
    }
    
    
    //MARK: - IBAction
    
    @IBAction func BackBtnDidTap(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
//MARK: - Extension

extension GroupInfoVC {
    
    func setHeader() {
        //헤더에 들어가는 라벨 폰트, 색상 설정
        headerView.backgroundColor = UIColor.meaningIvory
        
        groupSettingLabel.text = "그룹 설정"
        groupSettingLabel.font = UIFont.notoMedium(size: 17)
        groupSettingLabel.textColor = UIColor.gray1
        groupSettingLabel.lineSetting(kernValue: -0.56)
        
        groupNameLabel.text = "넹면 좋아"
        groupNameLabel.font = UIFont.spoqaMedium(size: 20)
        groupNameLabel.textColor = UIColor.gray1
        groupNameLabel.lineSetting(kernValue: -0.8)
        
        groupBirthLabel.text = "그룹 생성일: 2020년 12월 25일"
        groupBirthLabel.font = UIFont.spoqaMedium(size: 15)
        groupBirthLabel.textColor = UIColor.gray3
        groupBirthLabel.lineSetting(kernValue: -0.6)
        
        if let birthLabel = groupBirthLabel.text {
            // 날짜 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: groupBirthLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaRegular(size: 15), range: (birthLabel as NSString).range(of: "2020년 12월 25일"))
            
            groupBirthLabel.attributedText = attributedStr
        }
        
        memberCountLabel.text = "그룹 멤버 수 : 25명"
        memberCountLabel.font = UIFont.spoqaMedium(size: 15)
        memberCountLabel.textColor = UIColor.gray3
        memberCountLabel.lineSetting(kernValue: -0.6)
        
        
        if let text = memberCountLabel.text {
            // "\(group.peopleCount)명" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: memberCountLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                       value: UIFont.spoqaRegular(size: 13), range: (text as NSString).range(of: "25명"))
            
            memberCountLabel.attributedText = attributedStr
        }
        
        memberLabel.text = "멤버"
        memberLabel.font = UIFont.spoqaMedium(size: 18)
        memberLabel.textColor = UIColor.gray2
    }
    
    
    func groupInfo(token : String, groupid: Int) {
        APIService.shared.groupInfo(token: token, groupid: groupid) { [self] result in
            switch result {
            case .success(let data):
            
                self.groupInfoData = data
                self.memberTableView.reloadData()
                
                if let groupInfoData = groupInfoData{
                    self.groupNameLabel.text = "\(groupInfoData.group.groupName)"
                    self.groupBirthLabel.text = "그룹 생성일: \(String(describing: groupInfoData.group.createdAt.recordDate()))"
                    
                    if let birthLabel = self.groupBirthLabel.text {
                        // 날짜 부분에만 폰트를 다르게 설정
                        let attributedStr = NSMutableAttributedString(string: birthLabel)
                        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaRegular(size: 15), range: (birthLabel as NSString).range(of: " \( groupInfoData.group.createdAt.recordDate())"))
                        
                        groupBirthLabel.attributedText = attributedStr
                    }
                    
                    self.memberCountLabel.text = "그룹 멤버 수 : \(groupInfoData.users.count)명"
                    
                    if let memberCount = memberCountLabel.text {
                        // "\(group.peopleCount)명" 부분에만 폰트를 다르게 설정
                        let attributedStr = NSMutableAttributedString(string: memberCount)
                        attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                                   value: UIFont.spoqaRegular(size: 15), range: (memberCount as NSString).range(of: "\(groupInfoData.users.count)명"))
                        
                        memberCountLabel.attributedText = attributedStr
                    }
                    
                }
      
            case .failure(_) :
                print("FailureError")
            }
            
        }
    }
}


extension GroupInfoVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupInfoData?.users.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //tableView의 IndexPath 별 Cell 지정
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberTableViewCell.identifier)
                as? MemberTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
        if let data = groupInfoData {
            cell.setCell(groupInfoData: (data.users[indexPath.row]), index: indexPath.row, dateData: dateConverter(dateData: data.users[indexPath.row].wakeUpTime))
            
        }
        
        print(indexPath.row)
        return cell
        
    }
}


//MARK: - APIService extension

extension APIService {
    
    func groupInfo(token: String, groupid: Int, completion: @escaping (NetworkResult<GroupInfoData>)->(Void)) {
        let target: APITarget = .groupEdit(token: token, groupid: groupid)
        judgeObject(target, completion: completion)
    }
}
