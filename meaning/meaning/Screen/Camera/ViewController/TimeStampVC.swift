//
//  TimeStampVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import UIKit

class TimeStampVC: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var stampBorderView: UIView!
    @IBOutlet weak var stampTimeLabel: UILabel!
    @IBOutlet weak var stampDateLabel: UILabel!
    @IBOutlet weak var stampLogoImage: UIImageView!
    
    @IBOutlet weak var cancleButton: UIButton!
    
    // MARK: Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setCameraView()
    }

}
extension TimeStampVC {
    // MARK: Function
    func setCameraView() {
        // 카메라 뷰 Style Setting
        stampBorderView.setBorder(borderColor: .white, borderWidth: 1)
        stampBorderView.backgroundColor = .none
        
        stampLogoImage.image = UIImage(named: "cameraTimestampLogo")
        
        cancleButton.setTitle("취소", for: .normal)
        cancleButton.titleLabel?.font = UIFont.spoqaRegular(size: 17)
        cancleButton.tintColor = .white
    }
}
