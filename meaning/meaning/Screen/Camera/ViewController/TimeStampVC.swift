//
//  TimeStampVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/02.
//

import UIKit
import AVFoundation

class TimeStampVC: UIViewController {

    // MARK: Variable Part
    
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
        
        stampTimeLabel.font = UIFont.nsLight(size: 70)
        stampTimeLabel.textColor = .white
        stampDateLabel.font = UIFont.spoqaRegular(size: 16)
        stampDateLabel.textColor = .white
        getNowLabel()
        
        // 뷰 안에 들어와있을 때도 시간이 가면 label을 바뀌게 해주기위해 Timer 사용
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(getNowLabel), userInfo: nil, repeats: true)
        
        stampLogoImage.image = UIImage(named: "cameraTimestampLogo")
        
        cancleButton.setTitle("취소", for: .normal)
        cancleButton.titleLabel?.font = UIFont.spoqaRegular(size: 17)
        cancleButton.tintColor = .white
    }
    
    @objc func getNowLabel() {
        // 현재 시간을 기반으로 time과 날짜를 label에 넣어줌
        stampTimeLabel.text = Date().datePickerToString().recordTime()
        stampDateLabel.text = Date().datePickerToString().recordDate() + " (\(Date().weekDay()))"
    }
}
