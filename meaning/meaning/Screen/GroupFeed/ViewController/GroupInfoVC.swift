//
//  GroupInfoVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/06.
//

import UIKit

class GroupInfoVC: ViewController {
    
    // MARK: - Variable Part
    
    var groupName: String = "서울 대학생 아침인증 그룹"
    var groupBirthDate: String = "2020.12.26"
    
    var member: [MemberInfo] = []
    
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
        setMemberData()
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
        
        groupNameLabel.text = "\(groupName)"
        groupNameLabel.font = UIFont.spoqaMedium(size: 20)
        groupNameLabel.textColor = UIColor.gray1
        groupNameLabel.lineSetting(kernValue: -0.8)
        
        groupBirthLabel.text = "그룹 생성일: \(groupBirthDate)"
        groupBirthLabel.font = UIFont.spoqaMedium(size: 15)
        groupBirthLabel.textColor = UIColor.gray3
        groupBirthLabel.lineSetting(kernValue: -0.6)
        
        if let birthLabel = groupBirthLabel.text {
            // 날짜 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: groupBirthLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaRegular(size: 15), range: (birthLabel as NSString).range(of: " \(groupBirthDate)"))
            
            groupBirthLabel.attributedText = attributedStr
        }
        
        memberCountLabel.text = "그룹 멤버 수 : \(member.count)명"
        memberCountLabel.font = UIFont.spoqaMedium(size: 15)
        memberCountLabel.textColor = UIColor.gray3
        memberCountLabel.lineSetting(kernValue: -0.6)
        
        
        if let text = memberCountLabel.text {
            // "\(group.peopleCount)명" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: memberCountLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                       value: UIFont.spoqaRegular(size: 13), range: (text as NSString).range(of: "\(member.count)명"))
            
            memberCountLabel.attributedText = attributedStr
        }
        
        memberLabel.text = "멤버"
        memberLabel.font = UIFont.spoqaMedium(size: 18)
        memberLabel.textColor = UIColor.gray2
    }
    
    func setMemberData() {
        member.append(contentsOf: [
            MemberInfo(memberName: "김재민", wakeUpTime: "오전 5시", howLong: 3),
            MemberInfo(memberName: "김재민", wakeUpTime: "오전 5시", howLong: 3),
            MemberInfo(memberName: "김재민", wakeUpTime: "오전 5시", howLong: 3),
            MemberInfo(memberName: "김재민", wakeUpTime: "오전 5시", howLong: 3),
            MemberInfo(memberName: "김재민", wakeUpTime: "오전 5시", howLong: 3)
        ])
    }

}

extension GroupInfoVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return member.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //tableView의 IndexPath 별 Cell 지정
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemberTableViewCell.identifier)
                as? MemberTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.setCell(memberInfo: member[indexPath.row], index: indexPath.row)
        return cell
    }
}


