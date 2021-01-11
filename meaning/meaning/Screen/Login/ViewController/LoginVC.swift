//
//  LoginVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/09.
//

import UIKit
import Lottie

class LoginVC: UIViewController {
    
    // MARK: Variable Part
    
    var loginBtnFirstPressed: Bool = false
    let underlineAttributes : [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font : UIFont.spoqaRegular(size: 16),
        NSAttributedString.Key.foregroundColor : UIColor.meaningWhite,
        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue,
        NSAttributedString.Key.kern : -0.48
    ]
    var loginData: LoginData?
    
    
    // MARK: IBOutlet
    
    @IBOutlet var backgroundLayer: UIView!
    @IBOutlet var backBtn: UIButton!
    @IBOutlet var logoImage: UIImageView!
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var idIsInvalid: UILabel!
    
    @IBOutlet var pwLabel: UILabel!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var pwIsInvalid: UILabel!
    
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var findPasswordBtn: UIButton!
    
    @IBOutlet var loginLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: IBAction
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        loginBtnFirstPressed = false
        
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
            
            //뒤로 가기 버튼 없애기
            self.backBtn.alpha = 0
            
            //회원가입 버튼 위로 올라오기
            self.signUpBtn.center.y -= self.view.bounds.height
            
            //로그인 버튼 아래로 내려가기
            let animationRange: CGFloat = 75/896*self.view.bounds.height
            
            if(self.view.safeAreaInsets.top > 20){
                self.loginBtn.center.y += animationRange
                self.findPasswordBtn.center.y += animationRange
            }
            self.findPasswordBtn.alpha = 0
            
            //TextFields & Label 없어지기
            self.idLabel.alpha = 0
            self.idTextField.alpha = 0
            self.pwLabel.alpha = 0
            self.pwTextField.alpha = 0
            self.pwTextField.center.y += 200
            self.idTextField.center.y += 200
            self.idLabel.center.y += 200
            self.pwLabel.center.y += 200
            
            // 로고 나타나기
            self.logoImage.isHidden = false
            self.logoImage.alpha = 1
            
        }, completion: { finished in
            self.backBtn.isHidden = true
            self.findPasswordBtn.isHidden = true
            self.idLabel.isHidden = true
            self.idTextField.isHidden = true
            self.pwLabel.isHidden = true
            self.pwTextField.isHidden = true
            self.idTextField.text = nil
            self.pwTextField.text = nil
        })
    }
    
    @IBAction func loginBtnPressed(_ sender: UIButton) {
        
        // Layout
        
        let animationRange: CGFloat = 75/896*self.view.bounds.height
        
        if(!loginBtnFirstPressed){
            
            UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.transitionFlipFromTop, animations: {
                
                //뒤로 가기 버튼 나타나기
                self.backBtn.alpha = 1
                self.backBtn.isHidden = false
                
                //회원가입 버튼 아래로 내려가기
                self.signUpBtn.center.y += self.view.bounds.height
                
                if(self.view.safeAreaInsets.top > 20){
                    
                    //로그인 버튼 위로 올라가기
                    self.loginBtn.center.y -= animationRange
                    
                    //비밀번호를 잊어버리셨습니까? 버튼 나타나기
                    self.findPasswordBtn.center.y -= animationRange
                    
                }
                
                self.findPasswordBtn.isHidden = false
                self.findPasswordBtn.alpha = 1
                
                //TextFields & Label
                self.idLabel.isHidden = false
                self.idTextField.isHidden = false
                self.pwLabel.isHidden = false
                self.pwTextField.isHidden = false
                self.idLabel.center.y -= 200
                self.idTextField.center.y -= 200
                self.pwLabel.center.y -= 200
                self.pwTextField.center.y -= 200
                
                self.pwIsInvalid.center.y -= 200
                self.idIsInvalid.center.y -= 200
                
                self.idLabel.alpha = 1
                self.idTextField.alpha = 1
                self.pwLabel.alpha = 1
                self.pwTextField.alpha = 1
                
                // 로고 없어지기
                self.logoImage.alpha = 0
                
                
            }, completion: { finished in
                self.logoImage.isHidden = true
            })
            
            loginBtnFirstPressed = true
            
        } else {
            // 로그인 버튼을 눌러서 다음뷰로 넘어가기
            
            // 서버 연결
            login(email: self.idTextField.text ?? "", password: self.pwTextField.text ?? "")
            
            // ID, PW 모두 틀렸거나 입력되지 않았을 때
            if (self.idTextField.text == "" && self.pwTextField.text == "") {
                self.idIsInvalid.alpha = 1
                self.pwIsInvalid.alpha = 1
                
            }
            // ID 만 틀렸거나 입력되지 않았을 때
            else if (self.idTextField.text == "") {
                self.idIsInvalid.alpha = 1
            }
            // PW 만 틀렸거나 입력되지 않았을 때
            
            else if (self.pwTextField.text == "") {
                self.pwIsInvalid.alpha = 1
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLottie()
        setLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 뷰 클릭 시 키보드 내리기
        view.endEditing(true)
    }
    
    // MARK: Layout
    
    func setLottie(){
        
        // AnimationView(name: "lottie json 파일 이름")으로 애니메이션 뷰 생성
        let animationView = AnimationView(name: "LoginBackground")
        // 애니메이션뷰의 크기 설정
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        // 애니메이션뷰의 위치설정
        animationView.center = self.view.center
        // 애니메이션뷰의 콘텐트모드 설정
        animationView.contentMode = .scaleAspectFill
        // 애니메이션뷰를 메인뷰에 추가
        view.addSubview(animationView)
        // 계속 로티가 뒤에서 돌아가도록 함
        animationView.play(fromProgress: 0,
                           toProgress: 1,
                           loopMode: LottieLoopMode.loop)
    }
    
    func setLayout(){
        
        let underlineAttribute = NSAttributedString(string: "비밀번호를 잊으셨나요?", attributes: underlineAttributes)
        
        backgroundLayer.backgroundColor = .darkGreyBlue30
        view.addSubview(backgroundLayer)
        
        backBtn.setImage(UIImage(named: "whiteBackBtn"), for: .normal)
        backBtn.isHidden = true
        backBtn.alpha = 0
        
        logoImage.image = UIImage(named:"splashlogoImg")
        logoImage.isHidden = false
        
        //SE 의 경우에 아이디/비밀번호 란을 위로 보내줌
        if(view.safeAreaInsets.top <= 20){
            loginLabelTopConstraint.constant -= 50
        }
        
        idLabel.text = "아이디"
        idLabel.font = .spoqaMedium(size: 18)
        idLabel.textColor = .meaningWhite
        idLabel.lineSetting(kernValue: -0.54)
        
        pwLabel.text = "비밀번호"
        pwLabel.font = .spoqaMedium(size: 18)
        pwLabel.textColor = .meaningWhite
        pwLabel.lineSetting(kernValue: -0.54)
        
        
        //ID Textfield 설정
        idTextField.borderStyle = .none
        let IDborder = CALayer()
        IDborder.frame = CGRect(x: 0, y: idTextField.frame.size.height-1, width: view.frame.width-46, height: 1.4)
        IDborder.backgroundColor = UIColor.white.cgColor
        idTextField.layer.addSublayer((IDborder))
        idTextField.textAlignment = .left
        idTextField.textColor = UIColor.meaningWhite
        idTextField.font = .spoqaRegular(size: 18)
        idTextField.addTarget(self, action: #selector(LoginVC.idTextFieldDidChange(_:)), for: .editingChanged)
        //id 틀렸을 때 라벨
        idIsInvalid.text = "존재하지 않는 아이디입니다."
        idIsInvalid.textColor = .meaningRed
        idIsInvalid.font = .notoRegular(size: 14)
        idIsInvalid.lineSetting(kernValue: -0.42)
        
        //PW Textfield 설정
        pwTextField.borderStyle = .none
        let PWborder = CALayer()
        PWborder.frame = CGRect(x: 0, y: pwTextField.frame.size.height-1, width: view.frame.width-46, height: 1.4)
        PWborder.backgroundColor = UIColor.white.cgColor
        pwTextField.layer.addSublayer((PWborder))
        pwTextField.textAlignment = .left
        pwTextField.textColor = UIColor.meaningWhite
        pwTextField.font = .spoqaRegular(size: 18)
        pwTextField.isSecureTextEntry = true
        pwTextField.addTarget(self, action: #selector(pwTextFieldDidChange(_:)), for: .editingChanged)
        
        //pw 틀렸을 때 라벨
        pwIsInvalid.text = "비밀번호를 확인해주세요."
        pwIsInvalid.textColor = .meaningRed
        pwIsInvalid.font = .notoRegular(size: 14)
        pwIsInvalid.lineSetting(kernValue: -0.42)
        
        //아이디 비밀번호 부분 안보이게 세팅
        idLabel.isHidden = true
        idTextField.isHidden = true
        pwLabel.isHidden = true
        pwTextField.isHidden = true
        idLabel.alpha = 0
        idTextField.alpha = 0
        idIsInvalid.alpha = 0
        pwLabel.alpha = 0
        pwTextField.alpha = 0
        pwIsInvalid.alpha = 0
        
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
    
    // MARK: Function
    // id, pw textfield 편집 시작할 때 빨간색 알림 사라지도록 해줌
    
    @objc func idTextFieldDidChange(_ textField: UITextField){
        if (textField.text?.isEmpty != nil) {
            idIsInvalid.alpha = 0
        }
    }
    
    @objc func pwTextFieldDidChange(_ textField: UITextField){
        if (textField.text?.isEmpty != nil) {
            pwIsInvalid.alpha = 0
        }
    }
    
    func login(email: String, password: String) {
        APIService.shared.login(email, password) { [self] result in
            switch result {
            case .success(let data):
                guard let loadData = data as? LoginData else {
                    return
                }
                //성공하면 다음 뷰로 이동
                let storyBoard: UIStoryboard = UIStoryboard(name: "Home", bundle: nil)
                guard let endVC = storyBoard.instantiateViewController(identifier: "HomeVC") as? HomeVC else {
                    return
                }
                endVC.modalPresentationStyle = .fullScreen
                self.present(endVC, animated: true, completion: nil)
                self.loginData = loadData
                print(loginData)
                
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}


// MARK: Service

extension APIService {
    
    func login(_ email: String, _ password: String, completion: @escaping (NetworkResult<LoginData>)->(Void)) {
        
        let target: APITarget = .login(email: email, password: password)
        judgeObject(target, completion: completion)
        
    }
}
