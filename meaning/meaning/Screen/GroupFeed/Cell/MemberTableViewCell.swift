//
//  MemberTableViewCell.swift
//  meaning
//
//  Created by Seri Park on 2021/01/07.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    static let identifier = "MemberTableViewCell"

    
    @IBOutlet var circleView: UIView!
    @IBOutlet var lastNameLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var wakeUpTimeView: UIView!
    @IBOutlet var wakeUpTimeLabel: UILabel!
    @IBOutlet weak var wakeupViewWidth: NSLayoutConstraint!
    
    @IBOutlet var howLongLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


extension MemberTableViewCell {
    
    func setLayout() {
        //cell layout 설정
        circleView.setRounded(radius: nil)
        
        wakeUpTimeView.setRounded(radius: 13.5)
        wakeUpTimeView.backgroundColor = .none
        wakeUpTimeView.setBorder(borderColor: .skyBlue, borderWidth: 1)
        
        wakeUpTimeLabel.text = "매일 오전 5시 기상"
        wakeUpTimeLabel.font = UIFont.notoMedium(size: 10)
        wakeUpTimeLabel.textColor = UIColor.skyBlue
        wakeUpTimeLabel.lineSetting(kernValue: -0.4)
        
        nameLabel.font = UIFont.spoqaMedium(size: 14)
        nameLabel.textColor = UIColor.gray1
        nameLabel.lineSetting(kernValue: -0.56)
        
        howLongLabel.font = UIFont.spoqaRegular(size: 14)
        howLongLabel.textColor = UIColor.gray2
        howLongLabel.lineSetting(kernValue: -0.56)
        
    }
    
    func setCell(groupInfoData: Users, index: Int) {
        
        //홀수 번째, 짝수 번째 원 다른 색상
            if (index % 2 == 0) {
                circleView.layer.backgroundColor = UIColor.meaningLightblue.cgColor
                lastNameLabel.font = UIFont.spoqaRegular(size: 18)
                lastNameLabel.textColor = UIColor.meaningNavy
                lastNameLabel.lineSetting(kernValue: -0.72)
            } else {
                circleView.layer.backgroundColor = UIColor.meaningNavy.cgColor
                lastNameLabel.font = UIFont.spoqaRegular(size: 18)
                lastNameLabel.textColor = UIColor.meaningWhite
                lastNameLabel.lineSetting(kernValue: -0.72)
            }
        
        //이름의 첫번째 글자만 따오기
        let name = groupInfoData.userName
        let first = name[name.startIndex]
        lastNameLabel.text = "\(first)"
        
        nameLabel.text = groupInfoData.userName
        howLongLabel.text = "\(groupInfoData.dayPassed)일째 진행 중"
        wakeUpTimeLabel.text = "매일 \(groupInfoData.wakeUpTime) 기상"
        
        if wakeUpTimeLabel.text?.count == 11 {
            // 정각일때
            wakeupViewWidth.constant = 90
        } else {
            wakeupViewWidth.constant = 150
        }
        
    }
}

