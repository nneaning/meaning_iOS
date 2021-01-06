//
//  MissionCardCell.swift
//  meaning
//
//  Created by 김민희 on 2021/01/06.
//

import UIKit

class MissionCardCell: UICollectionViewCell {
    static let identifier: String = "MissionCardCell"
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var mentLabel: UILabel!
    
    override func awakeFromNib() {
        circleView.backgroundColor = .none
        circleView.setRounded(radius: nil)
        circleView.setBorder(borderColor: .white, borderWidth: 1)
        
        indexLabel.font = UIFont.spoqaLight(size: 30)
        indexLabel.textColor = .white
        
        mentLabel.font = UIFont.spoqaRegular(size: 20)
        mentLabel.textColor = .white
    }
    
    func setCard(_ missionCard: MissionCard) {
        cardImage.image = missionCard.missionImage
        indexLabel.text = "\(missionCard.missionIndex)"
        mentLabel.text = missionCard.missonMent
        
    }
    
    
    
}
