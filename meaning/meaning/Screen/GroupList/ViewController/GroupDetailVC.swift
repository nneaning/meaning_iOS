//
//  GroupDetailVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/05.
//

import UIKit

class GroupDetailVC: ViewController {
    
    var groupDetailData: GroupDetailData?
    var groupID: Int = 0
    
    // MARK: - IBOutlet
    
    @IBOutlet var popUpBox: UIView!
    
    @IBOutlet var groupNameLabel: UILabel!
    @IBOutlet var closeBtn: UIButton!
    
    @IBOutlet var groupInfoBox: UIView!
    @IBOutlet var groupInfoLabel: UILabel!
    
    @IBOutlet var participantLabel: UILabel!
    @IBOutlet var peopleNumberLabel: UILabel!
    @IBOutlet var groupJoinBtn: UIButton!
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBox()
        setLabel()
        setButton()
        
        print(">>>", self.groupID)
        groupDetail(token: "", groupid: self.groupID)
        
    }
    
    // MARK: - IBAction
    
    @IBAction func closeThisView(_ sender: Any) {
        //현재 view 닫기
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    @IBAction func goToGroupJoin(_ sender: Any) {
        //현재 View 닫은 후 그룹조인뷰로 이동
        weak var pvc = self.presentingViewController
        
        self.dismiss(animated: true, completion: {
            guard let groupJoinVC = self.storyboard?.instantiateViewController(identifier: "GroupJoinVC")
                    as? GroupJoinVC else {
                return
            }
            groupJoinVC.modalPresentationStyle = .overCurrentContext
            groupJoinVC.modalTransitionStyle = .coverVertical
            
            pvc?.present(groupJoinVC, animated: true, completion: nil)
        })
    }
}


// MARK: - Extension

extension GroupDetailVC {
    
    func setBox() {
        //uiView radius 설정
        popUpBox.layer.cornerRadius = 5.0
        
        groupInfoBox.layer.cornerRadius = 5.0
        groupInfoBox.layer.backgroundColor = UIColor.meaningIvory.cgColor
        groupInfoBox.layer.borderColor = UIColor.gray5.cgColor
        groupInfoBox.layer.borderWidth = 1.0
    }
    
    func setLabel() {
        //라벨 폰트, 색상 설정
        
        groupNameLabel.font = UIFont.notoBold(size: 18)
        groupNameLabel.textColor = UIColor.gray2
        groupNameLabel.lineSetting(kernValue: -0.54)
        
        groupInfoLabel.font = UIFont.notoRegular(size: 16)
        groupInfoLabel.textColor = UIColor.gray2
        groupNameLabel.lineSetting(kernValue: -0.48)
        
        participantLabel.text = "참가 인원"
        participantLabel.font = UIFont.spoqaMedium(size: 14)
        participantLabel.textColor = UIColor.gray3
        groupNameLabel.lineSetting(kernValue: -0.56)
        
        peopleNumberLabel.font = UIFont.spoqaMedium(size: 14)
        peopleNumberLabel.textColor = UIColor.meaningNavy
    
    }
    
    func setButton() {
        //버튼 폰트, 색상 설정
        groupJoinBtn.layer.cornerRadius = 5.0
        groupJoinBtn.backgroundColor = UIColor.meaningNavy
        groupJoinBtn.setTitle("그룹 참가하기", for: .normal)
        groupJoinBtn.titleLabel?.font = UIFont.spoqaMedium(size: 15)
        groupJoinBtn.setTitleColor(UIColor.meaningWhite, for: .normal)
    }
    
    func groupDetail(token : String, groupid: Int) {
        APIService.shared.groupDetail(token : token, groupid: self.groupID) { result in
            switch result {
            case .success(let data):
                guard let loadData = data as? GroupDetailData else {
                    return
                }
                self.groupDetailData = loadData
                
                self.groupNameLabel.text = "\(self.groupDetailData?.groupDetail.groupName ?? "그룹이 존재하지 않습니다.")"
                self.groupInfoLabel.text = "\(self.groupDetailData?.groupDetail.introduction ?? "내용이 없습니다.")"
                self.peopleNumberLabel.text = "\(self.groupDetailData?.groupDetail.countMember ?? 0)/\(self.groupDetailData?.groupDetail.maximumMemberNumber ?? 0)"
                
                if let text = self.peopleNumberLabel.text {
                    //앞에 숫자 부분에만 색상 다르게 설정
                    let attributedStr = NSMutableAttributedString(string: self.peopleNumberLabel.text ?? "")
                    
                    attributedStr.addAttribute(.foregroundColor, value: UIColor.skyBlue, range: (self.peopleNumberLabel.text! as NSString).range(of: "\(self.groupDetailData?.groupDetail.countMember ?? 0)"))
                    
                    self.peopleNumberLabel.attributedText = attributedStr
                }
                
            case .failure(_):
                print("FailureError")
            }
        }
    }
    
}

// MARK: - APIService Extension

extension APIService {
    
    func groupDetail(token : String, groupid: Int, completion: @escaping (NetworkResult<GroupDetailData>)->(Void)) {
        
        let target: APITarget = .groupDetail(token: token, groupid: groupid)
        
        judgeObject(target, completion: completion)
    }
    
}
