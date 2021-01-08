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
    
    
    
    @IBAction func createBtnPressed(_ sender: UIButton) {
        //그룹 만들기 눌렀을 때 textField 값이 없으면 토스트 팝업
        if infoTextView.text.isEmpty || infoTextView.text == "그룹을 자유롭게 소개해주세요!" {
            self.showToast(message: "내용을 입력해주세요", font: UIFont.spoqaRegular(size: 15))
            
        } else if nameTextField.text?.isEmpty == true {
            self.showToast(message: "내용을 입력해주세요", font: UIFont.spoqaRegular(size: 15))
        }
    }
    
    @IBAction func editChanged(_ sender: UITextField) {
        //인원수 값이 없는 경우와 값 충족을 못 시키는 경우
        if sender.text?.isEmpty == true {
            self.showToast(message: "정확한 숫자를 입력해주세요", font: UIFont.spoqaRegular(size: 15))
            numberInfoLabel.text = "최소 2명부터 최대 100명까지 참여할 수 있어요!"
            numberInfoLabel.font = UIFont.spoqaRegular(size: 12)
            numberInfoLabel.textColor = .red
            numberInfoLabel.lineSetting(kernValue: -0.48)
            
        } else if Int(sender.text!)! < 2 || Int(sender.text!)! > 100 {
                self.showToast(message: "정확한 숫자를 입력해주세요", font: UIFont.spoqaRegular(size: 15))
                numberInfoLabel.text = "최소 2명부터 최대 100명까지 참여할 수 있어요!"
                numberInfoLabel.font = UIFont.spoqaRegular(size: 12)
                numberInfoLabel.textColor = .red
                numberInfoLabel.lineSetting(kernValue: -0.48)
        } else {
            numberInfoLabel.text = "최소 2명부터 최대 100명까지 참여할 수 있어요!"
            numberInfoLabel.font = UIFont.spoqaRegular(size: 12)
            numberInfoLabel.textColor = .gray3
            numberInfoLabel.lineSetting(kernValue: -0.48)
        }
    }
    
    
    //MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        placeholderSetting()
        TextViewAddPadding()
        
        nameTextField.delegate = self
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

extension GroupCreateVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        //그룹 이름 20자 글자수 제한
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 20
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 뷰 클릭 시 키보드 내리기
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 키보드 리턴키 클릭 시 키보드 내려가기
        textField.resignFirstResponder()
        return true
    }
    
    
}

extension GroupCreateVC: UITextViewDelegate {

    func TextViewAddPadding() {
        //TextView padding
        infoTextView.textContainerInset = UIEdgeInsets(top: 16, left: 13, bottom: 18, right: 13)
    }
    
    func placeholderSetting(){
        //디폴트 placeholder 지정
        infoTextView.delegate = self
        infoTextView.text = "그룹을 자유롭게 소개해주세요!"
        infoTextView.lineSetting(kernValue: -0.6, lineSpacing: 10)
        infoTextView.textColor = UIColor.gray4
        infoTextView.font = UIFont.spoqaRegular(size: 15)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        //편집 시작
        if infoTextView.text == "그룹을 자유롭게 소개해주세요!" {
            infoTextView.text = nil
            infoTextView.textColor = UIColor.gray2
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        // TextView Place Holder
        if (infoTextView.text == "") {
            infoTextView.text = "그룹을 자유롭게 소개해주세요!"
            infoTextView.textColor = UIColor.gray4
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText string: String) -> Bool{
        // 글자수 체크 기능, 45자 까지만 제한
        if(textView == infoTextView){
            let strLength = infoTextView.text?.count ?? 0
            let lengthToAdd = string.count
            let lengthCount = strLength + lengthToAdd
            return lengthCount <= 45
        }
        return true
    }
}


