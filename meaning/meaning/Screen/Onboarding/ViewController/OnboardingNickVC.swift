//
//  OnboardingNickVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/04.
//

import UIKit

class OnboardingNickVC: UIViewController {

    // MARK: IBOutlet
    
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var nickTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: IBAction
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        // 다음 뷰로 연결
        guard let timeVC = self.storyboard?.instantiateViewController(identifier: "OnboardingTimeVC") as? OnboardingTimeVC else {
            return
        }
        
        // 닉네임값 넘겨주기
        if let nick = nickTextField.text {
            timeVC.userNick = nick
        }
        
        self.navigationController?.pushViewController(timeVC, animated: true)
    }
    
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()

    }

}

// MARK: Extension

extension OnboardingNickVC {
    
    // MARK: Function
    
    func setView() {
        // 뷰 Style Setting
        explainLabel.text = "사용하실 닉네임을 적어주세요."
        explainLabel.font = UIFont.spoqaRegular(size: 22)
        explainLabel.textColor = UIColor.meaningWhite

        if let text = explainLabel.text {
            // "닉네임" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: explainLabel.text ?? "")
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaBold(size: 22), range: (text as NSString).range(of: "닉네임"))

            explainLabel.attributedText = attributedStr
        }
        
        nickTextField.font = UIFont.spoqaRegular(size: 22)
        nickTextField.textColor = .meaningWhite
        nickTextField.delegate = self
        
        nextButton.backgroundColor = .meaningIvory
        nextButton.titleLabel?.font = UIFont.spoqaMedium(size: 16)
        nextButton.setTitle("다음으로 넘어가기", for: .normal)
        nextButton.makeRounded(cornerRadius: 6)
        
        nextButton.setTitleColor(.gray4, for: .normal)
        nextButton.isEnabled = false
        // 닉네임이 설정 안되었을 때는 넘어가기 불가
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 뷰 클릭 시 키보드 내리기
        view.endEditing(true)
    }
}

extension OnboardingNickVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 키보드 리턴키 클릭 시 키보드 내려가기
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // 텍스트필드 수정이 끝나면 검사하는 코드
        if textField.text?.count != 0 {
            // textfield가 비어있지 않을 때
            nextButton.isEnabled = true
            nextButton.setTitleColor(.meaningNavy, for: .normal)
            
        } else {
            // textfield가 비어있을 때
            nextButton.isEnabled = false
            nextButton.setTitleColor(.gray4, for: .normal)
        }
    }
}
