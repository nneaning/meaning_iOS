//
//  GroupJoinVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/05.
//

import UIKit

class GroupJoinVC: ViewController {
    
    
    @IBOutlet var popUpBoxView: UIView!
    @IBOutlet var closeBtn: UIButton!
    @IBOutlet var groupStatusLabel: UILabel!
    @IBOutlet var okBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBox()
        setButton()
    }
    
    @IBAction func closeThisView(_ sender: Any) {
        //화면 닫기
        self.presentingViewController?.dismiss(animated: true)
    }

}

extension GroupJoinVC {

    func setBox() {
        popUpBoxView.layer.cornerRadius = 5.0
        
        groupStatusLabel.font = UIFont.spoqaMedium(size: 18)
        groupStatusLabel.textColor = UIColor.gray2
        groupStatusLabel.lineSetting(kernValue: -0.72,lineSpacing: 10)
    }
    
    func setButton() {
        //버튼 폰트, 색상 설정
        okBtn.backgroundColor = UIColor.meaningNavy
        okBtn.layer.cornerRadius = 5.0
        okBtn.setTitle("네!", for: .normal)
        okBtn.titleLabel?.font = UIFont.spoqaMedium(size: 15)
        okBtn.setTitleColor(UIColor.meaningWhite, for: .normal)
    }
}



