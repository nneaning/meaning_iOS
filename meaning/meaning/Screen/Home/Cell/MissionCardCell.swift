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
    @IBOutlet weak var clickImage: UIImageView!
    @IBOutlet weak var checkImage: UIImageView!
    
    @IBOutlet weak var endView: UIView!
    
    
    override func awakeFromNib() {
        
        circleView.backgroundColor = .none
        
        cardImage.setRounded(radius: 10)
        
        endView.setRounded(radius: 10)
        
        indexLabel.font = UIFont.spoqaLight(size: 30)
        indexLabel.textColor = .white
        
        mentLabel.textColor = .white
        mentLabel.numberOfLines = 0
        
    }
    
    func setCard(_ missionCard: MissionCard, safeArea: Int) {
        // 아직 미션 완료가 안됐을시
        
        circleView.setRounded(radius: nil)
        circleView.setBorder(borderColor: .white, borderWidth: 1)
        
        checkImage.isHidden = true
        endView.isHidden = true
        indexLabel.isHidden = false
        clickImage.isHidden = false
        
        cardImage.image = missionCard.missionImage
        indexLabel.text = "\(missionCard.missionIndex)"
        mentLabel.text = missionCard.missonMent
        mentLabel.font = UIFont.spoqaRegular(size: 20)
        mentLabel.lineSetting(kernValue: -0.10, lineSpacing: 10)
        

        if safeArea == 49 {
            // 홈버튼 있을때는 멘트를 가운데보다 아래로 내려주기
            mentCenter.constant = 15
        } else {
            mentCenter.constant = -15
        }
    }
    
    func setEndCard(_ missionCard: MissionCard, safeArea: Int) {
        // 미션 완료시

        circleView.setBorder(borderColor: .none, borderWidth: 0)
        
        checkImage.isHidden = false
        endView.isHidden = false
        indexLabel.isHidden = true
        clickImage.isHidden = true
        
        cardImage.image = missionCard.missionImage
        mentLabel.text = "미션 완료"
        mentLabel.font = UIFont.notoLight(size: 34)
        
        mentCenter.constant = 15
    }
    
    
    
}
