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
    @IBOutlet var enterBtn: UIButton!
    
    
    func setCell() {
        //셀 데이터 설정
        groupNameLabel.font = UIFont.spoqaMedium(size: 15)
        groupNameLabel.textColor = UIColor.meaningWhite
        
        peopleCountLabel.font = UIFont.spoqaRegular(size: 13)
        peopleCountLabel.textColor = UIColor.gray3
        
        
        enterBtn.setTitle("지금 참여하기 >", for: .normal)
        enterBtn.setTitleColor(UIColor.gray2, for: .normal)
        enterBtn.titleLabel!.font = UIFont.spoqaRegular(size: 12)
    }
}
