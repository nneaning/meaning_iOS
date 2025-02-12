//
//  GroupTableViewCell.swift
//  meaning
//
//  Created by Seri Park on 2021/01/04.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    static let identifier = "GroupTableViewCell"
    
    @IBOutlet var groupName: UILabel!
    @IBOutlet var numberView: UIView!
    @IBOutlet var peopleCountLabel: UILabel!
    @IBOutlet var lineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension GroupTableViewCell {
   
    func setLayout() {
        groupName.font = UIFont.spoqaRegular(size: 16)
        groupName.textColor = UIColor.gray2
        
        numberView.backgroundColor = UIColor.gray6
        numberView.layer.cornerRadius = 5.0
        
        peopleCountLabel.font = UIFont.spoqaMedium(size: 13)
        peopleCountLabel.textColor = UIColor.meaningNavy
        
        lineView.backgroundColor = .gray4
    }
}
