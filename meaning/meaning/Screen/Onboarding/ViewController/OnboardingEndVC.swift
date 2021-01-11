//
//  OnboardingEndVC.swift
//  meaning
//
//  Created by 김민희 on 2021/01/11.
//

import UIKit
import Lottie

class OnboardingEndVC: UIViewController {
    
    // MARK: Variable Part
    
    var animationView: AnimationView?
    
    // MARK: IBOutlet
    
    @IBOutlet weak var addObjectView: UIView!
    @IBOutlet weak var firstMentLabel: UILabel!
    @IBOutlet weak var secondMentLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: IBAction
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLottie()
        setView()
        // Do any additional setup after loading the view.
    }

}

// MARK: Extension

extension OnboardingEndVC {
    
    // MARK: Function
    
    func setLottie() {
        // background 로티 설정
        self.addObjectView.backgroundColor = .none
        animationView = AnimationView(name: "SplashBackground")
        animationView?.contentMode = .scaleAspectFill
        animationView?.frame = self.view.bounds
        animationView?.play()
        self.view.addSubview(animationView!)
        self.view.addSubview(addObjectView!)
    }
    
    func setView() {
        
        firstMentLabel.numberOfLines = 0
        firstMentLabel.text = "반갑습니다.\n성장을 위한 아침의 기적,\n미라클 모닝!"
        firstMentLabel.textColor = .white
        firstMentLabel.font = UIFont.spoqaLight(size: 22)
        
        if let text = firstMentLabel.text {
            // "미라클 모닝!" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: text)
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: "미라클 모닝!"))

            firstMentLabel.attributedText = attributedStr
        }
        
        firstMentLabel.lineSetting(kernValue: -1.1, lineSpacing: 10)
        firstMentLabel.textAlignment = .left
        
        secondMentLabel.numberOfLines = 0
        secondMentLabel.text = "미닝과 함께\n미라클 모닝으로\n기적을 만들어 보실래요?"
        secondMentLabel.textColor = .white
        secondMentLabel.font = UIFont.spoqaLight(size: 22)
        
        if let text = secondMentLabel.text {
            // "미라클 모닝!" 부분에만 폰트를 다르게 설정
            let attributedStr = NSMutableAttributedString(string: text)
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: "미라클 모닝"))
            attributedStr.addAttribute(NSAttributedString.Key(rawValue: kCTFontAttributeName as String), value: UIFont.spoqaMedium(size: 22), range: (text as NSString).range(of: "미닝"))

            secondMentLabel.attributedText = attributedStr
        }
        
        secondMentLabel.lineSetting(kernValue: -1.1, lineSpacing: 10)
        secondMentLabel.textAlignment = .left
        
        startButton.setRounded(radius: 6)
        startButton.setTitle("미닝 시작하기", for: .normal)
        startButton.titleLabel?.font = UIFont.spoqaMedium(size: 16)
        startButton.setTitleColor(.meaningNavy, for: .normal)
        startButton.backgroundColor = .meaningIvory
    }
}
