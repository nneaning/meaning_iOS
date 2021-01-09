//
//  LoginVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/09.
//

import UIKit
import Lottie

class LoginVC: UIViewController {
    
    var loginBtnFirstPressed: Bool = false
    
    let yourAttributes : [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font : UIFont.spoqaRegular(size: 16),
        NSAttributedString.Key.foregroundColor : UIColor.meaningWhite,
        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue,
        NSAttributedString.Key.kern : -0.48
    ]
    
    @IBOutlet var backgroundLayer: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var logoImage: UIImageView!
    
    @IBOutlet var IDLabel: UILabel!
    @IBOutlet var IDTextField: UITextField!
    
    @IBOutlet var PWLabel: UILabel!
    @IBOutlet var PWTextField: UITextField!
    
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var findPasswordBtn: UIButton!
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        logoImage.isHidden = false

        if(!loginBtnFirstPressed){
            IDLabel.center.y += 200
            IDTextField.center.y += 200
            PWLabel.center.y += 200
            PWTextField.center.y += 200

            UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
                
                //뒤로 가기 버튼 나타나기
                self.backBtn.alpha = 1
                self.backBtn.isHidden = false
                
                //회원가입 버튼 아래로 내려가기
                self.signUpBtn.center.y += self.view.bounds.height
                
                //로그인 버튼 위로 올라가기
                self.loginBtn.center.y -= 98
                
                //비밀번호를 잊어버리셨습니까? 버튼 나타나기
                self.findPasswordBtn.center.y -= 98
                self.findPasswordBtn.isHidden = false
                self.findPasswordBtn.alpha = 1
                
                //TextFields & Label
                self.IDLabel.isHidden = false
                self.IDTextField.isHidden = false
                self.PWLabel.isHidden = false
                self.PWTextField.isHidden = false
                self.IDLabel.center.y -= 200
                self.IDTextField.center.y -= 200
                self.PWLabel.center.y -= 200
                self.PWTextField.center.y -= 200
                self.IDLabel.alpha = 1
                self.IDTextField.alpha = 1
                self.PWLabel.alpha = 1
                self.PWTextField.alpha = 1
                
            })
            
            UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
                self.logoImage.alpha = 0
            }, completion: { finished in
                self.logoImage.isHidden = true
            })
            
            loginBtnFirstPressed = true
        } else {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLottie()
        setLayout()
    }
    
    override func viewDidLayoutSubviews() {
        //ID Textfield 설정
        IDTextField.borderStyle = .none
        let IDborder = CALayer()
        IDborder.frame = CGRect(x: 0, y: IDTextField.frame.size.height-1, width: IDTextField.frame.width, height: 1.4)
        IDborder.backgroundColor = UIColor.white.cgColor
        IDTextField.layer.addSublayer((IDborder))
        IDTextField.textAlignment = .left
        IDTextField.textColor = UIColor.meaningWhite
        IDTextField.font = .spoqaRegular(size: 18)
        
        //PW Textfield 설정
        PWTextField.borderStyle = .none
        let PWborder = CALayer()
        PWborder.frame = CGRect(x: 0, y: IDTextField.frame.size.height-1, width: IDTextField.frame.width, height: 1.4)
        PWborder.backgroundColor = UIColor.white.cgColor
        PWTextField.layer.addSublayer((PWborder))
        PWTextField.textAlignment = .left
        PWTextField.textColor = UIColor.meaningWhite
        PWTextField.font = .spoqaRegular(size: 18)
        PWTextField.isSecureTextEntry = true
    }
    
    func setLottie(){
        let animationView = AnimationView(name: "LoginBackground") // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height) // 애니메이션뷰의 크기 설정
        animationView.center = self.view.center // 애니메이션뷰의 위치설정
        animationView.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정
        
        view.addSubview(animationView) // 애니메이션뷰를 메인뷰에 추가
        
        animationView.play(fromProgress: 0,
                           toProgress: 1,
                           loopMode: LottieLoopMode.loop)
    }
    
    func setLayout(){
        let underlineAttribute = NSAttributedString(string: "비밀번호를 잊으셨나요?", attributes: yourAttributes)
        
        backgroundLayer.backgroundColor = .darkGreyBlue30
        view.addSubview(backgroundLayer)
        
        backBtn.setImage(UIImage(named: "whiteBackBtn"), for: .normal)
        backBtn.isHidden = true
        backBtn.alpha = 0
        
        logoImage.image = UIImage(named:"splashlogoImg")
        
        IDLabel.text = "아이디"
        IDLabel.font = .spoqaMedium(size: 18)
        IDLabel.lineSetting(kernValue: -0.54)
        
        PWLabel.text = "비밀번호"
        PWLabel.font = .spoqaMedium(size: 18)
        PWLabel.lineSetting(kernValue: -0.54)
        
        IDLabel.isHidden = true
        IDTextField.isHidden = true
        PWLabel.isHidden = true
        PWTextField.isHidden = true
        IDLabel.alpha = 0
        IDTextField.alpha = 0
        PWLabel.alpha = 0
        PWTextField.alpha = 0

        loginBtn.backgroundColor = UIColor.meaningIvory
        loginBtn.setTitleColor(UIColor.meaningNavy, for: .normal)
        loginBtn.titleLabel?.font=UIFont.spoqaBold(size: 16)
        loginBtn.setTitle("로그인 하기", for: .normal)
        loginBtn.titleLabel?.lineSetting(kernValue: -0.48)
        loginBtn.setRounded(radius: 6)
        
        signUpBtn.backgroundColor = UIColor.meaningNavy
        signUpBtn.setTitleColor(UIColor.meaningWhite, for: .normal)
        signUpBtn.titleLabel?.font=UIFont.spoqaBold(size: 16)
        signUpBtn.setTitle("회원가입", for: .normal)
        signUpBtn.titleLabel?.lineSetting(kernValue: -0.48)
        signUpBtn.setRounded(radius: 6)
        
        findPasswordBtn.setAttributedTitle(underlineAttribute, for: .normal)
        findPasswordBtn.isHidden = true
        findPasswordBtn.alpha = 0
        
    }
}

