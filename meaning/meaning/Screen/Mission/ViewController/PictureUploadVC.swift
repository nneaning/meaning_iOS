//
//  PictureUploadVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/06.
//

import UIKit

class PictureUploadVC: UIViewController {
    
    // MARK: Variable Part

    var userNick: String = "이름"
    var nthMorning: Int = 22
    
    // Mark: IBOutlet

    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var bodyUpperLabel: UILabel!
    @IBOutlet var uploadedImage: UIImageView!
    
    @IBOutlet var bodyBottomLabel: UILabel!
    @IBOutlet var uploadBtn: UIButton!
    
    // Mark: Life Cycle Part

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()

    }
    
    // MARK: Layout
    
    func setLayout() {
        self.view.backgroundColor = UIColor.meaningLightblue
        self.headerView.backgroundColor = UIColor.meaningLightblue
        self.headerLabel.font = UIFont.notoMedium(size: 17.0)
        self.headerLabel.text = "기상 인증"
        self.headerLabel.textColor = UIColor.gray1

        self.bodyUpperLabel.font = UIFont.notoRegular(size: 18.0)
        self.bodyUpperLabel.textColor = UIColor.gray2
        self.bodyUpperLabel.text = "\(userNick)님의 미라클 모닝을\n꾸준히 기록해 보아요"
        self.bodyUpperLabel.lineSetting(kernValue: -0.72, lineSpacing: 5)
        
        self.uploadedImage.setRounded(radius: 6)
        
        self.bodyBottomLabel.font = UIFont.notoRegular(size: 16.0)
        self.bodyBottomLabel.textColor = UIColor.gray2
        self.bodyBottomLabel.text = "\(userNick)님의 \(nthMorning)번째 의미있는 아침"
        self.bodyBottomLabel.lineSetting(kernValue: -0.5)
        
        self.uploadBtn.backgroundColor = UIColor.meaningNavy
        self.uploadBtn.setTitleColor(.meaningWhite, for: .normal)
        self.uploadBtn.titleLabel?.font=UIFont.spoqaMedium(size: 16)
        self.uploadBtn.titleLabel?.lineSetting(kernValue: -0.64)
        self.uploadBtn.setTitle("그룹에 사진올리기", for: .normal)
        self.uploadBtn.setRounded(radius: 6)
    }
  

}
