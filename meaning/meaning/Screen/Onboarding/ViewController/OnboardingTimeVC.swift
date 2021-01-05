//
//  OnboardingTimeVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/05.
//

import UIKit

class OnboardingTimeVC: UIViewController {

    // MARK: Variable Part
    
    var userNick: String = "(이름)"
    var wakeupTime: String = "오전 5시"
    
    // MARK: IBOutlet
    
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }
    

}

// MARK: Extension

extension OnboardingTimeVC {
    
    func setView() {
        // 뷰 Style Setting
        explainLabel.text = "\(userNick) 님의\n목표 기상시간을 알려주세요.\n하루를 길게 쓸 수 있게\n도와 드릴게요!"
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
        
        
        timeTextField.text = "\(wakeupTime)에 일어날래요."
        timeTextField.textColor = UIColor.meaningWhite
        timeTextField.font = UIFont.spoqaLight(size: 28)
        
        if let text = timeTextField.text {
            // 시간에만 밑줄과 폰트 굵게 설정
            let attributedStr = NSMutableAttributedString(string: text)
            attributedStr.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.thick.rawValue,  range: (text as NSString).range(of: wakeupTime))
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 28), range: (text as NSString).range(of: wakeupTime))
            
            timeTextField.attributedText = attributedStr

        }

        nextButton.backgroundColor = .meaningIvory
        nextButton.setTitle("다음으로 넘어가기", for: .normal)
        nextButton.titleLabel?.font = UIFont.spoqaMedium(size: 16)
        nextButton.setTitleColor(.gray4, for: .normal)
        nextButton.makeRounded(cornerRadius: 6)
        nextButton.isEnabled = false
    }
}
