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
    var uploadedImageData: UIImage? // 서버에다 줄 사진
    var timeToServer: String? // 서버에다 줄 사진 찍을 시간
    
    // Mark: IBOutlet
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var bodyUpperLabel: UILabel!
    @IBOutlet var uploadedImage: UIImageView!
    
    @IBOutlet var bodyBottomView: UIView!
    @IBOutlet var bodyTextView: UITextView!
    
    @IBOutlet var editGuideLabel: UILabel!
    @IBOutlet var uploadBtn: UIButton!
    
    @IBOutlet var upperLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet var upperLabelBottomConstraint: NSLayoutConstraint!
    @IBOutlet var uploadBtnBottomConstraint: NSLayoutConstraint!
    
    
    // MARK: IBAction
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func uploadBtnPressed(_ sender: Any) {
        // 사진 업로드 버튼 클릭 시
        
        if let timeToServer = timeToServer,
           let uploadedImageData = uploadedImageData {
            // 서버 통신
            uploadPictrue("", timeToServer, bodyTextView.text, uploadedImageData)
            // 토큰 삽입 필수!(88)
        }
        
    }
    
    
    // Mark: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        
    }
    
    // MARK: Layout
    
    func setLayout() {
        view.backgroundColor = UIColor.meaningLightblue
        headerView.backgroundColor = UIColor.meaningLightblue
        headerLabel.font = UIFont.notoMedium(size: 17.0)
        headerLabel.text = "기상 인증"
        headerLabel.textColor = UIColor.gray1
        
        bodyUpperLabel.font = UIFont.notoRegular(size: 18.0)
        bodyUpperLabel.textColor = UIColor.gray2
        bodyUpperLabel.text = "\(userNick)님의 미라클 모닝을\n꾸준히 기록해 보아요"
        bodyUpperLabel.lineSetting(kernValue: -0.72, lineSpacing: 5)
        
        uploadedImage.setRounded(radius: 6)
        uploadedImage.image = uploadedImageData
        bodyTextView.font = UIFont.notoRegular(size: 15.0)
        bodyTextView.textColor = UIColor.gray2
        bodyTextView.text = "\(userNick)님의 \(nthMorning)번째 의미있는 아침"
        bodyTextView.lineSetting(kernValue: -0.6)
        bodyTextView.delegate = self
        
        bodyBottomView.setRounded(radius: 6)
        bodyBottomView.backgroundColor = UIColor.meaningIvory
        bodyTextView.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        editGuideLabel.text = "흰 화면을 눌러서 수정하세요"
        editGuideLabel.font = .spoqaRegular(size: 14)
        editGuideLabel.textColor = .gray3
        editGuideLabel.lineSetting(kernValue: -0.56)
        
        uploadBtn.backgroundColor = UIColor.meaningNavy
        uploadBtn.setTitleColor(.meaningWhite, for: .normal)
        uploadBtn.titleLabel?.font = UIFont.spoqaMedium(size: 16)
        uploadBtn.titleLabel?.lineSetting(kernValue: -0.64)
        uploadBtn.setTitle("그룹에 사진올리기", for: .normal)
        uploadBtn.setRounded(radius: 6)
        
        //SE의 경우에는 constraint 조정
        if (view.frame.height <= 667) {
            uploadBtnBottomConstraint.constant = 20
            upperLabelTopConstraint.constant = 30
            upperLabelBottomConstraint.constant = 30
            //SE는 '흰 화면을 눌러서 수정하세요' 글자 들어갈 곳이 없어 숨김처리 함
            editGuideLabel.isHidden = true
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(touchTextView), name: UIResponder.keyboardWillShowNotification, object: nil)
            // 키보드가 화면에 띄어질 때 소환
        NotificationCenter.default.addObserver(self, selector: #selector(touchDownView), name: UIResponder.keyboardWillHideNotification, object: nil)
            // 키보드가 화면에서 내려가면 소환
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 뷰 클릭 시 키보드 내리기
        view.endEditing(true)
    }
    
    func uploadPictrue(_ token: String, _ dateTime: String, _ timeStampContents: String, _ image: UIImage) {
        APIService.shared.timestamp(token, dateTime, timeStampContents, image) { [self] result in
                switch result {
                case .success( _):
                    // 성공시 Home으로 돌아가기
                    self.navigationController?.popToRootViewController(animated: true)
                    // 타임카메라 미션 완료!
                    UserDefaults.standard.setValue(true, forKey: "card0")

                case .failure(let error):
                    print(error)
                }
            }
    }
    
    @objc func touchTextView(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.view.bounds.origin.y = 140
        }
    }
    @objc func touchDownView() {
        UIView.animate(withDuration: 0.3) {
            self.view.bounds.origin.y = 0
        }
    }
    
}

// MARK: Extension

extension PictureUploadVC: UITextViewDelegate {
    
    // MARK: Function
    
    //편집 시작하면 가이드 글자가 사라지도록 해주었음
    func textViewDidBeginEditing(_ textView: UITextView) {
        editGuideLabel.isHidden = true
    }
}

extension APIService {
    
    func timestamp(_ token: String, _ dateTime: String, _ timeStampContents: String, _ image: UIImage, completion: @escaping (NetworkResult<TimestampData>)->(Void)) {
        
        let target: APITarget = .timestamp(token: token, dateTime: dateTime, timeStampContents: timeStampContents, image: image)
        judgeObject(target, completion: completion)
    }
    
}
