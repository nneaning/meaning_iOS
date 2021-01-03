//
//  DailyDiaryVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/03.
//

import UIKit

class DailyDiaryVC: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var bodyUpperLabel: UILabel!
    @IBOutlet var bodyView: UIView!
    @IBOutlet var bodyTextView: UITextView!
    
    @IBOutlet var characterLimit: UILabel!
    @IBOutlet var RegisterBtn: UIButton!
    
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
        
        self.bodyUpperLabel.font = UIFont.notoRegular(size: 18.0)
        self.bodyUpperLabel.textColor = UIColor.gray2
        self.bodyUpperLabel.text = "오늘 아침을 글로 남겨봐요"
        
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
}

// MARK: Extension

extension DailyDiaryVC: UITextViewDelegate {
    
    //디폴트 placeholder 지정
    func placeholderSetting(){
        bodyTextView.delegate = self
        bodyTextView.text = "나만 볼 수 있는 자기 회고 및 감사 일기를 써보세요!\n기분 좋은 아침을 시작하게 될 거예요."
        bodyTextView.lineSetting(kernValue: -1, lineSpacing: 10)
        bodyTextView.textColor = UIColor.gray3
        bodyTextView.font = UIFont.spoqaRegular(size: 16)
    }
    
    //편집 시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.gray3 {
            textView.text = nil
            textView.textColor = UIColor.gray1
        }
    }
    
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "나만 볼 수 있는 자기 회고 및 감사 일기를 써보세요!\n기분 좋은 아침을 시작하게 될 거예요."
            textView.textColor = UIColor.lightGray
        }
    }
    
}
