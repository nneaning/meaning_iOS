//
//  CalendarVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/11.
//

import UIKit

class CalendarVC: UIViewController {

    // MARK: Variable Part
    
    var nick: String = "기상"
    var countTime: Int = 30
    
    // MARK: IBOutlet
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var explainLabel: UILabel!
    
    // MARK: IBAction
    
    @IBAction func dateButtonDidTap(_ sender: Any) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.popViewController(animated: false)
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        // Do any additional setup after loading the view.
    }
    
}

// MARK: Extension

extension CalendarVC {
    
    // MARK: Function
    
    func setView() {
        
        self.view.backgroundColor = .meaningIvory
        
        explainLabel.text = "오늘은\n\(nick)님의 \(countTime)번째\n의미있는 아침입니다."
        explainLabel.textColor = .meaningNavy
        explainLabel.font = UIFont.spoqaLight(size: 22)
        explainLabel.numberOfLines = 0
        
        if let text = explainLabel.text {
            
            let attributedStr = NSMutableAttributedString(string: explainLabel.text ?? "")
            // 닉네임 부분에 폰트를 다르게 설정
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: nick))
            // ~번째 부분에 폰트를 다르게 설정
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: "\(countTime)번째"))

            explainLabel.attributedText = attributedStr
        }
        explainLabel.lineSetting(kernValue: -0.88, lineSpacing: 10)
        explainLabel.textAlignment = .left
        
        dateButton.makeRounded(cornerRadius: 15)
        dateButton.setTitle("<  \(Date().datePickerToString().recordDate())", for: .normal)
        dateButton.titleLabel?.font = UIFont.spoqaRegular(size: 14)
        dateButton.backgroundColor = .meaningNavy
        dateButton.setTitleColor(.white, for: .normal)
    }
}
