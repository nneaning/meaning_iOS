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
                                let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
                                let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                                loginViewController.modalTransitionStyle = .crossDissolve
                                loginViewController.modalPresentationStyle = .fullScreen
                                self.present(loginViewController, animated: true, completion: nil)
                                
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
    
}
