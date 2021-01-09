//
//  LoginVC.swift
//  meaning
//
//  Created by 선민승 on 2021/01/09.
//

import UIKit
import Lottie

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setLottie()
        setLayout()
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
        
    }
}

