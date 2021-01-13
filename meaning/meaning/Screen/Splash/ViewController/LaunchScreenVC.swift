//
//  LaunchScreenVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/09.
//

import UIKit
import Lottie

class LaunchScreenVC: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet var backgroundLayer: UIView!
    @IBOutlet var logo: UIImageView!
    var refreshtokenData: RefreshtokenData?
    
    // MARK: Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLottie()
        setLayout()
    }
    
    // MARK: Lottie
    
    func setLottie(){
        let animationView = AnimationView(name: "SplashBackground")
        
        animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        // 애니메이션뷰의 콘텐트모드 설정
        animationView.contentMode = .scaleAspectFill
        
        // 에러 나는 부분 
        
        // 애니메이션뷰를 메인뷰에 추가
        view.addSubview(animationView)
        animationView.play(fromProgress: 0,
                           toProgress: 1,
                           loopMode: LottieLoopMode.playOnce,
                           completion: { (finished) in
                            if finished {
                                if (UserDefaults.standard.string(forKey: "userNick") != nil) {
                                    // 온보딩 설정이 존재하면?
                                    self.checkToken()
                                } else {
                                    // 로그인 뷰로 이동
                                    let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
                                    let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                                    loginViewController.modalTransitionStyle = .crossDissolve
                                    loginViewController.modalPresentationStyle = .fullScreen
                                    self.present(loginViewController, animated: true, completion: nil)
                                    
                                }
                                
                            } else {
                                print("Animation cancelled")
                            }
                           })
        
    }
    
    // MARK: Layout
    
    func setLayout() {
        backgroundLayer.backgroundColor = .none
        view.addSubview(backgroundLayer)
        logo.image = UIImage(named:"splashlogoImg")
    }
    
    // MARK: Server Function

    func checkToken() {
        // refreshtoken을 핸드폰에 가지고 있다면 서버 통신 시도
        splash(refreshtoken: UserDefaults.standard.string(forKey: "refreshtoken") ?? "")
        
        // 테스트용으로는 직접 pass 되는 토큰 입력
        // splash(refreshtoken: "[토큰]")
    }
    
    
    // MARK: APIService Function
    
    func splash(refreshtoken: String) {
        APIService.shared.splash(refreshtoken) {
            result in
            switch result {
            
            case .success(let data):
                self.refreshtokenData = data as? RefreshtokenData
                // 200 : 새롭게 발급되는 accessToken, refreshToken 폰에 저장
                if let data = self.refreshtokenData {
                    UserDefaults.standard.setValue(data.accessToken, forKey: "accesstoken")
                    UserDefaults.standard.setValue(data.refreshToken, forKey: "refreshtoken")
                }
                
                // 저장 후 홈으로 이동
                let tabBarStoryboard: UIStoryboard = UIStoryboard(name: "TabBar", bundle: nil)
                guard let tabBarVC = tabBarStoryboard.instantiateViewController(identifier: "TabBarVC") as? TabBarVC else {
                    return
                }
                tabBarVC.modalTransitionStyle = .crossDissolve
                tabBarVC.modalPresentationStyle = .fullScreen
                self.present(tabBarVC, animated: true, completion: nil)

            case .failure(let error):
                // 400, 401: login 뷰로 이동
                if ((400...401).contains(error)){
                    
                    // 로그인 뷰로 이동
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
                    let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                    loginViewController.modalTransitionStyle = .crossDissolve
                    loginViewController.modalPresentationStyle = .fullScreen
                    self.present(loginViewController, animated: true, completion: nil)
                }
            }
        }
    }
    
}

// MARK: APIService

extension APIService {
    
    func splash(_ refreshtoken: String, completion: @escaping (NetworkResult<RefreshtokenData>)->(Void)) {
        let target: APITarget = .refreshtoken(refreshtoken: refreshtoken)
        judgeObject(target, completion: completion)
    }
    
}
