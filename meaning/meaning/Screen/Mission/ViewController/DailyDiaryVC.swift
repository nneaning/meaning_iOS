//
//  DailyDiaryVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/03.
//

import UIKit

class DailyDiaryVC: UIViewController {
    
    // MARK: Variable Part
    
    var placeholderPhrase = "나만 볼 수 있는 자기 회고 및 감사 일기를 써보세요!\n기분 좋은 아침을 시작하게 될 거예요."
    var dailydiaryData: DailydiaryData?
    
    // MARK: IBOutlet
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var bodyUpperLabel: UILabel!
    @IBOutlet var bodyView: UIView!
    @IBOutlet var bodyTextView: UITextView!
    
    @IBOutlet var characterLimit: UILabel!
    @IBOutlet var RegisterBtn: UIButton!
    
    // MARK: IBAction
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        if (bodyTextView.text.isEmpty || bodyTextView.text == placeholderPhrase) {
            self.showToast(message: "내용을 입력해주세요", font: UIFont.spoqaRegular(size: 16))
        } else {
            if let bodyText = bodyTextView.text {
                dailydiary(token: (UserDefaults.standard.string(forKey: "accesstoken")!), diaryContents: bodyText)
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        placeholderSetting()
        
    }
    
    // MARK: Layout
    
    func setLayout() {
        self.view.backgroundColor = UIColor.meaningLightblue
        self.headerView.backgroundColor = UIColor.meaningLightblue
        self.headerLabel.font = UIFont.notoMedium(size: 17.0)
        self.headerLabel.text = "회고 일기"
        self.headerLabel.textColor = UIColor.gray1
        
        self.bodyUpperLabel.font = UIFont.notoRegular(size: 18.0)
        self.bodyUpperLabel.textColor = UIColor.gray2
        self.bodyUpperLabel.text = "오늘 아침을 글로 남겨봐요"
        self.bodyUpperLabel.lineSetting(kernValue: -0.72)
        
        self.bodyView.setRounded(radius: 6)
        self.bodyView.backgroundColor = UIColor.meaningIvory
        self.bodyTextView.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        self.characterLimit.font = UIFont.notoMedium(size: 15)
        self.characterLimit.textColor = UIColor.gray7
        self.characterLimit.text = "0/200"
        
        self.RegisterBtn.backgroundColor = UIColor.meaningNavy
        self.RegisterBtn.setTitleColor(UIColor.meaningWhite, for: .normal)
        self.RegisterBtn.titleLabel?.font=UIFont.spoqaMedium(size: 16)
        self.RegisterBtn.setTitle("등록하기", for: .normal)
        self.RegisterBtn.setRounded(radius: 6)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 뷰 클릭 시 키보드 내리기
        view.endEditing(true)
    }
    
    func dailydiary(token: String, diaryContents: String){
        APIService.shared.dailydiary(token, diaryContents) {
            result in
            switch result {
            case .success(_):
                // 나중에 dailyDiaryId 가 필요할 시에 사용하기 위해 적어두었습니다!
                //self.dailydiaryData = data
                
                // 성공시 tabbar로 돌아가기
                self.navigationController?.popToRootViewController(animated: true)
                // 미션 완료 처리
                UserDefaults.standard.setValue(true, forKey: "card2")
                
            case .failure(let error):
                if (error == 400) {
                    // 입력 값이 없습니다
                    self.showToast(message: "내용을 입력해주세요.", font: UIFont.spoqaRegular(size: 16))
                } else if (error == 401) {
                    // 토큰 만료, 다시 로그인 필요
                    self.showToast(message: "재접속 해주세요!", font: UIFont.spoqaRegular(size: 16))
                    self.navigationController?.popToRootViewController(animated: true)
                    
                } else { // 500 : 서버 내부 오류
                    self.showToast(message: "네트워크 끊김", font: UIFont.spoqaRegular(size: 16))
                }
                
            }
        }
    }
}

// MARK: Extension

extension DailyDiaryVC: UITextViewDelegate {
    
    // MARK: Function
    
    //디폴트 placeholder 지정
    func placeholderSetting(){
        bodyTextView.delegate = self
        bodyTextView.text = placeholderPhrase
        bodyTextView.lineSetting(kernValue: -0.9, lineSpacing: 10)
        bodyTextView.textColor = UIColor.gray3
        bodyTextView.font = UIFont.spoqaRegular(size: 16)
    }
    
    //편집 시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderPhrase {
            textView.text = nil
            textView.textColor = UIColor.gray1
        }
    }
    
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = placeholderPhrase
            textView.textColor = UIColor.lightGray
        }
    }
    
    // 글자수 체크 기능, 200자 까지만 제한
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText string: String) -> Bool{
        if(textView == bodyTextView){
            let strLength = textView.text?.count ?? 0
            let lengthToAdd = string.count
            let lengthCount = strLength + lengthToAdd
            self.characterLimit.text = "\(lengthCount)/200"
            return lengthCount < 200
        }
        return true
    }
}

// MARK: APIService

extension APIService {
    
    func dailydiary(_ token: String, _ diaryContents: String, completion: @escaping (NetworkResult<DailydiaryData>)->(Void)) {
        let target: APITarget = .dailydiary(token: token, diaryContents: diaryContents)
        judgeObject(target, completion: completion)
    }
}

