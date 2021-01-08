//
//  MissionCardCell.swift
//  meaning
//
//  Created by 김민희 on 2021/01/06.
//

import UIKit

class MissionCardCell: UICollectionViewCell {
    static let identifier: String = "MissionCardCell"
    
    @IBOutlet weak var mentCenter: NSLayoutConstraint!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var mentLabel: UILabel!
    
    override func awakeFromNib() {
        circleView.backgroundColor = .none
        circleView.setRounded(radius: nil)
        circleView.setBorder(borderColor: .white, borderWidth: 1)
        
        cardImage.setRounded(radius: 10)
        
        indexLabel.font = UIFont.spoqaLight(size: 30)
        indexLabel.textColor = .white
        
        mentLabel.font = UIFont.spoqaRegular(size: 20)
        mentLabel.textColor = .white
        mentLabel.numberOfLines = 0
    }
    
    func setCard(_ missionCard: MissionCard, safeArea: Int) {
        cardImage.image = missionCard.missionImage
        indexLabel.text = "\(missionCard.missionIndex)"
        mentLabel.text = missionCard.missonMent
        mentLabel.lineSetting(kernValue: -0.10, lineSpacing: 10)
        if safeArea == 0 {
            // 홈버튼 있을때는 멘트를 가운데보다 아래로 내려주기
            mentCenter.constant = 15
        }
        
    }
    
    
    
}
