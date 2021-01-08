//
//  GroupCreateVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/08.
//

import UIKit

class GroupCreateVC: UIViewController {
    
    //MARK: - IBOutlet
    
    
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var GroupCreateLabel: UILabel!
    
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var memberCountLabel: UILabel!
    @IBOutlet var countTextField: UITextField!
    @IBOutlet var personsLabel: UILabel!
    @IBOutlet var numberInfoLabel: UILabel!
    
    @IBOutlet var groupInfoLabel: UILabel!
    @IBOutlet var infoTextView: UITextView!
    
    @IBOutlet var createBtn: UIButton!
    
    //MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        placeholderSetting()
        TextViewAddPadding()
    }

}

    //MARK: - extension

extension GroupCreateVC {
    func setLayout() {
    
        GroupCreateLabel.text = "그룹 생성"
        GroupCreateLabel.font = UIFont.spoqaMedium(size: 17)
        GroupCreateLabel.textColor = .gray1
        GroupCreateLabel.lineSetting(kernValue: -0.68)
        
        groupNameLabel.text = "그룹 이름"
        groupNameLabel.font = UIFont.spoqaMedium(size: 18)
        groupNameLabel.textColor = .meaningNavy
        groupNameLabel.lineSetting(kernValue: -0.72)
        
        nameTextField.setRounded(radius: 5.0)
        nameTextField.backgroundColor = .white
        nameTextField.setBorder(borderColor: .gray4, borderWidth: 1.0)
        nameTextField.placeholder = "이름을 설정해주세요!"
        nameTextField.font = UIFont.spoqaRegular(size: 15)
        nameTextField.textColor = UIColor.gray2
        nameTextField.addLeftPadding()
        
        memberCountLabel.text = "인원수"
        memberCountLabel.font = UIFont.spoqaMedium(size: 17)
        memberCountLabel.textColor = .meaningNavy
        memberCountLabel.lineSetting(kernValue: -0.68)
        
        countTextField.setRounded(radius: 5.0)
        countTextField.backgroundColor = .white
        countTextField.setBorder(borderColor: .gray4, borderWidth: 1.0)
        countTextField.placeholder = "100"
        countTextField.font = UIFont.spoqaRegular(size: 15)
        countTextField.textColor = UIColor.gray2
        countTextField.addRightPadding()
        
        personsLabel.text = "명"
        personsLabel.font = UIFont.spoqaRegular(size: 17)
        personsLabel.textColor = .gray2
        
        numberInfoLabel.text = "최소 2명부터 최대 100명까지 참여할 수 있어요!"
        numberInfoLabel.font = UIFont.spoqaRegular(size: 12)
        numberInfoLabel.textColor = .gray3
        numberInfoLabel.lineSetting(kernValue: -0.48)
        
        groupInfoLabel.text = "그룹 소개"
        groupInfoLabel.font = UIFont.spoqaMedium(size: 17)
        groupInfoLabel.textColor = .meaningNavy
        groupInfoLabel.lineSetting(kernValue: -0.68)
        
        infoTextView.setRounded(radius: 5.0)
        infoTextView.setBorder(borderColor: .gray4, borderWidth: 1.0)
        
        createBtn.setRounded(radius: 5.0)
        createBtn.backgroundColor = .meaningNavy
        createBtn.setTitle("그룹 만들기", for: .normal)
        createBtn.titleLabel?.font = UIFont.notoMedium(size: 16)
        createBtn.setTitleColor(UIColor.meaningWhite, for: .normal)

    }
    
}

extension UITextField {
    
    func addLeftPadding() {
        //nameTextField padding 설정
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 13, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding() {
        //명수 입력 오른쪽에 여백 주기
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = ViewMode.always
        }

    
}

extension GroupCreateVC: UITextViewDelegate {
    
    func TextViewAddPadding() {
        //TextView padding
        infoTextView.textContainerInset = UIEdgeInsets(top: 16, left: 13, bottom: 18, right: 13)
    }
    
    //디폴트 placeholder 지정
    func placeholderSetting(){
        infoTextView.delegate = self
        infoTextView.text = "그룹을 자유롭게 소개해주세요!"
        infoTextView.lineSetting(kernValue: -0.6, lineSpacing: 10)
        infoTextView.textColor = UIColor.gray4
        infoTextView.font = UIFont.spoqaRegular(size: 15)
    }
    
    //편집 시작
    func textViewDidBeginEditing(_ textView: UITextView) {
        if infoTextView.text == "그룹을 자유롭게 소개해주세요!" {
            infoTextView.text = nil
            infoTextView.textColor = UIColor.gray2
        }
    }
    
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {
        if (infoTextView.text == "") {
            infoTextView.text = "그룹을 자유롭게 소개해주세요!"
            infoTextView.textColor = UIColor.gray4
        }
    }

}


