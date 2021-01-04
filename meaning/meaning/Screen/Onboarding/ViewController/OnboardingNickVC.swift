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
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 뷰 클릭 시 키보드 내리기
        view.endEditing(true)
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
        
        nextButton.backgroundColor = .meaningIvory
        nextButton.titleLabel?.font = UIFont.spoqaMedium(size: 16)
        nextButton.setTitle("다음으로 넘어가기", for: .normal)
        nextButton.makeRounded(cornerRadius: 6)
        
        nextButton.setTitleColor(.gray4, for: .normal)
        nextButton.isEnabled = false
        // 닉네임이 설정 안되었을 때는 넘어가기 불가
        
    }
}
