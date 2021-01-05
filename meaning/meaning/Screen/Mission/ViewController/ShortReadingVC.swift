//
//  ShortReadingVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/05.
//

import UIKit

class ShortReadingVC: UIViewController {
    
    // MARK: Variable Part
    
    var reviewPlaceholder = "한줄평을 작성해주세요."
    var titlePlaceholder = "책 제목을 입력하세요."
    
    // MARK: IBOutlet
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var bodyUpperLabel: UILabel!
    
    @IBOutlet var bookTitleView: UIView!
    @IBOutlet var bookTitleTextField: UITextField!
    
    @IBOutlet var bookReviewView: UIView!
    @IBOutlet var bookReviewTextView: UITextView!
    
    @IBOutlet var characterLimit: UILabel!
    @IBOutlet var registerBtn: UIButton!
    
    // MARK: IBAction
    
    @IBAction func registerBtnPressed(_ sender: UIButton) {
        if (bookReviewTextView.text.isEmpty || bookReviewTextView.text == reviewPlaceholder) {
            self.showToast(message: "한줄평을 입력해주세요", font: UIFont.spoqaRegular(size: 16))
        } else if((bookTitleTextField.text?.isEmpty) != nil){
            self.showToast(message: "책 제목을 입력해주세요", font: UIFont.spoqaRegular(size: 16))
        } else {
            // 다음 뷰로 넘어가기
        }
    }
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        titlePlaceholderSetting()
        reviewPlaceholderSetting()
    }
    
    // MARK: Layout
    
    func setLayout() {
        self.view.backgroundColor = UIColor.meaningLightblue
        self.headerView.backgroundColor = UIColor.meaningLightblue
        self.headerLabel.font = UIFont.notoMedium(size: 17.0)
        self.headerLabel.text = "짧은 독서"
        self.headerLabel.textColor = UIColor.gray1

        self.bodyUpperLabel.font = UIFont.notoRegular(size: 18.0)
        self.bodyUpperLabel.textColor = UIColor.gray2
        self.bodyUpperLabel.text = "책을 읽고 한줄평을 남겨봐요"
        self.bodyUpperLabel.lineSetting(kernValue: -0.72)
        
        self.bookTitleView.setRounded(radius: 6)
        self.bookTitleView.backgroundColor = UIColor.meaningIvory
        self.bookTitleTextField.backgroundColor = UIColor.white.withAlphaComponent(0)
        self.bookTitleTextField.borderStyle = .none
        
        self.bookReviewView.setRounded(radius: 6)
        self.bookReviewView.backgroundColor = UIColor.meaningIvory
        self.bookReviewTextView.backgroundColor = UIColor.white.withAlphaComponent(0)
        
        self.characterLimit.font = UIFont.notoMedium(size: 15)
        self.characterLimit.textColor = UIColor.gray7
        self.characterLimit.text = "0/30"
        
        self.registerBtn.backgroundColor = UIColor.meaningNavy
        self.registerBtn.setTitleColor(UIColor.meaningWhite, for: .normal)
        self.registerBtn.titleLabel?.font=UIFont.spoqaMedium(size: 16)
        self.registerBtn.setTitle("등록하기", for: .normal)
        self.registerBtn.setRounded(radius: 6)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            // 뷰 클릭 시 키보드 내리기
            view.endEditing(true)
    }
    
}

// MARK: Extension - 한줄평 부분

extension ShortReadingVC: UITextViewDelegate {
    
    // MARK: Function
    
    //디폴트 placeholder 지정
    func reviewPlaceholderSetting(){
        bookReviewTextView.delegate = self
        bookReviewTextView.text = reviewPlaceholder
        bookReviewTextView.lineSetting(kernValue: -0.8, lineSpacing: 10)
        bookReviewTextView.textColor = UIColor.gray3
        bookReviewTextView.font = UIFont.spoqaRegular(size: 16)
    }
    
    //편집 시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == reviewPlaceholder {
            textView.text = nil
            textView.textColor = UIColor.gray1
        }
    }
    
    // 비어있으면 다시 place holder 지정
    func textViewDidEndEditing(_ textView: UITextView) {
        if (textView.text == "") {
            textView.text = reviewPlaceholder
            textView.textColor = UIColor.lightGray
        }
    }
    
    // 글자수 체크 기능, 30자 까지만 제한
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText string: String) -> Bool{
        if(textView == bookReviewTextView){
            let strLength = textView.text?.count ?? 0
            let lengthToAdd = string.count
            let lengthCount = strLength + lengthToAdd
            self.characterLimit.text = "\(lengthCount)/30"
            return lengthCount < 30
        } else if (textView.text == reviewPlaceholder) {
            self.characterLimit.text = "0/30"
        }
        return true
    }
}

// MARK: Extension - 책 제목 부분

extension ShortReadingVC: UITextFieldDelegate {
    
    // MARK: Function
    
    //디폴트 placeholder 지정
    func titlePlaceholderSetting(){
        bookTitleTextField.delegate = self
        bookTitleTextField.text = titlePlaceholder
        bookTitleTextField.lineSetting(kernValue: -0.8)
        bookTitleTextField.textColor = UIColor.gray3
        bookTitleTextField.font = UIFont.spoqaRegular(size: 16)
    }
    
    //편집 시작
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == titlePlaceholder {
            textField.text = nil
            textField.textColor = UIColor.gray1
        }
    }
    
    // 비어있으면 다시 place holder 지정
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.text == "") {
            textField.text = titlePlaceholder
            textField.textColor = UIColor.lightGray
        }
    }
    
}
