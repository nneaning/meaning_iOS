//
//  CalendarCell.swift
//  meaning
//
//  Created by 김민희 on 2021/01/12.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    static let identifier: String = "CalendarCell"
    
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        dateLabel.font = UIFont.spoqaRegular(size: 10)
        dateLabel.textColor = .meaningIvory
    }
    
    func setCell(_ caledarData: CalendarData) {
        dateLabel.text = "\(caledarData.dateIndex)"
        starImage.image = caledarData.starImage
    }
    
}
