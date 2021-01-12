//
//  OnboardingTimeVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/05.
//

import UIKit

class OnboardingTimeVC: UIViewController {

    // MARK: Variable Part
    
    var userNick: String?
    var wakeupTime: String?
    var hours: [Int] = []
    var minutes: [String] = []
    var userHours: Int = 5
    var userMinues: String?
    var simpleData: SimpleData?
    var serverWakeUpTime: String?
    
    // MARK: IBOutlet
    
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        // 이전 뷰로 이동
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        // 서버 연결 시도
        serverWakeUpTime = "0\(userHours):\(userMinues ?? "00"):00"
        if let userNick = userNick,
           let serverWakeUpTime = serverWakeUpTime {
            UserDefaults.standard.setValue(userNick, forKey: "userNick") // 닉네임 폰에 저장
            UserDefaults.standard.setValue(serverWakeUpTime, forKey: "wakeUpTime") // 기상 시간 폰에 저장
            onboarding(token: "", nickName: userNick, wakeUpTime: serverWakeUpTime)
            // 나중에 토큰 넣어줘야함(88)
        }
        
    }
    
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setWakeDate()
        createPickerView()
    }
    

}

// MARK: Extension

extension OnboardingTimeVC {
    
    func setView() {
        // 뷰 Style Setting
        if let userNick = userNick {
            explainLabel.text = "\(userNick)님의\n목표 기상시간을 알려주세요.\n하루를 길게 쓸 수 있게\n도와 드릴게요!"
        }
        explainLabel.numberOfLines = 0
        explainLabel.font = UIFont.spoqaLight(size: 22)
        explainLabel.textColor = .meaningWhite
        explainLabel.lineSetting(kernValue: -0.66,lineSpacing: 10)
        explainLabel.textAlignment = .left
        
        if let text = explainLabel.text {
            // "목표 기상시간" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: explainLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaBold(size: 22), range: (text as NSString).range(of: "목표 기상시간"))

            explainLabel.attributedText = attributedStr
        }
    
        timeTextField.textColor = UIColor.meaningWhite
        timeTextField.font = UIFont.spoqaLight(size: 28)
        timeTextField.tintColor = .clear
        setTimeTextField()

        nextButton.backgroundColor = .meaningIvory
        nextButton.setTitle("다음으로 넘어가기", for: .normal)
        nextButton.titleLabel?.font = UIFont.spoqaMedium(size: 16)
        nextButton.setTitleColor(.meaningNavy, for: .normal)
        nextButton.makeRounded(cornerRadius: 6)
    }
    
    func setTimeTextField() {
        // timeTextField Sytle Setting
        if let userMinues = userMinues {
            wakeupTime = "오전 \(userHours)시 \(userMinues)분"
        } else {
            wakeupTime = "오전 \(userHours)시"
        }
        
        if let wakeupTime = wakeupTime {
            timeTextField.text = "\(wakeupTime)에 일어날래요."
            if let text = timeTextField.text {
                // 시간에만 밑줄과 폰트 굵게 설정
                let attributedStr = NSMutableAttributedString(string: text)
                attributedStr.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.thick.rawValue,  range: (text as NSString).range(of: wakeupTime))
                attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 28), range: (text as NSString).range(of: wakeupTime))
                
                timeTextField.attributedText = attributedStr
            }
        }
    }
    
    func setWakeDate() {
        // 기상시간 선택 폭 만들기 (4시~8시)
        hours = Array(4...8)
        minutes = Array(0...59).compactMap {
            if $0 < 10 { // 한자리수는 앞에 0을 붙여줌 (1분->01분)
                return "0\($0)"
            }
            else {
                return "\($0)"
            }
        }
    }
    
    func createPickerView() {
        // timeTextField 클릭 시 나올 시간 선택 Pickerview 생성
        let pickerView = UIPickerView()
        pickerView.backgroundColor = .meaningWhite
        pickerView.delegate = self
        pickerView.dataSource = self
        timeTextField.inputView = pickerView
        pickerView.selectRow(1, inComponent: 0, animated: false)
        // pickerView 기본값은 오전 5시 00분
        pickerView.tintColor = .meaningBlack
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 뷰 클릭 시 toolbar 내리기
        setTimeTextField()
        view.endEditing(true)
    }


    func onboarding(token: String, nickName: String, wakeUpTime: String) {
        // 온보딩 서버 연결 함수
        APIService.shared.onboarding(token, nickName, wakeUpTime) { [self] result in
                switch result {
                case .success(let data):
                    guard let loadData = data as? SimpleData else {
                        return
                    }
                    self.simpleData = loadData
                    if self.simpleData?.status == 204 {
                        // 성공하면 다음 뷰로 이동
                        guard let endVC = self.storyboard?.instantiateViewController(identifier: "OnboardingEndVC") as? OnboardingEndVC else {
                            return
                        }
                        self.navigationController?.pushViewController(endVC, animated: true)
                    }
                case .requestErr:
                    print("requestErr")
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                case .failure(_):
                    print("FailureError")
                }
            }
        }

}

extension OnboardingTimeVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 시간, 분 -> 2개
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 각자 갯수만큼 Componet를 표시한다
        if component == 0 {
            return hours.count
        } else {
            return minutes.count
        }
    }
}

extension OnboardingTimeVC: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 { // 첫번째 칸에는 시간
            return String(hours[row])
        } else { // 두번째 칸에는 분
            return String(minutes[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            // 시간 칸에서 고른것을 넣어준다
            userHours = hours[row]
        } else {
            // 분 칸에서 고른것을 넣어준다
            if minutes[row] != "00" {
                userMinues = "\(minutes[row])"
            } else {
                // 정각이면 분은 표시하지 않는다
                userMinues = nil
            }
        }
        setTimeTextField()
    }
}

extension APIService {
    
    func onboarding(_ token: String, _ nickName: String, _ wakeUpTime: String, completion: @escaping (NetworkResult<Any>)->(Void)) {
        let target: APITarget = .onboard(token: token, nickName: nickName, wakeUpTime: wakeUpTime)
        judgeSimpleObject(target, completion: completion)
    }
    
}
