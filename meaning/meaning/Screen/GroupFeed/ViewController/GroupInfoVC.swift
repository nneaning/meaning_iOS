//
//  GroupInfoVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/06.
//

import UIKit

class GroupInfoVC: ViewController {
    
//    var groupName: String = "서울 대학생 아침인증 그룹"
//    var groupBirthDate: String = "2020.12.26"
//    var memberCount: [Int] = 1
    
    //MARK: - IBOutlet
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var groupSettingLabel: UILabel!
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var groupBirthLabel: UILabel!
    @IBOutlet var memberCountLabel: UILabel!
    
    
    //MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeader()

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

        groupNameLabel.text = "서울 대학생 아침인증 그룹"
        groupNameLabel.font = UIFont.spoqaMedium(size: 20)
        groupNameLabel.textColor = UIColor.gray1
        groupNameLabel.lineSetting(kernValue: -0.8)

        groupBirthLabel.text = "그룹 생성일: 2020.02.02"
        groupBirthLabel.font = UIFont.spoqaMedium(size: 15)
        groupBirthLabel.textColor = UIColor.gray3
        groupBirthLabel.lineSetting(kernValue: -0.6)

        if let birthLabel = groupBirthLabel.text {
            // 날짜 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: groupBirthLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaRegular(size: 15), range: (birthLabel as NSString).range(of: " 2020.02.02"))

            groupBirthLabel.attributedText = attributedStr
        }
        
        memberCountLabel.text = "그룹 멤버 수 : 2명"
        memberCountLabel.font = UIFont.spoqaMedium(size: 15)
        memberCountLabel.textColor = UIColor.gray3
        memberCountLabel.lineSetting(kernValue: -0.6)
        

        if let text = memberCountLabel.text {
            // "\(group.peopleCount)명" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: memberCountLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                       value: UIFont.spoqaRegular(size: 13), range: (text as NSString).range(of: "2명"))

            memberCountLabel.attributedText = attributedStr
        }
    
        
    }
}
