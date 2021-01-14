//
//  PictureUploadVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/06.
//

import UIKit

class PictureUploadVC: UIViewController {
    
    // MARK: Variable Part
    
    var userNick: String = UserDefaults.standard.string(forKey: "userNick")!
    var nthMorning: Int = 5
    var uploadedImageData: UIImage? // 서버에다 줄 사진
    var timeToServer: String? // 서버에다 줄 사진 찍을 시간
    var placeholder = "게시물을 등록하고 나의 일상을 기록해보세요."
    
    
    // Mark: IBOutlet
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var bodyUpperLabel: UILabel!
    @IBOutlet var uploadedImage: UIImageView!
    
    @IBOutlet var bodyBottomView: UIView!
    @IBOutlet var bodyTextView: UITextView!
    
    @IBOutlet var uploadBtn: UIButton!
    
    @IBOutlet var upperLabelTopConstraint: NSLayoutConstraint!
    @IBOutlet var upperLabelBottomConstraint: NSLayoutConstraint!
    @IBOutlet var uploadBtnBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet var characterLimit: UILabel!
    
    // MARK: IBAction
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func uploadBtnPressed(_ sender: Any) {
        // 사진 업로드 버튼 클릭 시
        
        if let timeToServer = timeToServer,
           let uploadedImageData = uploadedImageData {
            // 서버 통신
            uploadPictrue(UserDefaults.standard.string(forKey: "accesstoken")!, timeToServer, bodyTextView.text, uploadedImageData)
        }
        
    }
    
    
    // Mark: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        updateGroup(UserDefaults.standard.string(forKey: "accesstoken")!)
        placeholderSetting()
        
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
        bodyUpperLabel.numberOfLines = 0
        bodyUpperLabel.lineSetting(kernValue: -0.72, lineSpacing: 5)
        
        uploadedImage.setRounded(radius: 6)
        uploadedImage.image = uploadedImageData
        bodyTextView.font = UIFont.notoRegular(size: 15.0)
        bodyTextView.textColor = UIColor.gray2
        bodyTextView.lineSetting(kernValue: -0.6)
        bodyTextView.delegate = self
        
        bodyBottomView.setRounded(radius: 6)
        bodyBottomView.backgroundColor = UIColor.meaningIvory
        bodyTextView.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        self.characterLimit.font = UIFont.notoMedium(size: 15)
        self.characterLimit.textColor = UIColor.gray7
        self.characterLimit.text = "0/100"
        
        uploadBtn.backgroundColor = UIColor.meaningNavy
        uploadBtn.setTitleColor(.meaningWhite, for: .normal)
        uploadBtn.titleLabel?.font = UIFont.spoqaMedium(size: 16)
        uploadBtn.titleLabel?.lineSetting(kernValue: -0.64)
        uploadBtn.setTitle("마이피드에 사진올리기", for: .normal)
        uploadBtn.setRounded(radius: 6)
        
        print(view.frame.height)
        //SE의 경우에는 constraint 조정
        if (view.frame.height <= 667) {
            uploadBtnBottomConstraint.constant = 20
            upperLabelTopConstraint.constant = 13
            upperLabelBottomConstraint.constant = 13
        } else if (view.frame.height <= 812) {
            upperLabelTopConstraint.constant = 25
            upperLabelBottomConstraint.constant = 25
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
                NotificationCenter.default.post(name: .clearMissionOne, object: nil)
            // clearMissionOne에 해당 되는 것들은 처리 하라고 보냄
            
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func updateGroup(_ token: String) {
        APIService.shared.myGroup(token) { [self] result in
            switch result {
            case .success(_):
                uploadBtn.setTitle("그룹에 사진 올리기", for: .normal)
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
    
    //디폴트 placeholder 지정
    func placeholderSetting(){
        bodyTextView.delegate = self
        bodyTextView.text = placeholder
        bodyTextView.lineSetting(kernValue: -0.9, lineSpacing: 10)
        bodyTextView.textColor = UIColor.gray3
        bodyTextView.font = UIFont.spoqaRegular(size: 16)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholder {
            textView.text = nil
            textView.textColor = UIColor.gray1
        }
    }
    
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = placeholder
            textView.textColor = UIColor.lightGray
        }
    }
    // 글자수 체크 기능, 100자 까지만 제한
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText string: String) -> Bool{
        if(textView == bodyTextView){
            let strLength = textView.text?.count ?? 0
            let lengthToAdd = string.count
            let lengthCount = strLength + lengthToAdd
            self.characterLimit.text = "\(lengthCount)/100"
            return lengthCount < 100
        }
        return true
    }
}
