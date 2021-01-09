//
//  LaunchScreenVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/09.
//

import UIKit
import Lottie

class LaunchScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let animationView = AnimationView(name: "Launch")
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        animationView.contentMode = .scaleAspectFill // 애니메이션뷰의 콘텐트모드 설정
        view.addSubview(animationView) // 애니메이션뷰를 메인뷰에 추가
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

}
