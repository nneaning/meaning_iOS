//
//  GroupJoinVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/05.
//

import UIKit

class GroupJoinVC: ViewController {
    
    var groupID: String = ""
    var simpleData: SimpleData?
    
    // MARK: - IBOutlet
    
    @IBOutlet var popUpBoxView: UIView!
    @IBOutlet var groupStatusLabel: UILabel!
    @IBOutlet var okBtn: UIButton!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBox()
        setButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        groupJoin(token: UserDefaults.standard.string(forKey: "accesstoken")!, groupId: Int(self.groupID) ?? -1)
    }
    
    // MARK: - IBAction
    
    @IBAction func backBtnDidTap(_ sender: Any) {
        //이전뷰로 이동
        self.dismiss(animated: true)
    }
    
}

// MARK: - Extension

extension GroupJoinVC {
    
    func setBox() {
        //uiView 레이아웃 설정
        popUpBoxView.layer.cornerRadius = 5.0
        
        //그룹 상태 라벨 폰트, 색상 설정
        groupStatusLabel.font = UIFont.spoqaMedium(size: 18)
        groupStatusLabel.textColor = UIColor.gray2
        groupStatusLabel.lineSetting(kernValue: -0.72)
    }
    
    func setButton() {
        //버튼 폰트, 색상 설정
        okBtn.backgroundColor = UIColor.meaningNavy
        okBtn.layer.cornerRadius = 5.0
        okBtn.setTitle("네!", for: .normal)
        okBtn.titleLabel?.font = UIFont.spoqaMedium(size: 15)
        okBtn.setTitleColor(UIColor.meaningWhite, for: .normal)
    }
    
    func groupJoin(token : String, groupId: Int) {
        APIService.shared.groupJoin(token: token, groupId: groupId) { [self] result in
            switch result {
            case .success(let data):
                guard let loadData = data as? SimpleData else {
                    return
                }
                self.simpleData = loadData
                self.groupStatusLabel.text = "그룹 참가가 완료되었습니다."
                
            case .failure(let error):
                print("FailureError")
                
                if (error == 406) {
                    self.groupStatusLabel.text = "그룹 참가 가능 인원을 초과했어요."
                } else {
                    self.groupStatusLabel.text = "이미 함께 하고 있는 그룹이 있어요!"
                }
                
            }
        }
    }
    
    
}



