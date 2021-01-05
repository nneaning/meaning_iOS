//
//  GroupDetailVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/05.
//

import UIKit

class GroupDetailVC: ViewController {

    @IBOutlet var popUpBox: UIView!
    
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var closeBtn: UIButton!
    
    @IBOutlet var groupInfoBox: UIView!
    @IBOutlet var groupInfoLabel: UILabel!
    
    @IBOutlet var participantLabel: UILabel!
    @IBOutlet var peopleNumberLabel: UILabel!
    @IBOutlet var groupJoinBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBox()
        setLabel()
        setButton()
    }
    

}

extension GroupDetailVC {
    
    func setBox() {
        popUpBox.layer.cornerRadius = 5.0
        
        groupInfoBox.layer.cornerRadius = 5.0
        groupInfoBox.layer.backgroundColor = UIColor.meaningIvory.cgColor
        groupInfoBox.layer.borderColor = UIColor.gray5.cgColor
        groupInfoBox.layer.borderWidth = 1.0
    }
    
    func setLabel() {
        //라벨 폰트, 색상 설정
        groupNameLabel.text = "코테 준비생 아침인증 그룹"
        groupNameLabel.font = UIFont.notoBold(size: 18)
        groupNameLabel.textColor = UIColor.gray2
        groupNameLabel.lineSetting(kernValue: -0.54, lineSpacing: 10)
        
        groupInfoLabel.text = "취준생끼리 개발 습관 만들어요"
        groupInfoLabel.font = UIFont.notoRegular(size: 16)
        groupInfoLabel.textColor = UIColor.gray2
        groupNameLabel.lineSetting(kernValue: -0.48, lineSpacing: 10)

        participantLabel.text = "참가 인원"
        participantLabel.font = UIFont.spoqaMedium(size: 14)
        participantLabel.textColor = UIColor.gray3
        groupNameLabel.lineSetting(kernValue: -0.56, lineSpacing: 10)
        
        peopleNumberLabel.text = "2/5"
        peopleNumberLabel.font = UIFont.spoqaMedium(size: 14)
        peopleNumberLabel.textColor = UIColor.meaningNavy
        
        // 앞에 숫자 부분에만 색상 다르게 설정
        if let text = peopleNumberLabel.text {
            let attributedStr = NSMutableAttributedString(string: peopleNumberLabel.text ?? "")
            attributedStr.addAttribute(.foregroundColor, value: UIColor.skyBlue, range: (peopleNumberLabel.text! as NSString).range(of: "2"))
            peopleNumberLabel.attributedText = attributedStr
        }
    }
    
    func setButton() {
        //버튼 폰트, 색상 설정
        groupJoinBtn.layer.cornerRadius = 5.0
        groupJoinBtn.backgroundColor = UIColor.meaningNavy
        groupJoinBtn.setTitle("그룹 참가하기", for: .normal)
        groupJoinBtn.titleLabel?.font = UIFont.spoqaMedium(size: 15)
        groupJoinBtn.setTitleColor(UIColor.meaningWhite, for: .normal)
    }
    
}
