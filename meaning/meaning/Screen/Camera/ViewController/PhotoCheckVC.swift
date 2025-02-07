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
    var rootView: String?
    var timeToServer: String? // 서버에다 줄 사진 찍은 시간
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
    
    // MARK: IBAction
    
    @IBAction func retakeButtonDidTap(_ sender: Any) {
        // 다시 찍기 버튼 클릭 시
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func useButtonDidTap(_ sender: Any) {
        // 사진 사용 버튼 클릭 시
        
        // 갤러리에 사진 저장
        UIImageWriteToSavedPhotosAlbum(frameView.snapShot(), self, #selector(finishSaving(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
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
        
        if rootView == nil {
            useButton.setTitle("사진 저장", for: .normal)
        } else {
            useButton.setTitle("사진 사용", for: .normal)
        }
        
        useButton.titleLabel?.font = UIFont.spoqaRegular(size: 17)
        useButton.tintColor = .white
    }
    
    @objc func finishSaving(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
    //사진 저장버튼을 클릭해 갤러리에 저장이 끝났을 때
        
           if let error = error {
            // 갤러리 저장 에러가 났을 경우(ex.사용자가 엑세스 허용을 안했을 때)
            print(error.localizedDescription)
           } else { // 저장이 잘 됐을 때
            // toast 띄우기
            self.showToast(message: "갤러리에 사진이 저장되었습니다", font: UIFont.spoqaRegular(size: 13), width: 188, bottomY: 181)
            
            // toast 사라지면 다음 뷰로 넘어가기
            Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(goNextView), userInfo: nil, repeats: false)
           }
    }
    
    @objc func goNextView() {
        // 시작뷰에 따라 가는 곳을 다르게 설정
        if rootView == nil {
            // 탭바에서 왔다면?
            self.presentingViewController?.dismiss(animated: true)
        } else {
            // 카드에서 왔다면?
            let missionStoryboard = UIStoryboard.init(name: "Mission", bundle: nil)
            guard let uploadVC = missionStoryboard.instantiateViewController(identifier: "PictureUploadVC") as? PictureUploadVC
            else {
                return
            }
            uploadVC.uploadedImageData = frameView.snapShot()
            uploadVC.timeToServer = timeToServer
            self.navigationController?.pushViewController(uploadVC, animated: true)
        }
        
    }
}
