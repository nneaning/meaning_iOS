//
//  GroupCompleteVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/08.
//

import UIKit

class GroupCompleteVC: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet var completeLabel: UILabel!
    @IBOutlet var backToMainBtn: UIButton!
    
    //MARK: - IBAction
    
    @IBAction func backToMain(_ sender: Any) {
        //버튼 클릭 시 메인으로 돌아가기
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
}

//MARK: - extension

extension GroupCompleteVC {
    
    func setLayout() {
        completeLabel.text = "그룹 생성이 완료되었습니다!"
        completeLabel.font = UIFont.spoqaMedium(size: 20)
        completeLabel.lineSetting(kernValue: -0.8)
        completeLabel.textColor = .meaningNavy
        
        backToMainBtn.setRounded(radius: 5.0)
        backToMainBtn.backgroundColor = .meaningNavy
        backToMainBtn.setTitle("그룹으로 들어가기", for: .normal)
        backToMainBtn.titleLabel?.font = UIFont.spoqaMedium(size: 16)
        backToMainBtn.setTitleColor(UIColor.meaningWhite, for: .normal)
        
    }
    
    
}
