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
        // nothing happens
        }
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
    
    // MARK: Function
    
    //디폴트 placeholder 지정
    func placeholderSetting(){
        bodyTextView.delegate = self
        bodyTextView.text = placeholderPhrase
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

// MARK: Extension

extension UIViewController {
    
    // MARK: Function
    
    func showToast(message : String, font: UIFont) {
        let guide = view.safeAreaInsets.bottom
        let height = self.view.frame.size.height-guide
        
        let toastLabel = UILabel(
            frame: CGRect( x: self.view.frame.size.width/2 - 83,
                           y: height-181,
                           width: 166,
                           height: 29
            )
        )
        
        toastLabel.backgroundColor = UIColor.gray4
        toastLabel.textColor = UIColor.gray6
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 6
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}

