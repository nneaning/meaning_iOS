//
//  PhotoCheckVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/03.
//

import UIKit

class PhotoCheckVC: UIViewController {
    
    // MARK: Variable Part
    
    var photoImage: UIImage?
    var photoTime: String?
    var photoDate: String?
    // TimeStampVC 에서 받아와야 하는 데이터들(사진,시간)

    // MARK: IBOutlet
    
    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var stampImage: UIImageView!
    @IBOutlet weak var stampTimeLabel: UILabel!
    @IBOutlet weak var stampBorderView: UIView!
    @IBOutlet weak var stampDateLabel: UILabel!
    @IBOutlet weak var stampLogoImage: UIImageView!
    
    @IBOutlet weak var retakeButton: UIButton!
    @IBOutlet weak var useButton: UIButton!
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCameraView()
        setButton()
    }

}

// MARK: Extension

extension PhotoCheckVC {
    
    // MARK: Function
    
    func setCameraView() {
        // 카메라 뷰 Style Setting
        stampBorderView.setBorder(borderColor: .white, borderWidth: 1)
        stampBorderView.backgroundColor = .none
        
        stampTimeLabel.font = UIFont.nsLight(size: 70)
        stampTimeLabel.textColor = .white
        stampDateLabel.font = UIFont.spoqaRegular(size: 16)
        stampDateLabel.textColor = .white
        
        if let photoImage = photoImage,
           let photoTime = photoTime,
           let photoDate = photoDate {
            // 이전 뷰에서 넘겨온 값들 넣어주기
            stampImage.image = photoImage
            stampTimeLabel.text = photoTime
            stampDateLabel.text = photoDate
        }
        
        stampLogoImage.image = UIImage(named: "cameraTimestampLogo")
    }
    
    func setButton() {
        // 버튼 Style Setting
        retakeButton.setTitle("다시 찍기", for: .normal)
        retakeButton.titleLabel?.font = UIFont.spoqaRegular(size: 17)
        retakeButton.tintColor = .white
        
        useButton.setTitle("사진 사용", for: .normal)
        useButton.titleLabel?.font = UIFont.spoqaRegular(size: 17)
        useButton.tintColor = .white
    }
    
}
