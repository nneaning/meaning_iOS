//
//  TabBarVC.swift
//  meaning
//
//  Created by Seri Park on 2021/01/03.
//

import UIKit

class TabBarVC: UITabBarController {

    // MARK: - Variable Part
    
    var cameraButton: UIButton = {
        let button = UIButton()
        
        button.setBackgroundImage(UIImage(named:"navItemCamera"), for: .normal)
        button.addTarget(self, action: #selector(TabBarVC.buttonClicked(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    // MARK: - 버튼 클릭 시 CameraVC 이동
    
    @objc func buttonClicked(sender : UIButton) {
        guard let cameraVC = self.storyboard?.instantiateViewController(identifier: "TestCameraVC") as? TestCameraVC
        else {
            return
        }
        present(cameraVC, animated: true, completion: nil)
    }
    
    // MARK: - 탭바 설정
    
    func setTabBar() {
        guard let homeVC = self.storyboard?.instantiateViewController(identifier: "TestHomeVC") as? TestHomeVC,
              let groupVC = self.storyboard?.instantiateViewController(identifier: "TestGroupVC") as? TestGroupVC
        else {
            return
        }
        
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: -20, bottom: -5, right: 0)
        homeVC.tabBarItem.image = UIImage(named: "tabBarHomeIcInactive")
        homeVC.tabBarItem.selectedImage = UIImage(named: "tabBarHomeIcActive")
        
        groupVC.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -5, right: -20)
        groupVC.tabBarItem.image = UIImage(named: "tabBarGroupIcInactive")
        groupVC.tabBarItem.selectedImage = UIImage(named: "tabBarGroupIcActive")
        
        setViewControllers([homeVC, groupVC], animated: true)
        
        let width: CGFloat = 70/375 * self.view.frame.width
        let height: CGFloat = 70
        
        let posX: CGFloat = self.view.frame.width/2 - width/2
        let posY: CGFloat = -32
    
        cameraButton.frame = CGRect(x: posX, y: posY, width: width, height: height)
        
        tabBar.addSubview(self.cameraButton)
    }
    
}
