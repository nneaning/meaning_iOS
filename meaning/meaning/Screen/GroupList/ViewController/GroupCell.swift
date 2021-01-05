//
//  GroupCell.swift
//  meaning
//
//  Created by Seri Park on 2021/01/04.
//

import UIKit

class GroupCell: UICollectionViewCell {
    static let identifier = "GroupCell"
    
    
    @IBOutlet var groupImg: UIImageView!
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var peopleCountLabel: UILabel!
    @IBOutlet var enterBtn: UIButton!
    
    
    func setCell(group: Group) {
        //셀 데이터 설정
        groupImg.image = group.makeImage()
        
        groupNameLabel.text = group.groupName
        groupNameLabel.font = UIFont.spoqaMedium(size: 24)
        groupNameLabel.textColor = UIColor.meaningWhite
        
        peopleCountLabel.text = "\(group.peopleCount)명이 함께하고 있어요."
        peopleCountLabel.font = UIFont.spoqaRegular(size: 13)
        peopleCountLabel.textColor = UIColor.gray3
        
        if let text = peopleCountLabel.text {
            // "\(group.peopleCount)명" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: peopleCountLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String),
                                       value: UIFont.spoqaBold(size: 13), range: (text as NSString).range(of: "\(group.peopleCount)명"))
            attributedStr.addAttribute(.foregroundColor, value: UIColor.meaningNavy, range: (peopleCountLabel.text! as NSString).range(of: "\(group.peopleCount)명"))
            peopleCountLabel.attributedText = attributedStr
            
            enterBtn.setTitle("지금 참여하기 >", for: .normal)
            enterBtn.setTitleColor(UIColor.gray2, for: .normal)
            enterBtn.titleLabel!.font = UIFont.spoqaRegular(size: 12)
        }
    }
}
