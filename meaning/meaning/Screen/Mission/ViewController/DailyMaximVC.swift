//
//  DailyMaximVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/02.
//

import UIKit

class DailyMaximVC: UIViewController {
    
    // Mark: Variables
    var missionDelegate: MissionEndDelegate?
    var daypromiseData: DaypromiseData?
    
    // Mark: IBOutlet
    
    @IBOutlet var headerView: UIView!
    @IBOutlet var headerLabel: UILabel!
    
    @IBOutlet var bodyUpperLabel: UILabel!
    
    @IBOutlet var bodyView: UIView!
    @IBOutlet var bodyViewLabel: UILabel!
    
    @IBOutlet var bodyBottomLabel: UILabel!
    
    @IBOutlet var ReadComplete: UIButton!
    
    // MARK: IBAction
    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func readCompleteBtnPressed(_ sender: UIButton) {
        missionDelegate?.MissionMent(didEndMission: "미션을 완료했어요")
        UserDefaults.standard.setValue(true, forKey: "card1")
        self.navigationController?.popViewController(animated: true)
    }
    // Mark: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        daypromise(token: UserDefaults.standard.string(forKey: "accesstoken") ?? "")
    }
    
    // MARK: Layout
    
    func setLayout() {
        self.view.backgroundColor = UIColor.meaningLightblue
        self.headerView.backgroundColor = UIColor.meaningLightblue
        self.headerLabel.font = UIFont.notoMedium(size: 17.0)
        self.headerLabel.text = "하루 다짐"
        self.headerLabel.textColor = UIColor.gray1
        
        self.bodyUpperLabel.font = UIFont.notoRegular(size: 18.0)
        self.bodyUpperLabel.textColor = UIColor.gray2
        self.bodyUpperLabel.text = "하루의 시작부터 글귀를 읽으며\n성장과 발전의 의지를 다져요"
        
        self.bodyView.setRounded(radius: 8)
        self.bodyView.backgroundColor = .meaningIvory
        
        self.bodyViewLabel.text = "평범한 사람들은 가능한 것만 믿는다.\n특별한 사람들은 불가능한 것을 그려본다.\n그리고 그것을 가능한 것으로 보기 시작한다."
        self.bodyViewLabel.font = UIFont.nbRegular(size: 18)
        self.bodyViewLabel.textAlignment = .center
        self.bodyViewLabel.textColor = .meaningBlack
        
        self.bodyBottomLabel.font = UIFont.notoRegular(size: 15.0)
        self.bodyBottomLabel.textColor = UIColor.gray3
        self.bodyBottomLabel.text = "3번 반복해서 읽어주세요."
        
        self.ReadComplete.backgroundColor = UIColor.meaningNavy
        self.ReadComplete.setTitleColor(UIColor.meaningWhite, for: .normal)
        self.ReadComplete.titleLabel?.font=UIFont.spoqaMedium(size: 16)
        self.ReadComplete.setTitle("다 읽었어요", for: .normal)
        self.ReadComplete.setRounded(radius: 6)
    }
    
    // MARK: Server function
    
    func daypromise(token: String){
        APIService.shared.daypromise(token) {
            result in
            switch result {
            
            case .success(let data):
                self.daypromiseData = data
                if let daypromiseData = self.daypromiseData {
                    self.bodyViewLabel.text = daypromiseData.contents
                    self.bodyViewLabel.lineSetting(kernValue: -0.5, lineSpacing: 10)
                }
                
            case .failure(let error):
                if (error == 401) {
                    self.showToast(message: "재접속 해주세요!", font: UIFont.spoqaRegular(size: 16))
                    self.navigationController?.popToRootViewController(animated: true)
                    
                } else {
                    self.showToast(message: "네트워크 끊김", font: UIFont.spoqaRegular(size: 16))
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }
}

// MARK: APIService

extension APIService {
    
    func daypromise(_ token: String, completion: @escaping (NetworkResult<DaypromiseData>)->(Void)) {
        
        let target: APITarget = .daypromise(token: token)
        judgeObject(target, completion: completion)
        
    }
    
}

protocol MissionEndDelegate {
    //protocol 만들고 메소드 정의
    func MissionMent(didEndMission ment: String)
}
