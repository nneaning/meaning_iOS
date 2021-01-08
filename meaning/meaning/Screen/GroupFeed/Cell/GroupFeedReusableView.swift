//
//  GroupFeedReusableView.swift
//  meaning
//
//  Created by 김민희 on 2021/01/09.
//

import UIKit

class GroupFeedReusableView: UICollectionReusableView {
    
    @IBOutlet weak var sloganView: UIView!
    @IBOutlet weak var sloganLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setHeader()
    }
    
    func setHeader() {
        sloganView.backgroundColor = .meaningLightblue
        sloganLabel.font = UIFont.spoqaMedium(size: 14)
        sloganLabel.textColor = UIColor.meaningNavy
        sloganLabel.text = "5명의 사람들이 함께 아침을 맞이하고 있어요!"
    }
    
    func setMent(count: Int) {
        sloganLabel.text = "\(count)명의 사람들이 함께 아침을 맞이하고 있어요!"
    }
        
}
