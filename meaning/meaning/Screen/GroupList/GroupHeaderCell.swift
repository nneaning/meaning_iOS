//
//  GroupHeaderCell.swift
//  meaning
//
//  Created by Seri Park on 2021/01/04.
//

import UIKit

class GroupHeaderCell: UICollectionViewCell {
    static let identifier = "GroupHeaderCell"
    
    @IBOutlet var otherGroupLabel: UILabel!
    
    func setLabel() {
        otherGroupLabel.text = "다른 그룹 구경하기"
        otherGroupLabel.font = UIFont.spoqaMedium(size: 18)
        otherGroupLabel.backgroundColor = UIColor.gray1
    }
}
