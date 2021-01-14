//
//  GroupCell.swift
//  meaning
//
//  Created by Seri Park on 2021/01/04.
//

import UIKit

class GroupCollectionCell: UICollectionViewCell {
    static let identifier = "GroupCell"
    
    
    @IBOutlet var groupImg: UIImageView!
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var peopleCountLabel: UILabel!
    @IBOutlet var enterLabel: UILabel!
    
    
    func setCell() {
        //셀 데이터 설정
        groupNameLabel.font = UIFont.spoqaMedium(size: 15)
        groupNameLabel.textColor = UIColor.meaningWhite
        
        peopleCountLabel.font = UIFont.spoqaRegular(size: 13)
        peopleCountLabel.textColor = UIColor.gray3
        
        
        enterLabel.text = "지금 참여하기 >"
        enterLabel.textColor = UIColor.gray2
        enterLabel.font = UIFont.spoqaRegular(size: 12)
    }
}
