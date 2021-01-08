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

        wakeUpTimeView.setRounded(radius: 10)
        wakeUpTimeView.setBorder(borderColor: UIColor.skyBlue, borderWidth: 1.0)
        
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
    
    func setCell(memberInfo: MemberInfo, index: Int) {
        
        //홀수 번째, 짝수 번째 원 다른 색상
        for i in 0...index {
            if (i % 2 == 0) {
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
        }
        
        //이름의 첫번째 글자만 따오기
        let name = memberInfo.memberName
        let first = name[name.startIndex]
        lastNameLabel.text = "\(first)"
        
        nameLabel.text = memberInfo.memberName
        wakeUpTimeLabel.text = "매일 \(memberInfo.wakeUpTime) 기상"
        howLongLabel.text = "\(memberInfo.howLong)일째 진행 중"
        
    }
}
